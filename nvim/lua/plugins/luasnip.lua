-- print('In luasnips!')
return {
  "L3MON4D3/LuaSnip",
  event = "InsertEnter",
  build = "make install_jsregexp", -- optional: regex support for some snippets
  config = function()
    local luasnip = require("luasnip")

    -- Load your custom Lua snippets
    -- require("luasnip.loaders.from_lua").load({
    --   paths = { vim.fn.stdpath("config") .. "/LuaSnips" }
    -- })
    require("luasnip.loaders.from_lua").lazy_load({paths = "~/.config/nvim/LuaSnip/"})
    require("luasnip.loaders.from_lua").lazy_load({paths = "~/.config/nvim/LuaSnip/tex"})

    -- Enable auto-expanding snippets on file change
    luasnip.config.set_config({
      history = true,
      updateevents = "TextChanged,TextChangedI",
      -- Enable autotriggered snippets
      enable_autosnippets = true,
      -- Use Tab (or some other key if you prefer) to trigger visual selection
      store_selection_keys = "<Tab>",
      expand_or_jumpable = true,
      jumpable = true,
    })

    -- Optional keymaps
    vim.keymap.set({ "i", "s" }, "<Tab>", function()
      if luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      else
        vim.api.nvim_feedkeys("\t", "n", false)
      end
    end, { silent = true })

    vim.keymap.set({ "i", "s" }, "<S-Tab>", function()
      if luasnip.jumpable(-1) then
        luasnip.jump(-1)
      end
    end, { silent = true })
  end,
}
