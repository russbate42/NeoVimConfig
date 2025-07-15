
print('NeoVim main init.lua loading..')
print('')
print("For spelling type >>> :setlocal spell spelllang=en_us")
print('')


print('Loading custom configurations ..')
require('config')

vim.cmd([[colorscheme tokyonight]])

print('Done loading configs and plugins ..')


