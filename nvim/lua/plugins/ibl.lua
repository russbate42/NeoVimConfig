-- print('In ibl script')
return {
    {"lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    ---@module "ibl"
    ---@type ibl.config
    opts = {},
    lazy = false,
    config = function()
        require('ibl').setup({
            -- Your configuration options here
            indent = {
                char = "│",
                tab_char = "│",
            },
            scope = {
                enabled = false,
            },
        })
    end
    },

}

