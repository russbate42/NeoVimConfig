
print('NeoVim main init.lua loading..')
print('')
print("For spelling type >>> :setlocal spell spelllang=en_us")
print("To suppress VimTeX warnings type >>> :lua vim.g.vimtex_quickfix_mode = 0")
print('')

print('Loading custom configurations ..')
require('config')

vim.cmd([[colorscheme dracula]])

print('Done loading configs and plugins ..')

-- Color for Telescope!
vim.api.nvim_set_hl(0, "TelescopeNormal", { bg = "none" })
vim.api.nvim_set_hl(0, "TelescopeBorder", { bg = "none" })
vim.api.nvim_set_hl(0, "TelescopePromptNormal", { bg = "none" })
vim.api.nvim_set_hl(0, "TelescopePromptBorder", { bg = "none" })
vim.api.nvim_set_hl(0, "TelescopeResultsNormal", { bg = "none" })
vim.api.nvim_set_hl(0, "TelescopeResultsBorder", { bg = "none" })
vim.api.nvim_set_hl(0, "TelescopePreviewNormal", { bg = "none" })
vim.api.nvim_set_hl(0, "TelescopePreviewBorder", { bg = "none" })

-- -- Color for Harpoon 2
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
vim.api.nvim_set_hl(0, "FloatBorder", { bg = "none" })

