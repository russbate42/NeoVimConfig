-- print('In autocomplete.lua')
return {
  -- VimTeX completion source for nvim-cmp
  {
    'micangl/cmp-vimtex',
    dependencies = { 'lervag/vimtex', 'hrsh7th/nvim-cmp' },
    ft = 'tex',
  },

  {
  "hrsh7th/nvim-cmp",
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
    'hrsh7th/cmp-omni',
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-cmdline",
    "micangl/cmp-vimtex",
    "L3MON4D3/LuaSnip",
    "saadparwaiz1/cmp_luasnip",
  },
  config = function()
    local cmp = require("cmp")
    local luasnip = require("luasnip")
    cmp.setup({
      snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end,
      },
      mapping = cmp.mapping.preset.insert({
        -- Open menu
        ['<C-Space>'] = cmp.mapping.complete(),

        -- Scroll Menu
        ['<C-j>'] = cmp.mapping.scroll_docs(-4),
        ['<C-k>'] = cmp.mapping.scroll_docs(4),
        ['<C-c>'] = cmp.mapping.close(),
        ['<C-e>'] = cmp.mapping.abort(),

        -- Use Tab and Shift-Tab to navigate through popup menu
        ['<Tab>'] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_next_item()
          elseif luasnip.locally_jumpable(1) then
            luasnip.jump(1)
          else
            fallback()
          end
        end, { 'i', 's' }),
        ['<S-Tab>'] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_prev_item()
          elseif luasnip.jumpable(-1) then
            luasnip.jump(-1)
          else
            fallback()
          end
        end, { 'i', 's' }),
        -- confirmation
        ['<CR>'] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.confirm({
                behavior = cmp.ConfirmBehavior.Replace,
                select = true,
            })
          else
            fallback()
          end
        end, { 'i', 's' }),
      }),
      sources = cmp.config.sources({
        { name = 'nvim_lsp',
          trigger_characters = {},
          keyword_length = 1,
        },
        { name = 'luasnip',
          trigger_characters = {},
          keyword_length = 1,
        }, -- For luasnip users.
        { name = 'buffer',
          trigger_characters = { 'buff' },
          keyword_length = 3,
        },
        { name = 'path',
          trigger_characters = { '/' },
          keyword_length = 1,
        },
      }),

      -- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
      cmp.setup.cmdline({ '/', '?' }, {
        mapping = cmp.mapping.preset.cmdline(),
        sources = {
          { name = 'buffer' }
        }
      }),

    -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
    -- cmp.setup.cmdline(':', {
    --   mapping = cmp.mapping.preset.cmdline(),
    --   sources = cmp.config.sources(
    --     { name = 'path' },
    --     { name = 'cmdline' }
    --   )
    -- })

    -- -- Set configuration for specific filetype.
    -- cmp.setup.filetype('gitcommit', {
    --   sources = cmp.config.sources({
    --     { name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were using it.
    --     { name = 'buffer' },
    --     })
    -- })

    })

    -- Set up omnifunc for tex files as fallback
    vim.api.nvim_create_autocmd('FileType', {
      pattern = 'tex',
      callback = function()
        vim.opt_local.omnifunc = 'vimtex#complete#omnifunc'
      end,
    })

    -- LaTeX-specific overrides
    cmp.setup.filetype('tex', {
      sources = cmp.config.sources({
        { name = 'vimtex',
          option = {
            -- Configure what types of completions to show
            info_in_menu = true,
            info_in_window = true,
            info_max_length = 60,
            match_against_info = true,
            symbols_in_menu = true,
          },
        },
        { name = 'omni' },      -- Fallback to VimTeX omnifunc
        { name = 'luasnip', keyword_length = 1 },  -- Snippets auto-trigger
        { name = 'buffer', keyword_length = 12 },  -- Buffer manual only
        { name = 'path' },
      }),

      -- LaTeX-specific formatting
      formatting = {
        format = function(entry, vim_item)
          -- Add source name to the menu
          vim_item.menu = ({
            vimtex = '[VimTeX]',
            omni = '[Omni]',
            luasnip = '[Snippet]',
            buffer = '[Buffer]',
            path = '[Path]',
          })[entry.source.name]
          return vim_item
        end,
      }
    })

    -- Markdown-specific overrides
    cmp.setup.filetype('md', {
      sources = cmp.config.sources({
        { name = 'luasnip', keyword_length = 1 },  -- Snippets auto-trigger
        { name = 'buffer', keyword_length = 12 },  -- Buffer manual only
        { name = 'path' },
      })
    })

  end,
  },
}
