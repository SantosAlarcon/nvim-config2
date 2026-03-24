# futheline.nvim

A lightweight, highly customizable Neovim statusline plugin with per-component styling, border effects, and preset themes.

## Features

- **24 Built-in Components**: Mode, Git, File, LSP, Diagnostics, Treesitter, and more
- **Per-Component Styling**: Each component has independent icon, text, and background colors
- **Icon Badges**: Icons render as colored badges with their own highlight groups
- **Border Styles**: `round`, `arrow`, `slant`, `minimal`, or `none` per component
- **Shared Borders**: Adjacent bordered components share edges for a unified look
- **8 Preset Themes**: TokyoNight, Catppuccin, Dracula, Nord, Rose Pine, Nightfox, Gruvbox, Everblush
- **Mode Customization**: Choose icon style (Vim/Neovim/Custom), label format, and per-mode colors
- **gitsigns.nvim Integration**: Git branch, diff stats, and blame support
- **Full Width**: Statusline spans the entire window width
- **Lazy Loading Ready**: Components only compute when needed

## Requirements

- Neovim 0.9+
- Nerd Fonts (for icons)
- `gitsigns.nvim` (required for git features)
- Optional: `mini.icons` (filetype icons)

## Installation

### lazy.nvim

```lua
{
  'futheline',
  dir = 'lua/futheline',
  lazy = false,
  dependencies = {
    'gitsigns.nvim',
  },
}
```

### packer.nvim

```lua
use {
  'futheline',
  dir = 'lua/futheline',
  opt = false,
  requires = { 'gitsigns.nvim' },
}
```

## Quick Start

```lua
require('futheline').setup({
  theme = 'tokyonight',
  components = {
    { 'mode', border = 'round' },
    { 'git', border = 'round' },
    { 'file', border = 'arrow' },
    { 'lsp' },
    { 'diagnostics', border = 'slant' },
    { 'position' },
  },
})
```

## Configuration

```lua
require('futheline').setup({
  -- Theme: 'tokyonight', 'catppuccin', 'dracula', 'nord',
  --        'rose_pine', 'nightfox', 'gruvbox', 'everblush',
  --        'github_dark', 'github_dimmed', 'github_light',
  --        or a custom theme table
  theme = 'tokyonight',

  -- Mode component settings
  mode = {
    icon_style = 'vim',       -- 'vim', 'neovim', 'custom', or nil
    custom_icon = '',        -- Used when icon_style = 'custom'
    mode_style = 'icon_long', -- 'short', 'long', 'icon', 'icon_short', 'icon_long'
    colors = {},              -- Per-mode color overrides
    labels = {},              -- Per-mode label overrides
  },

  -- Default icon badge highlight
  default_icon_hl = {
    fg = '#7aa2f7',
    bg = '#1a1b26',
  },

  -- Default border for components without explicit border
  default_border = 'round',

  -- Git component settings
  git = {
    show_diff = false,  -- Show added/removed/changed counts
  },

  -- Component order and per-component options
  components = {
    { 'mode', border = 'round' },
    { 'git', show_diff = true, border = 'round' },
    { 'file', border = 'arrow' },
    { 'filetype' },
    { 'indent' },
    { 'lsp', show_server = true },
    { 'diagnostics', border = 'slant' },
    { 'position' },
  },

  -- Separators between components
  separators = {
    left = ' ',
    right = ' ',
  },
})
```

### Theme

#### Available Themes

| Theme | Description |
|-------|-------------|
| `tokyonight` | Tokyo Night Storm |
| `catppuccin` | Catppuccin Mocha |
| `dracula` | Dracula Official |
| `nord` | Nord Polar Night |
| `rose_pine` | Rose Pine Main |
| `nightfox` | Nightfox Nordfox |
| `gruvbox` | Gruvbox Dark |
| `everblush` | Everblush Dark |
| `github_dark` | GitHub Dark |
| `github_dimmed` | GitHub Dimmed |
| `github_light` | GitHub Light |

#### Custom Theme Example

```lua
-- Create lua/futheline/themes/my_theme.lua
local M = {}

M.mode = {
  n = { fg = '#98c379', bg = '#282c34' },
  i = { fg = '#61afef', bg = '#282c34' },
  v = { fg = '#c678dd', bg = '#282c34' },
  R = { fg = '#e06c75', bg = '#282c34' },
  c = { fg = '#d19a66', bg = '#282c34' },
  t = { fg = '#56b6c2', bg = '#282c34' },
}

M.git = { fg = '#61afef', bg = '#282c34' }
M.file = { fg = '#abb2bf', bg = '#282c34' }
M.lsp = { fg = '#c678dd', bg = '#282c34' }
M.diagnostic = { fg = '#e06c75', bg = '#282c34' }
M.position = { fg = '#abb2bf', bg = '#282c34' }

return M
```

```lua
-- Usage
require('futheline').setup({
  theme = 'my_theme',
})
```

### Mode

#### Icon Styles

| Style | Icon | Description |
|-------|------|-------------|
| `vim` | 󰊠 | Vim logo |
| `neovim` |  | Neovim logo |
| `custom` | (user-defined) | Any character |
| `nil` | (none) | No icon |

#### Mode Styles

| Style | Example Output |
|-------|----------------|
| `short` | N, I, V, R |
| `long` | NORMAL, INSERT, VISUAL |
| `icon` | 󰊠 |
| `icon_short` | 󰊠 N |
| `icon_long` | 󰊠 NORMAL |

#### Per-Mode Colors

```lua
mode = {
  icon_style = 'vim',
  mode_style = 'icon_long',
  colors = {
    -- Full mode strings
    n = { fg = '#9ece6a', bg = '#1f2335' },
    i = { fg = '#7aa2f7', bg = '#1f2335' },
    v = { fg = '#bb9af7', bg = '#1f2335' },
    R = { fg = '#f7768e', bg = '#1f2335' },
    c = { fg = '#e0af68', bg = '#1f2335' },
    t = { fg = '#7dcfff', bg = '#1f2335' },
    -- Mode aliases
    normal   = { fg = '#9ece6a', bg = '#1f2335' },
    insert   = { fg = '#7aa2f7', bg = '#1f2335' },
    visual   = { fg = '#bb9af7', bg = '#1f2335' },
    replace  = { fg = '#f7768e', bg = '#1f2335' },
    command  = { fg = '#e0af68', bg = '#1f2335' },
    terminal = { fg = '#7dcfff', bg = '#1f2335' },
  },
}
```

### Components

See [REFERENCE.md](REFERENCE.md) for detailed documentation on all 24 components.

### Borders

#### Border Styles

| Style | Characters | Appearance |
|-------|------------|------------|
| `round` | ╭ ╮ ╰ ╯ | Rounded corners |
| `arrow` |     | Powerline style |
| `slant` | ▸ ◂ | Arrow pointers |
| `minimal` | │ │ │ │ | Vertical bars |
| `none` | (none) | No border |

#### Per-Component Borders

```lua
components = {
  { 'mode', border = 'round' },
  { 'git', border = 'arrow' },
  { 'file', border = 'slant' },
  { 'lsp', border = 'minimal' },
  { 'diagnostics', border = 'none' },
}
```

## Troubleshooting

### Icons Not Showing

Ensure Nerd Fonts are installed and configured:

```lua
-- In init.lua
vim.opt.guifont = 'FiraCode Nerd Font:h12'
```

### Plugin Not Loading

Check that the plugin directory is in your runtimepath:

```lua
vim.opt.runtimepath:append(vim.fn.stdpath('config') .. '/lua/futheline')
```

### Statusline Not Updating

Verify setup was called:

```lua
-- After setup, this should return the statusline function
print(vim.wo.statusline)
```

### gitsigns Integration Not Working

Ensure gitsigns is loaded before futheline checks for it:

```lua
-- In your gitsigns config
require('gitsigns').setup({
  on_attach = function()
    -- gitsigns setup code
  end,
})
```

For more component-specific troubleshooting, see [REFERENCE.md](REFERENCE.md).

## API

### `require('futheline').setup(config)`

Initialize the plugin with configuration.

### `require('futheline').get()`

Returns the current statusline string. Called automatically by Neovim via `%!v:lua.require("futheline").get()`.

## Auto-Updates

The statusline automatically updates on these events:

| Event | Trigger |
|-------|---------|
| ModeChanged | Vim mode changes |
| BufEnter | Buffer switch |
| WinEnter | Window focus |
| FileType | Filetype change |
| DiagnosticChanged | Diagnostics update |
| LspAttach | LSP client attaches |
| LspDetach | LSP client detaches |
| VimResized | Window resize |
| WinScrolled | Window scroll |
| ColorScheme | Theme change |
| GitSignsUpdate | Git changes (gitsigns) |
