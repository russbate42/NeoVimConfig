return {
    "neovim/nvim-lspconfig",

    dependencies = {
        "hrsh7th/cmp-nvim-lsp",
        -- { "antosha417/nvim-lsp-file-operations", config = true },
        "williamboman/mason-lspconfig.nvim",
    },
    config = function()
        -- Keymaps for LSP actions
        vim.api.nvim_create_autocmd("LspAttach", {
            callback = function(args)
                local opts = { noremap = true, silent = true, buffer = args.buf }

                opts.desc = "Show LSP references"
                vim.keymap.set("n", "gR", "<cmd>Telescope lsp_references<CR>", opts)

                opts.desc = "Go to declaration"
                vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)

                opts.desc = "Show LSP definitions"
                vim.keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts)

                opts.desc = "Show LSP implementations"
                vim.keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts)

                opts.desc = "Show LSP type definitions"
                vim.keymap.set("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", opts)

                opts.desc = "See available code actions"
                vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)

                opts.desc = "Smart rename"
                vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)

                opts.desc = "Show buffer diagnostics"
                vim.keymap.set("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", opts)

                opts.desc = "Show line diagnostics"
                vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts)

                -- Go to previous diagnostic
                vim.keymap.set("n", "[d", function()
                    vim.diagnostic.jump({ count = -1 })
                end, { desc = "Go to previous diagnostic" })

                -- Go to next diagnostic
                vim.keymap.set("n", "]d", function()
                    vim.diagnostic.jump({ count = 1 })
                end, { desc = "Go to next diagnostic" })

                opts.desc = "Show documentation for what is under cursor"
                vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)

                opts.desc = "Restart LSP"
                vim.keymap.set("n", "<leader>rs", ":LspRestart<CR>", opts)
            end,
        })

        -- Configure diagnostic signs
        vim.diagnostic.config({
            -- signs = false,  -- Disable sign column icons
            signs = {
                text = {
                    -- Classic / clean
                    [vim.diagnostic.severity.ERROR] = "\u{F0E6} ",  -- nf-fa-times_circle      U+F057
                    [vim.diagnostic.severity.WARN]  = "\u{f071} ",  -- nf-fa-exclamation_tri   U+F071
                    [vim.diagnostic.severity.HINT]  = "\u{EA61} ",  -- nf-md-lightbulb_on      U+F0335
                    [vim.diagnostic.severity.INFO]  = "\u{F05A} ",  -- nf-fa-info_circle       U+F05A
                }
            },
        })
    end,
}
-- Nerd Font Glyphs
-- -- ERROR
-- "\u{F057} "   -- times-circle (filled)
-- "\u{EA87} "   -- codicon error
-- "\u{F467} "   -- octicon x-circle
-- "\u{F00D} "   -- plain x
-- "\u{F188} "   -- bug
-- "\u{F0E6} "   -- flame (oct)
-- "\u{F1E2} "   -- bomb
-- "\u{F529} "   -- skull-ish (md)
--
-- -- WARN
-- "\u{F071} "   -- warning triangle (classic)
-- "\u{EA6C} "   -- codicon warning
-- "\u{F421} "   -- octicon alert
-- "\u{F02D6} "  -- md alert-outline
-- "\u{F06A} "   -- exclamation-circle
-- "\u{F1E5} "   -- signal/attention
--
-- -- HINT
-- "\u{F0EB} "   -- lightbulb outline (fa)
-- "\u{F400} "   -- octicon light-bulb
-- "\u{EA61} "   -- codicon lightbulb
-- "\u{F06E8} "  -- md lightbulb-on-outline
-- "\u{F0335} "  -- md lightbulb-on
-- "\u{F059} "   -- question-circle
--
-- -- INFO
-- "\u{F05A} "   -- info-circle (classic)
-- "\u{EA74} "   -- codicon info
-- "\u{F449} "   -- octicon info
-- "\u{F02FC} "  -- md information
-- "\u{F129} "   -- fa info (thin)
-- "\u{F05A} "   -- (dupe of classic, keep for compare)
-- Fun signs
                    -- [vim.diagnostic.severity.ERROR] = "💥",
                    -- [vim.diagnostic.severity.WARN] = "🤔",
                    -- [vim.diagnostic.severity.HINT] = "💡",
                    -- [vim.diagnostic.severity.INFO] = "ℹ️",
-- Colorful circles
-- ERROR = "🔴", WARN = "🟡", HINT = "🔵", INFO = "⚪"
-- Fun
-- ERROR = "💀", WARN = "🤔", HINT = "✨", INFO = "👀"
-- Professional but clearer
-- ERROR = "✘", WARN = "▲", HINT = "»", INFO = "●"
-- Arrows
-- ERROR = "▶", WARN = "▶", HINT = "▶", INFO = "▶"
