return {
    {"tpope/vim-fugitive",
        config = function()
            vim.keymap.set("n", "<leader>ga", ":Git add<CR>", {})
            vim.keymap.set("n", "<leader>gc", ":Git commit<CR>", {})
            vim.keymap.set("n", "<leader>gd", ":Git diff<CR>", {})
        end
    },
    {"lewis6991/gitsigns.nvim",
        config = function()
            local gitsigns = require('gitsigns')
            gitsigns.setup()

            vim.keymap.set("n", "<leader>gh", ":Gitsigns preview_hunk<CR>", {})
            vim.keymap.set("n", "<leader>gi",
                ":Gitsigns preview_hunk_inline<CR>", {})
            vim.keymap.set("n", "<leader>gb",
                    ":Gitsigns toggle_current_line_blame<CR>", {})
            vim.keymap.set("n", ']h',
                function()
                    gitsigns.nav_hunk('next')
                end, {})
            vim.keymap.set("n", '[h',
                function()
                    gitsigns.nav_hunk('prev')
                end, {})
        end
    },
    {"NeogitOrg/neogit",
        lazy = true,
        dependencies = {
            "nvim-lua/plenary.nvim", --required for telescope
            "nvim-telescope/telescope.nvim", -- optional
            -- "sindrets/diffview.nvim",        -- optional
            -- "m00qek/baleia.nvim",            -- optional
        },
        cmd = "Neogit",
        keys = {
            { "<leader>gg", "<cmd>Neogit<cr>", desc = "Show Neogit UI" }
        },
        config = function()
            require("neogit").setup({
                -- Enable telescope integration explicitly
                integrations = {
                    telescope = true,
                    diffview = false, -- Enables diff popup integration with diffview
                },
            })
        end,
    }
}
