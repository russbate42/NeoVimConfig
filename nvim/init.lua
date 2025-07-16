
print('NeoVim main init.lua loading..')
print('')
print("For spelling type >>> :setlocal spell spelllang=en_us")
print("To suppress VimTeX warnings type >>> :lua vim.g.vimtex_quickfix_mode = 0")
print('')

print('Loading custom configurations ..')
require('config')

vim.cmd([[colorscheme dracula]])

-- For Markdown Preview
vim.cmd([[let g:mkdp_preview_options = {
    \ 'mkit': {},
    \ 'katex': {},
    \ 'uml': {},
    \ 'maid': {},
    \ 'disable_sync_scroll': 0,
    \ 'sync_scroll_type': 'middle',
    \ 'hide_yaml_meta': 1,
    \ 'sequence_diagrams': {},
    \ 'flowchart_diagrams': {},
    \ 'content_editable': v:false,
    \ 'disable_filename': 0,
    \ 'toc': {}
    \ }
]])
print('Done loading configs and plugins ..')


