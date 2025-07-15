print('In plugins init.lua')
-- print(package.path)

return {

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

}

