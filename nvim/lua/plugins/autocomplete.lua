-- print('In autocomplete.lua')
return {
  "hrsh7th/nvim-cmp",
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-cmdline",
    "L3MON4D3/LuaSnip",
    "saadparwaiz1/cmp_luasnip",
  },
  config = function()
    local cmp = require("cmp")
    local luasnip = require("luasnip")
    cmp.setup({
      snippet = {
        expand = function(args)
          require("luasnip").lsp_expand(args.body)
        end,
      },
      mapping = cmp.mapping.preset.insert({
        -- Open menu
        ['<C-Space>'] = cmp.mapping.complete(),

        -- Scroll Menu
        ["<C-j>"] = cmp.mapping.scroll_docs(-4),
        ["<C-k>"] = cmp.mapping.scroll_docs(4),
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<C-c>"] = cmp.mapping.close(),
        ["<C-e>"] = cmp.mapping.abort(),

        -- confirmation
        ["<CR>"] = cmp.mapping.confirm({
          behavior = cmp.ConfirmBehavior.Replace,
          select = true,
        }),
        -- Use Tab and Shift-Tab to navigate through popup menu
        ['<Tab>'] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_next_item()
          elseif luasnip.expand_or_jumpable() then
            luasnip.expand_or_jump()
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
      }),
      sources = cmp.config.sources({
        { name = 'nvim_lsp',
          trigger_characters = {},
          keyword_length = 1,
        },
        { name = 'luasnip',
          trigger_characters = {},
          keyword_length = 1,}, -- For luasnip users.
        { name = 'buffer',
          trigger_characters = { 'buff' },
          keyword_length = 3,},
        { name = 'path',
          trigger_characters = { '/' },
          keyword_length = 1,},
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

    -- LaTeX-specific overrides
      cmp.setup.filetype('tex', {
        sources = cmp.config.sources({
          { name = 'luasnip', keyword_length = 1 },  -- Snippets auto-trigger
          { name = 'buffer', keyword_length = 12 },  -- Buffer manual only
          { name = 'path' },
        })
      }),

    -- Markdown-specific overrides
      cmp.setup.filetype('md', {
        sources = cmp.config.sources({
          { name = 'luasnip', keyword_length = 1 },  -- Snippets auto-trigger
          { name = 'buffer', keyword_length = 12 },  -- Buffer manual only
          { name = 'path' },
        })
      })
    })
  end,
}
