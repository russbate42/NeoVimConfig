return {
    "xiyaowong/virtcolumn.nvim",
    config = function()
        local allowed_ft = { "lua", "python", "javascript" }

        vim.api.nvim_create_autocmd({ "BufEnter", "FileType", "User", "LspAttach" }, {
            pattern = { "*", "TransparentClear" },
            callback = function()
                vim.api.nvim_set_hl(0, "VirtColumn", { fg = "#FF0000",
                    bg = "NONE", force = true })
                vim.api.nvim_set_hl(0, "ColorColumn", { bg = "NONE" })
                -- Check if we are in an allowed filetype
                if vim.tbl_contains(allowed_ft, vim.bo.filetype) then
                    -- -- Enable for this specific buffer
                    vim.b.virtcolumn_enabled = 1
                    vim.g.virtcolumn_char = '.' -- char to display the line
                    vim.g.virtcolumn_priority = 10 -- priority of extmark
                    -- MANDATORY: Tell Neovim WHERE to put the column (e.g., column 80)
                    vim.opt_local.colorcolumn = "80"
                else
                    vim.opt_local.colorcolumn = ""
                    vim.b.virtcolumn_enabled = 0
                end
            end,
        })
    end,
}
