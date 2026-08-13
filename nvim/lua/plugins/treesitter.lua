-- print('In treesitter')
return {
    "nvim-treesitter/nvim-treesitter",
    branch = "main",
    lazy = false,
    build = ":TSUpdate",
    config = function()
        local ts = require("nvim-treesitter")
        ts.install({
            "lua", "vim", "markdown", "markdown_inline", "bash", "python",
            "javascript", "typescript", "html", "css", "json", "yaml", "bibtex",
        })
        vim.api.nvim_create_autocmd("FileType", {
            callback = function(args)
                local lang = vim.treesitter.language.get_lang(args.match)
                if not lang then return end
                if pcall(vim.treesitter.start) then
                    vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
                end
            end,
        })
    end,
}
