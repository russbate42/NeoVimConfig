return {
    'stevearc/oil.nvim',
    dependencies = { { "nvim-mini/mini.icons", opts = {} } },
    lazy = false,
    config = function()
        require("oil").setup({
            view_options = {
                show_hidden = true,
            },
            float = {
                padding = 4,
                max_width = 90,
                max_height = 40,
                border = "rounded",
                win_options = { winblend = 0 },
                get_win_title = function()
                    return "  OIL "
                end,
                title_pos = "center",
            },
        })

        vim.api.nvim_set_hl(0, "OilHeaderBig", { fg = "#e5c07b", bold = true })

        local ns = vim.api.nvim_create_namespace("oil_header")

        local banner = {
            "   ██████╗ ██╗██╗     ",
            "  ██╔═══██╗██║██║     ",
            "  ██║   ██║██║██║     ",
            "  ██║   ██║██║██║     ",
            "  ╚██████╔╝██║███████╗",
            "   ╚═════╝ ╚═╝╚══════╝",
            "  [ edit your filesystem ]",
        }

        local function set_banner(buf)
            vim.api.nvim_buf_clear_namespace(buf, ns, 0, -1)
            local virt_lines = {}
            for _, line in ipairs(banner) do
                table.insert(virt_lines, { { line, "OilHeaderBig" } })
            end
            vim.api.nvim_buf_set_extmark(buf, ns, 0, 0, {
                virt_lines = virt_lines,
                virt_lines_above = true,
            })
            vim.schedule(function()
                vim.api.nvim_win_set_cursor(0, {1, 0})
                vim.cmd("normal! zb")
            end)
        end

        vim.api.nvim_create_autocmd("User", {
            pattern = "OilEnter",
            callback = function(args)
                if vim.api.nvim_win_get_config(0).relative ~= "" then return end
                local buf = args.buf
                vim.api.nvim_buf_clear_namespace(buf, ns, 0, -1)
                set_banner(buf)
            end,
        })

        -- vim.api.nvim_create_autocmd({"BufWritePost", "BufWriteCmd", "BufWrite", "User"}, {
        --     pattern = {"oil://*", "Oil*"},
        --     callback = function(args)
        --         vim.notify("event: " .. args.event .. " pattern: " .. args.match)
        --     end,
        -- })

        vim.api.nvim_create_autocmd("User", {
            pattern = "OilMutationComplete",
            callback = function()
                local buf = vim.api.nvim_get_current_buf()
                vim.api.nvim_buf_clear_namespace(buf, ns, 0, -1)
                set_banner(buf)
            end,
        })
    end,
}
