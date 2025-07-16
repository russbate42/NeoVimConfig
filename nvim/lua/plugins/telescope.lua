print('In telescope')
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
                    -- Default configuration for telescope goes here:
                    layout_config = {
                        vertical = { width = 0.5 }
                        -- other layout configuration here
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
                pickers = {},
                extensions = { fzy_native = {
                    override_generic_sorter = false,
                    override_file_sorter = true,
                    }
                }
            })

            -- Key Mappings
            local builtin = require('telescope.builtin')
            vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
            vim.keymap.set('n', '<leader>gi', builtin.git_files, {})
            vim.keymap.set('n', '<leader>ps', function()
                builtin.grep_string({ search = vim.fn.input("Grep > ") });
            end)

            -- Making it look cool
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
