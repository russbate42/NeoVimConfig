-- print('In vimtex')
return {
    "lervag/vimtex",
    lazy = false,     -- we don't want to lazy load VimTeX
    -- tag = "v2.15", -- uncomment to pin to a specific release

    init = function()
        -- VimTeX configuration goes here, e.g.
        vim.g.vimtex_view_method = "zathura"
        vim.g.tex_flavour = 'latex'
        vim.g.vimtex_view_general_options = [['--unique file:@pdf\#src:@line@tex']]

        -- Enable folding
        vim.g.vimtex_fold_enabled = 1
    end,

    config = function()
        
        -- Set up folding with proper timing
        vim.api.nvim_create_autocmd("FileType", {
            pattern = "tex",
            callback = function()
                vim.g.vimtex_fold_enabled = 1
                vim.g.vimtex_fold_types = {
                    -- Enable other fold types
                    preamble = 1,      -- Fold document preamble
                    parts = 1,         -- Fold \part commands
                    chapters = 1,      -- Fold \chapter commands
                    comments = 1,      -- Fold comment blocks
                    sections = {
                        sections = {
                            'part',
                            'chapter',
                            'section',
                            'subsection',
                            'subsubsection',
                        }
                    },
                    envs = {
                        blacklist = {},  -- Environments to exclude from folding
                        whitelist = {
                            'figure',
                            'subfigure',
                            'wrapfigure',
                            'table',
                            'equation',
                            'align',
                            'enumerate',
                            'itemize',
                            'proof',
                            'titlepage',
                            'center'
                        }
                    },
                    markers = {-- Custom markers for manual folding
                        open = '<<<',
                        close = '>>>'
                    },
                }
                -- Ensure fold method is set
                vim.opt_local.foldmethod = "expr"
                vim.opt_local.foldexpr = "vimtex#fold#level(v:lnum)"
                vim.opt_local.foldenable = true
                vim.opt_local.foldlevel = 3  -- Try adjusting this
            end,
        })

    end
}

