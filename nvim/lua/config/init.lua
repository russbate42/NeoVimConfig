-- print("In config init..")

require('config.options')
require('config.keymaps')
require('config.autocmds')

print("")
print('Setting up Lazy ..')
require('config.lazy')
require('lazy').setup("plugins")

