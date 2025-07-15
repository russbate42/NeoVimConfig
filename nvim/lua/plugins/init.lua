print('In plugins init.lua')
-- print(package.path)
-- require('colorscheme'),

return {

    -- Tokyo Night
    {"folke/tokyonight.nvim",
        priority = 1000,
        lazy=false,
        config = function()
            require("tokyonight").setup({
                style = "storm",
                transparent = false,
            })
        end,
    },

    {"kylechui/nvim-surround",
    version = "^3.0.0", -- Use for stability; omit to use `main` branch for the latest features
--     event = "VeryLazy",
    config = function()
        require("nvim-surround").setup({
            -- Configuration here, or leave empty to use defaults
        })
    end
    },

    {'m4xshen/autoclose.nvim',
    config = function()
        require("autoclose").setup()
    end
    },

    {'numToStr/Comment.nvim',
    config = function()
        require('Comment').setup()
    end
    },

    {'HiPhish/rainbow-delimiters.nvim'},

    -- install without yarn or npm
    {"iamcco/markdown-preview.nvim",
        lazy=false,
        cmd = { "MarkdownPreviewToggle", "MarkdownPreview",
            "MarkdownPreviewStop" },
        ft = { "markdown" },
        build = function() vim.fn["mkdp#util#install"]() end,
    },


    -- install with yarn or npm
    -- { "iamcco/markdown-preview.nvim",
    --   cmd = { "MarkdownPreviewToggle", "MarkdownPreview",
    --       "MarkdownPreviewStop" },
    --   lazy = false,
    --   build = "cd app && yarn install",
    --   init = function()
    --     vim.g.mkdp_filetypes = { "markdown" }
    --   end,
    --   ft = { "markdown" },
    -- },

}
