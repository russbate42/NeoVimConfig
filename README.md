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
Run the following commands in order:
Make sure all recommended packages are installed. NeoVim may still work without
these packages but for best results make sure your system has them available.

**Install Recommended Packages**
```bash
sudo apt install nodejs npm
sudo npm install -g neovim
cargo install ripgrep
cargo install tree-sitter-cli
sudo apt install luarocks
```

In addition, make sure a basic python3 installation is set up. Install the
pynvim pacakge with pip or conda `pip install pynvim` or if it is already
installed: `pip install pynvim --upgrade`

**Optional** Alias the neovim appimage to something like `nv` or `nvim`.

Finally, run the setup script.
`source setup_nvim.sh`

If the LSP server does not work, you may have an outdated version of node. Check
`node --version`. Neovim LSP requries `Node.js 14+`. To update on Ubuntu, run
```bash
sudo apt-get remove --purge libnode-dev nodejs npm
sudo apt-get autoremove
curl -fsSL https://deb.nodesource.com/setup_lts.x | sudo -E bash -
sudo apt-get update
sudo apt-get install -y nodejs
node --version
npm --version
```

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

**VimTeX**

**Telescope**

**Harpoon2**

#### Package Wish List
 - Vim Fugutive
 - Undo-tree
 - nvim gpt

### To Do
 - [x] Telescope
 - [x] Harpoon2
 - [x] Update nvim-cmp with LSP features
 - - [x] install pyright
 - [ ] Install vim fugitive & other git helpers
 - [ ] Install an AI client

### Recent Changes
 - [x] Install nvim-cmp with LuaSnips
 - [x] VimTeX

### Structure
This neovim config uses the following structure:
```bash
├── clean_nvim.sh
├── nvim
│   ├── init.lua
│   ├── lua
│   │   ├── config
│   │   │   ├── autocmds.lua
│   │   │   ├── init.lua
│   │   │   ├── keymaps.lua
│   │   │   ├── lazy.lua
│   │   │   └── options.lua
│   │   └── plugins
│   │       ├── autocomplete.lua
│   │       ├── colorscheme.lua
│   │       ├── harpoon.lua
│   │       ├── ibl.lua
│   │       ├── init.lua
│   │       ├── luasnip.lua
│   │       ├── markdown_preview.lua
│   │       ├── telescope.lua
│   │       ├── transparent.lua
│   │       ├── treesitter.lua
│   │       └── vimtex.lua
│   └── LuaSnip
│       ├── all.lua
│       ├── cpp.lua
│       ├── lua.lua
│       ├── markdown.lua
│       ├── python.lua
│       ├── tex
│       │   ├── delimiters.lua
│       │   ├── documents.lua
│       │   ├── environments.lua
│       │   ├── figures.lua
│       │   ├── fonts.lua
│       │   ├── general.lua
│       │   ├── math.lua
│       │   ├── physics.lua
│       │   └── sections.lua
│       └── texput.log
├── README.md
└── setup_nvim.sh
```

## User
### Gentle Introduction to Vim
Vim is a text editor which aims to improve typing efficiency. The user interacts
with the text through [motions](#motions) (fast ways of jumping the cursor
around), modes, and many other tricks. Modes are displayed on the bottom left,
unless you are in normal mode which will desplay nothing. `Esc` Will always
return you to normal mode. The modes are outlined below, and commands to enter
modes will always assume normal mode to start.

**Normal**
This is the Vim default. All motions are available. Navigate using `h,j,k,l`.
See [motions](#motions).

**Insert**
You are already familiar with insert mode. Assume every text editor you
have used so far in your life is stuck in insert mode. When a user types,
characters are added at the position of the cursor. To start with, you can
simply use Vim like the editors you are used to and type normally. As you learn
vim shortcuts, this will require you to exit insert mode and leverage other
modes. Motions are only available _outside_ of insert mode.
`i` to insert at _the start_ of the cursor.
`a` to insert at _the end_ of the cursor.
`cc` delete line and enter insert mode at the beginning.

**Visual-Line**
Use this for selecting lines. `S-V`.

**Visual**
Like visual line, but used to select sequential text, from substrings of lines
to multiline. `v`

**Visual-Block**
Use to select rectangular chunks of code. `C-V` Be warned, pasting from yanked
blocks will overwrite. In other words, pasting does not create new lines.

**Replace**
This is an overtype mode. `S-R` Typing will replace characters as needed.
Motions not available.

Vim power-users leverage modes with motions to move text around in the most
efficient way.

`:q` to exit vim, or see [This
tutorial](https://github.com/hakluke/how-to-exit-vim)

### Motions
Motions are vimspeak for simply moving the cursor around the screen quickly.

#### Horizontal Motions
- `f` jump cursor forward to character
- `F` jump cursor backward to character
- `t` jump cursor forward, stop before character
- `T` jump cursor backward, stop before character
- `g_` jump to last character in line
- `$` jump to end of line
- `^` jump to end first non-white character (start of indent)

#### Vertical Motions
- `gg` jump to top of file
- `G` jump to bottom of file

### Windowing
 - `:split` for a hotizontal split
 - `:vsplit` for a vertical split
 - `C-w <h/j/k/l>` to move between panes 
 - `C-w <Left/Down/Up/Right>` to move between panes 
 - `C-w <H/J/K/L>` to swap panes 
 - `C-w +/-` increase/decrease height (ex. `20<C-w>+`)
 - `C-w >/<` increase/decrease width (ex. `30<C-w><`)
 - `C-w _` set height (ex. `50<C-w>_`)
 - `C-w |` set width (ex. `50<C-w>|`)
 - `C-w =` equalize width and height of all windows

### Package Specific commands
#### Autocomplete
`<C-space>` will open the autocomplete menu.

#### Telescope
- `<leader>pc` Choose colors IN REAL TIME HOW COOL IS THAT!?
- `<leader>pb` Fuzzy find current buffer.
- `<leader>pf` Fuzzy find current directory and down for files.
- `<leader>pg` Fuzzy find all git files in current directory.
- `<leader>pg` Search through saved markers.
- `<leader>bi` Search through bibliography.
- - `<C-e>` Put whole citation down
- - `<C-c>` Put citation title down

#### VimTeX
`<leader>tc` Toggle conceal for math symbols.
`<leader>lv` View output.
`<leader>lc` Compile.
`<leader>ll` Compile and view.

`:cw` quickfix menu toggle
`:copen` quickfix menu open
`:cclose` quickfix menu close

#### Formatting and Linting
`<leader>mp` Auto-format 
`<leader>mp` Auto-format 

### LSP, Autocomplete, and AI integration
#### Autocomplete
Currently using nvim-cmp

#### LSP
Currently, only a few languages are installed. To install more, there are three
options.
**Option 1:** Edit the `plugins/mason.lua` file to add your language. 
```lua
require("mason-lspconfig").setup({
  ensure_installed = {
    "pyright",    -- Python
    "lua_ls",     -- Lua
    "rust_analyzer", -- Rust
    "<your_lsp_here>", -- New Language
  },
```
**Option 2:** Use the Mason installer, see `:Mason`
**Option 3:** Enable automatic istallation in the `plugins/mason.lua`
```lua
  automatic_installation = true,
```
currently set to false.

#### AI Integration
WIP

### General Vim Commands
- `s` delete characters under cursor and start typing. Works in normal, visual,
- `r` replace character with what you type next. Works in visual block mode.
- `R` replace all characters as typed. Also known as overtype.
- `o` insert new line below and start in insert mode
- `O` insert new line above and start in insert mode
- `I` when in visual block mode to insert multiple characters at once
`gqq` to split lines to whatever text width is. Works in visual line mode as
well.
- `dd` delete line
- `dk` delete line above
- `dj` delete line below
- `.` repeat last action
- `>>` indent line. Use single `>` if in visual line mode.
- `=` match indetation when in visual line mode.

#### Cursor and Marks
- `~` Change case of character under cursor or visually selected
- `m<key>` Mark location with `<key>`
- ``<key>` Jump to location marked with `<key>`
- `o` insert new line below and start in insert mode
- `O` insert new line above and start in insert mode
- `\`\`` jump to last cursor location

#### Copy and Paste (Yank and Put)
- `o` insert new line below and start in insert mode
- `O` insert new line above and start in insert mode

#### Macros
- `q` to start recording a macro. Macros record all keystrokes for later
repeats. Macros are saved in the "key register" (available key)
- `<registered key>` to repeat the macro
- `<n><registered key>` to repeat the macro n times. For example if a macro is
recorded in 'r', `5@r` will repeat this macro five times.

#### Folding
Helpful for debugging with bracket errors

- `zo` - Open fold under cursor
- `zc` - Close fold under cursor
- `za` - Toggle fold under cursor
- `zR` - Open all folds
- `zM` - Close all folds
- `zj/zk` - Jump to next/previous fold

Folds can also be created by highlighting lines and pressing `zf`

#### Writing
Navigate paragraphs with `}` and `{`.

Reformat current line with `gqq`, or the content under visual selection with `gq`. This will respect the `textwidth` variable.

#### Scrolling
Here are the essential screen scrolling hotkeys in Neovim:
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

These work in normal mode. The `Ctrl-f`/`Ctrl-b` and `Ctrl-d`/`Ctrl-u` are
probably the most commonly used for quick navigation!
### Available Color Schemes
If telescope is installed correctly, try `leader<pc>` to choose colors from a
menu. Otherwise, these are auto-loaded in colorscheme.lua
 - tokyonight
 - catppuccin
 - gruvbox
 - nord
 - nightfox
 - rose-pine
 - kanagawa
 - onedark

