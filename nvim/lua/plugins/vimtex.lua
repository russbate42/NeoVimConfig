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

        -- quickfix menu options
        -- Don't auto-open quickfix on warnings, only on errors
        vim.g.vimtex_quickfix_open_on_warning = 0

        -- Don't auto-focus the quickfix window when it opens
        vim.g.vimtex_quickfix_autoclose_after_keystrokes = 0
    end,

    config = function()

        -- VimTeX concealment
        vim.g.vimtex_syntax_conceal = {
            accents = 1,
            ligatures = 1, 
            cites = 1,
            fancy = 1,
            spacing = 1,
            greek = 1,  -- Enable Greek letter concealment
            math_bounds = 1,
            math_delimiters = 1,
            math_fracs = 1,
            math_super_sub = 1,
            math_symbols = 1,
            sections = 0,
            styles = 1,
        }
        
        -- Recent change highlighting
        vim.g.vimtex_matchparen_enabled = 0

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

