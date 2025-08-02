-- print('In telescope')
return {
    {"nvim-telescope/telescope-fzy-native.nvim",
        submodules = true
    },

    {'nvim-telescope/telescope.nvim', tag = '0.1.8',
    -- or                              , branch = '0.1.x',
        dependencies = { 'nvim-lua/plenary.nvim' },
        config = function()
            local tel = require("telescope")
            local fzy_native = require('telescope').load_extension('fzy_native')
            tel.setup({
                defaults = {
                    winblend = 15,
                    layout_strategy = "flex",
                    layout_config = {
                        -- Flex will automatically switch between horizontal and vertical
                        -- based on window size, but you can customize the breakpoints
                        width = function(_, max_columns, _)
                            return math.min(max_columns, 120)
                        end,
                        height = function(_, _, max_lines)
                            return math.min(max_lines, 40)
                        end,
                        
                        -- Custom breakpoint for switching layouts
                        flip_columns = 100,  -- Switch to vertical when width < 100
                        flip_lines = 20,     -- Switch to horizontal when height < 20
                        
                        horizontal = {
                            width = 0.9,
                            height = 0.8,
                            preview_width = 0.6,
                        },
                        vertical = {
                            width = 0.9,
                            height = 0.9,
                            preview_height = 0.6,
                            preview_cutoff = 0,
                            mirror = true
                        },
                    },
                    mappings = {
                        i = {
                            ["<C-h>"] = "which_key",
                            ["<C-q>"] = function() end,  -- Make quickfix key do nothing
                            ["<M-q>"] = function() end,
                        },
                        n = {
                            ["<C-q>"] = function() end,
                            ["<M-q>"] = function() end,
                        }
                    }
                },
                pickers = {
                    marks = {
                        previewer = true,
                        -- "ascending" or "descending"
                        sorting_strategy = "ascending",
                        sort_lastused = true,
                        layout_strategy = "flex",
                    },
                    current_buffer_fuzzy_find = {
                        previewer = true,
                        sorting_strategy = "ascending",
                        layout_strategy = "flex",
                        skip_empty_lines = true,
                        -- or "respect_case", "smart_case"
                        case_mode = "ignore_case",
                    },
                    colorscheme = {
                        enable_preview = true,
                        -- theme = "dropdown",
                        layout_strategy = "flex",
                        previewer = true,
                    },
                    grep_string = {
                        previewer = true,
                        layout_strategy = "flex",
                        only_sort_text = true,
                        word_match = "-w",
                    },
                    oldfiles = {
                        prompt_title = "Recent Files",
                        cwd_only = false,
                        layout_strategy = "flex",
                        previewer = true
                    }
                },
                extensions = {
                    fzy_native = {
                        override_generic_sorter = false,
                        override_file_sorter = true,
                    },
                    bibtex = {
                        -- Use context awareness
                        context = true,
                        -- Use non-contextual behavior if no context found
                        -- This setting has no effect if context = false
                        context_fallback = true,
                        search_keys = { 'label', 'title', 'year', 'author', 'publisher' }
                    }
                }
            })

            -- Key Mappings
            local builtin = require('telescope.builtin')
            vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
            vim.keymap.set('n', '<leader>pg', builtin.git_files, {})
            vim.keymap.set('n', '<leader>ps', function()
                builtin.grep_string({ search = vim.fn.input("Grep > ") })
            end)

            -- Marks
            vim.keymap.set('n', '<leader>pm', builtin.marks,
                { desc = 'Search Marks' })

            -- Old Files
            vim.keymap.set('n', '<leader>po', '<cmd>Telescope oldfiles<cr>',
                { desc = 'Find Recent Files'} )

            -- Buffer fuzzy find
            vim.keymap.set('n', '<leader>pb', builtin.current_buffer_fuzzy_find,
                { desc = 'Current Buffer Fuzzy Find' })

            -- Colorscheme
            vim.keymap.set('n', '<leader>pc', builtin.colorscheme,
                { desc = 'Colorscheme' })

            -- Making it look cool (transparent)
            vim.api.nvim_set_hl(0, "TelescopeNormal", { bg = "none" })
            vim.api.nvim_set_hl(0, "TelescopeBorder", { bg = "none" })
            vim.api.nvim_set_hl(0, "TelescopePromptNormal", { bg = "none" })
            vim.api.nvim_set_hl(0, "TelescopePromptBorder", { bg = "none" })
            vim.api.nvim_set_hl(0, "TelescopeResultsNormal", { bg = "none" })
            vim.api.nvim_set_hl(0, "TelescopeResultsBorder", { bg = "none" })
            vim.api.nvim_set_hl(0, "TelescopePreviewNormal", { bg = "none" })
            vim.api.nvim_set_hl(0, "TelescopePreviewBorder", { bg = "none" })
        end,
    }
}
