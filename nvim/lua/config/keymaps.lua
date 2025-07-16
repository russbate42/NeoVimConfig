
print("In VIM keymaps")

vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", ":Ex<CR>")

-- VIMTEX KEYMAPS
vim.keymap.set("n", "<leader>lc", ":VimtexCompile<CR>")
vim.keymap.set("n", "<leader>lv", ":VimtexView<CR>")
vim.keymap.set("n", "<leader>ll", ":VimtexCompile<CR> | :VimtexView<CR>")

