
-- print("In VIM keymaps")

vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", ":Ex<CR>")

-- VIMTEX KEYMAPS
vim.keymap.set("n", "<leader>lc", ":VimtexCompile<CR>")
vim.keymap.set("n", "<leader>lv", ":VimtexView<CR>")
vim.keymap.set("n", "<leader>ll", ":VimtexCompile<CR> | :VimtexView<CR>")
-- VimTeX Syntax Highlighting Extras
vim.keymap.set('n', '<leader>tc', function()
    if vim.o.conceallevel == 0 then
        vim.o.conceallevel = 2
        print("Conceal enabled")
    else
        vim.o.conceallevel = 0
        print("Conceal disabled")
    end
    end,
    { desc = 'Toggle conceal' }
)

-- LUASNIP KEYMAPS
vim.keymap.set("n", "<leader>rs", function()
    require("luasnip").cleanup()
    require("luasnip.loaders.from_lua").load({paths = "~/.config/nvim/snippets/"})
    print("Snippets reloaded!")
end, { desc = "Reload snippets" })

