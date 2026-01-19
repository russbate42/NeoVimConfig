return {
    "mfussenegger/nvim-lint",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
        local lint = require("lint")

        lint.linters_by_ft = {
            python = { "ruff" },
        }

        -- Auto-lint on save and text change
        vim.api.nvim_create_autocmd({ "BufWritePost", "BufReadPost", "InsertLeave" }, {
            callback = function()
                require("lint").try_lint()
            end,
        })
    end,
}
