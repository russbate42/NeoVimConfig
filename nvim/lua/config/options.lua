
-- print('In VIM Options')

vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.wrap = true
vim.opt.textwidth = 80

-- Folding options
vim.opt.foldmethod = "manual" -- can be indent for automatic folding
vim.opt.foldlevel = 2        -- Start with some folds open
vim.opt.foldnestmax = 3      -- Limit fold depth

