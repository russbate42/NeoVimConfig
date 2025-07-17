-- print("colorscheme.lua loaded!")
-- ~/.config/nvim/lua/plugins/colorscheme.lua
return {

    -- Tokyo Night
    {
        "folke/tokyonight.nvim",
        priority = 1000,
        lazy=false,
        config = function()
            require("tokyonight").setup({
                style = "storm",
                transparent = false,
                terminal_colors = true,
                styles = {
                    comments = { italic = true },
                    keywords = { italic = true },
                    functions = {},
                    variables = {},
                },
                sidebars = { "qf", "vista_kind", "terminal", "packer" },
                day_brightness = 0.3,
                hide_inactive_statusline = false,
                dim_inactive = false,
                lualine_bold = false,
            })
        end,
    },

    -- Catppuccin - Soothing pastel theme
    {
        "catppuccin/nvim",
        name = "catppuccin",
        priority = 1000,
        enabled = true,
        config = function()
            require("catppuccin").setup({
                flavour = "mocha", -- latte, frappe, macchiato, mocha
                background = {
                    light = "latte",
                    dark = "mocha",
                },
                transparent_background = false,
                show_end_of_buffer = false,
                term_colors = false,
                dim_inactive = {
                    enabled = true,
                    shade = "dark",
                    percentage = 0.15,
                },
                styles = {
                    comments = { "italic" },
                    conditionals = { "italic" },
                },
                integrations = {
                    cmp = true,
                    gitsigns = true,
                    nvimtree = true,
                    telescope = true,
                    notify = false,
                    mini = false,
                },
            })
        end,
    },

    -- Gruvbox - Retro groove colors
    {
        "ellisonleao/gruvbox.nvim",
        priority = 1000,
        enabled = true,
        config = function()
            require("gruvbox").setup({
                terminal_colors = true,
                undercurl = true,
                underline = true,
                bold = true,
                italic = {
                    strings = true,
                    emphasis = true,
                    comments = true,
                    operators = false,
                    folds = true,
                },
                strikethrough = true,
                invert_selection = false,
                invert_signs = false,
                invert_tabline = false,
                invert_intend_guides = false,
                inverse = true,
                contrast = "", -- can be "hard", "soft" or empty string
                palette_overrides = {},
                overrides = {},
                dim_inactive = false,
                transparent_mode = false,
            })
            -- vim.cmd.colorscheme("gruvbox")
        end,
    },

    -- Dracula - Dark theme with purple accent
    {
        "Mofiqul/dracula.nvim",
        priority = 1000,
        enabled = true,
        config = function()
            require("dracula").setup({
                colors = {
                    bg = "#282A36",
                    fg = "#F8F8F2",
                    selection = "#44475A",
                    comment = "#6272A4",
                    red = "#FF5555",
                    orange = "#FFB86C",
                    yellow = "#F1FA8C",
                    green = "#50fa7b",
                    purple = "#BD93F9",
                    cyan = "#8BE9FD",
                    pink = "#FF79C6",
                    bright_red = "#FF6E6E",
                    bright_green = "#69FF94",
                    bright_yellow = "#FFFFA5",
                    bright_blue = "#D6ACFF",
                    bright_magenta = "#FF92DF",
                    bright_cyan = "#A4FFFF",
                    bright_white = "#FFFFFF",
                    menu = "#21222C",
                    visual = "#3E4452",
                    gutter_fg = "#4B5263",
                    nontext = "#3B4048",
                    white = "#ABB2BF",
                    black = "#191A21",
                },
                show_end_of_buffer = true,
                transparent_bg = false,
                lualine_bg_color = "#44475a",
                italic_comment = true,
            })
        end,
    },

    -- Nord - Arctic, north-bluish color palette
    {
        "shaunsingh/nord.nvim",
        priority = 1000,
        enabled = true,
        config = function()
            vim.g.nord_contrast = true
            vim.g.nord_borders = false
            vim.g.nord_disable_background = false
            vim.g.nord_italic = false
            vim.g.nord_uniform_diff_background = true
            vim.g.nord_bold = false
            require("nord").set()
        end,
    },

    -- Onedark - Atom's iconic One Dark theme
    {
        "navarasu/onedark.nvim",
        priority = 1000,
        enabled = true,
        config = function()
            require("onedark").setup({
                style = "dark", -- dark, darker, cool, deep, warm, warmer, light
                transparent = false,
                term_colors = true,
                ending_tildes = false,
                cmp_itemkind_reverse = false,
                toggle_style_key = nil,
                toggle_style_list = {"dark", "darker", "cool", "deep", "warm", "warmer", "light"},
                code_style = {
                    comments = "italic",
                    keywords = "none",
                    functions = "none",
                    strings = "none",
                    variables = "none"
                },
                lualine = {
                    transparent = false,
                },
                colors = {},
                highlights = {},
                diagnostics = {
                    darker = true,
                    undercurl = true,
                    background = true,
                },
            })
        end,
    },

    -- Nightfox - Highly customizable theme
    {
        "EdenEast/nightfox.nvim",
        priority = 1000,
        enabled = true,
        config = function()
            require("nightfox").setup({
                options = {
                    compile_path = vim.fn.stdpath("cache") .. "/nightfox",
                    compile_file_suffix = "_compiled",
                    transparent = false,
                    terminal_colors = true,
                    dim_inactive = false,
                    module_default = true,
                    colorblind = {
                        enable = false,
                        simulate_only = false,
                        severity = {
                            protan = 0,
                            deutan = 0,
                            tritan = 0,
                        },
                    },
                    styles = {
                        comments = "italic",
                        conditionals = "NONE",
                        constants = "NONE",
                        functions = "NONE",
                        keywords = "NONE",
                        numbers = "NONE",
                        operators = "NONE",
                        strings = "NONE",
                        types = "NONE",
                        variables = "NONE",
                    },
                    inverse = {
                        match_paren = false,
                        visual = false,
                        search = false,
                    },
                },
                palettes = {},
                specs = {},
                groups = {},
            })
        end,
    },

    -- Rose Pine - Soho vibes for Neovim
    {
        "rose-pine/neovim",
        name = "rose-pine",
        priority = 1000,
        enabled = true,
        config = function()
            require("rose-pine").setup({
                variant = "auto", -- auto, main, moon, dawn
                dark_variant = "main",
                bold_vert_split = false,
                dim_nc_background = false,
                disable_background = false,
                disable_float_background = false,
                disable_italics = false,
                groups = {
                    background = "base",
                    background_nc = "_experimental_nc",
                    panel = "surface",
                    panel_nc = "base",
                    border = "highlight_med",
                    comment = "muted",
                    link = "iris",
                    punctuation = "subtle",
                    error = "love",
                    hint = "iris",
                    info = "foam",
                    warn = "gold",
                    headings = {
                        h1 = "iris",
                        h2 = "foam",
                        h3 = "rose",
                        h4 = "gold",
                        h5 = "pine",
                        h6 = "foam",
                    }
                },
                highlight_groups = {
                    ColorColumn = { bg = "rose" },
                    CursorLine = { bg = "foam", blend = 10 },
                    StatusLine = { fg = "love", bg = "love", blend = 10 },
                }
            })
        end,
    },

    -- Kanagawa - Inspired by famous painting "The Great Wave off Kanagawa"
    {
        "rebelot/kanagawa.nvim",
        priority = 1000,
        enabled = true,
        config = function()
            require("kanagawa").setup({
                compile = false,
                undercurl = true,
                commentStyle = { italic = true },
                functionStyle = {},
                keywordStyle = { italic = true},
                statementStyle = { bold = true },
                typeStyle = {},
                transparent = false,
                dimInactive = false,
                terminalColors = true,
                colors = {
                    palette = {},
                    theme = { wave = {}, lotus = {}, dragon = {}, all = {} },
                },
                overrides = function(colors)
                    return {}
                end,
                theme = "wave",
                background = {
                    dark = "wave",
                    light = "lotus"
                },
            })
        end,
    }

}
