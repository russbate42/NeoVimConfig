# Russell's Neovim

This is a repository for maintaining versions of neovim

## Setup
This package uses nvim stable release appimages. It is only tested on `x86_64`
Ubuntu architecture.

### Download NeoVim
Go to the [Releases](https://github.com/neovim/neovim/releases) page. Under the
latest stable build, select the app image for the appropriate architecture `x86_64`.

Simply change the permissions on the appimage `chmod u+x nvim-linux-x86_64.appimage`

Currently working with the following version:
```bash
NVIM v0.11.3
Build type: Release
LuaJIT 2.1.1741730670
Run "nvim -V1 -v" for more info
```

### Setup Local
Make sure all packages are installed

**Recommended Packages**
```bash
sudo apt install nodejs npm
sudo npm install -g neovim
cargo install ripgrep
sudo apt install luarocks
```
For LSP compatibility with python
```bash
npm install -g pyright
```

In addition, make sure a basic python3 installation is set up.

Run the following commands in order:

`source setup_nvim.sh`

**Optional** Alias the neovim appimage to something like `nv` or `nvim`.

## Development
**Reminder** When creating new plugin files run `source setup_nvim.sh`

### Packages

**nvim-surround**

**autoclose**

**comment**

**rainbow-delimeters**

**Markdown Preview**
Note: To make this work, run this from the neovim command line
`:call mkdp#util#install()`

**Treesitter**
Just basic, we can add more features later.

**Transparent**
`:TransparentEnable` or `:TransparentDisable` or `:TransparentToggle`

**Indent Blankine**

**LuaSnips**

**nvim-cmp**

#### Available Color Schemes
These are auto-loaded in colorscheme.lua
 - tokyonight
 - catppuccin
 - gruvbox
 - nord
 - nightfox
 - rose-pine
 - kanagawa
 - onedark

#### Package Wish List
 - VimTeX
 - Telescope
 - Harpoon2
 - Undo-tree
 - nvim gpt

### To Do
#### In Order
 - [x] Install nvim-cmp with LuaSnips
 - [ ] VimTeX
 - [ ] Telescope
 - [ ] Harpoon2
 - [ ] Update nvim-cmp with LSP features
 - - [ ] install pyright

#### Unordered
 - [ ] Install an AI client

### Recent Changes
 - [x] Install nvim-cmp with LuaSnips

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

## User

### Motions
Here are the essential screen scrolling hotkeys in Neovim:

#### Scrolling
**Basic Scrolling:**
- `Ctrl-f` - Scroll forward (down) one full screen
- `Ctrl-b` - Scroll backward (up) one full screen
- `Ctrl-d` - Scroll down half a screen
- `Ctrl-u` - Scroll up half a screen

**Line-by-line scrolling:**
- `Ctrl-e` - Scroll down one line (cursor stays in place)
- `Ctrl-y` - Scroll up one line (cursor stays in place)

**Cursor positioning:**
- `zz` - Center current line on screen
- `zt` - Move current line to top of screen
- `zb` - Move current line to bottom of screen

**Page navigation:**
- `gg` - Go to top of file
- `G` - Go to bottom of file
- `H` - Move cursor to top of visible screen
- `M` - Move cursor to middle of visible screen
- `L` - Move cursor to bottom of visible screen

**Smooth scrolling (if enabled):**
- `Ctrl-e` / `Ctrl-y` can be held for smooth scrolling
- Some users remap `j`/`k` with `gj`/`gk` for visual line movement

**Useful combinations:**
- `Ctrl-o` - Jump back to previous cursor position
- `Ctrl-i` - Jump forward to next cursor position
- `''` (two single quotes) - Jump to last cursor position

**Pro tip:** You can prefix most of these with numbers (e.g., `5Ctrl-e` scrolls 5 lines down).

These work in normal mode. The `Ctrl-f`/`Ctrl-b` and `Ctrl-d`/`Ctrl-u` are probably the most commonly used for quick navigation!
