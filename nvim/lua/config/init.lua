print("In config init..")

require('config.options')
require('config.keymaps')
require('config.autocmds')

print("")
print('Setting up Lazy ..')
require('config.lazy')
require('lazy').setup("plugins")

-- Setup lazy.nvim
-- require("lazy").setup({
--   spec = {
--     import={"plugins"}
--   },
--   -- Configure any other settings here. See the documentation for more details.
--   -- colorscheme that will be used when installing plugins.
--   install = { colorscheme = { "habamax" } },
--   -- automatically check for plugin updates
--   checker = { enabled = true },
-- })


