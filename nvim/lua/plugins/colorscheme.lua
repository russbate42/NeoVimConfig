print("colorscheme.lua loaded!")
-- ~/.config/nvim/lua/plugins/colorscheme.lua
return {
    -- Tokyo Night
    {
        "folke/tokyonight.nvim",
        priority = 1000,
        lazy=false,
        config = function()
            require("tokyonight").setup({
                style = "storm",
                transparent = false,
            })
        end,
    }
}
