return {
    "xiyaowong/virtcolumn.nvim",
    config = function()

        vim.api.nvim_create_autocmd(
            { "BufEnter", "FileType", "User", "LspAttach", "BufWinEnter" },
            {
            pattern = { "*", "TransparentClear" },
            callback = function()
                local allowed_ft = { "lua", "python", "javascript" }
                local current_ft = vim.bo.filetype
                local ns = vim.api.nvim_create_namespace("virtcolumn")
                -- #FF0000
                vim.api.nvim_set_hl(0, "VirtColumn", { fg = "#5F615E",
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
                    -- 2. COMPLETELY disable for netrw and others
                    vim.opt_local.colorcolumn = ""
                    vim.b.virtcolumn_enabled = 0
                    vim.b.virtcolumn_char = " "

                    -- 2. Force-clear any existing marks in the virtcolumn namespace
                    vim.api.nvim_buf_clear_namespace(0, ns, 0, -1)

                    -- 3. Specifically for netrw: redraw the screen to clear artifacts
                    if current_ft == "netrw" then
                        vim.cmd("redraw")
                    end
                end
            end
            }
        )
    end
}
