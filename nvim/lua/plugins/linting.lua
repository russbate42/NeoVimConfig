return {
    "mfussenegger/nvim-lint",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
        local lint = require("lint")

        -- mypy is off by default; toggle it per project
        vim.api.nvim_create_user_command("StartMypy", function()
            lint.linters_by_ft.python = { "mypy" }
            lint.try_lint()
        end, {})
        vim.api.nvim_create_user_command("StopMypy", function()
            lint.linters_by_ft.python = nil
            vim.diagnostic.reset(lint.get_namespace("mypy"))
        end, {})

        -- Use the active conda env's mypy (matches CI's pin)
        -- fall back to Mason's
        lint.linters.mypy.cmd = function()
            local prefix = vim.env.CONDA_PREFIX
            if prefix and vim.fn.executable(prefix .. "/bin/mypy") == 1 then
                return prefix .. "/bin/mypy"
            end
            return "mypy" -- resolves to Mason's, which is on Neovim's PATH
        end

        -- Auto-lint on save and text change
        vim.api.nvim_create_autocmd(
            { "BufWritePost", "BufReadPost", "InsertLeave" },
            { callback = function() require("lint").try_lint() end, }
        )
    end,
}
