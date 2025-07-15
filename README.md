# Russell's Neovim

This is a repository for maintaining versions of neovim

## Setup
Run the following commands in order:

`source setup_nvim.sh`

## User

## Development

### Packages

**nvim-surround**

**autoclose**

**comment**

**rainbow-delimeters**

#### Package Wish List
 - Treesitter
 - Markdown Preview
 - Transparent
 - LuaSnips
 - Indent Blankline
 - Undo-tree

### To Do
- [ ]

### Structure
This neovim config uses the following structure:
```bash
├── nvim
│   ├── after
│   ├── init.lua
│   └── lua
│       ├── config
│       │   ├── autocmds.lua
│       │   ├── init.lua
│       │   ├── keymaps.lua
│       │   ├── lazy.lua
│       │   └── options.lua
│       └── plugins
│           └── init.lua
```

