-- print('In treesitter')
return {
    {"nvim-treesitter/nvim-treesitter",
    branch = 'master',
    lazy = false,
    build = ":TSUpdate",
    event = { "BufReadPost", "BufNewFile" },
    config = function()
        require("nvim-treesitter.configs").setup({
        ensure_installed = {
            "lua", "vim", "markdown", "bash", "python", "javascript",
            "typescript", "html", "css", "json", "yaml", "bibtex", "zsh"
        },
        highlight = {
            enable = true,
            additional_vim_regex_highlighting = { "latex" },
        },
        indent = {
            enable = true,
        },
        autotag = {
            enable = true,
        }
        })
    end
    }
}
