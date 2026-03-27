# futheline.nvim - Component Reference

Complete documentation for all 24 built-in components.

## Table of Contents

- [Presets](#presets)
- [File Components](#file-components)
- [Git Components](#git-components)
- [LSP Components](#lsp-components)
- [Vim State Components](#vim-state-components)
- [Context Components](#context-components)
- [All Component Options](#all-component-options)

---

## Presets

Presets define the visual style of the statusline. Each preset includes:
- Border style
- Whether icons are shown
- Padding spacing
- Default component layout

```lua
require('futheline').setup({
  preset = 'rounded',
  theme = 'github_dark',
})
```

### Available Presets

| Preset | Border | Icons | Padding | Separator | Default Components |
|--------|--------|-------|--------|----------|-------------------|
| `standard` | none | no | compact | space | mode, file, diagnostics, lsp, position |
| `rounded` | round | yes | medium | space | mode, git, file, indent, diagnostics, lsp, position |
| `sharp` | sharp | no | compact | none | mode, file, diagnostics, lsp, position |
| `minimal` | none | no | tight | dot | mode, position |
| `soft` | round | yes | spacious | vertical | mode, git, file, indent, diagnostics, lsp, position |
| `vscode` | none | no | compact | none | mode, git, file, indent, diagnostics, lsp, position, selection |

### Preset Details

#### `standard`
Minimal, clean look without borders or icons. Perfect for a distraction-free experience.
```
[N] [init.lua] [2 errors] [LSP] [Ln 42 Col 8]
```

#### `rounded`
Rounded corners with icons. Balanced between visual appeal and information density.
```
╭ N ╮ [init.lua] [2 errors] [LSP] [Ln 42]
```

#### `sharp`
Angular borders without icons. Clean, technical aesthetic.
```
[N] [init.lua] [2 errors] [LSP] [Ln 42]
```

#### `minimal`
Ultra-compact with dot separators. Maximum information in minimal space.
```
[N]·[init.lua]·[position]
```

#### `soft`
Wide spacing with vertical separators. Elegant and spacious.
```
│ N │ [init.lua] │ [2 errors] │ [Ln 42] │
```

#### `vscode`
VSCode-inspired style. No borders, no icons, maximum information density.
```
[N] [main] [init.lua] [2 errors] [LSP] [Ln 42, Col 8] [5L 12C]
```

### Customizing Presets

Add or override components while keeping the preset's visual style:

```lua
require('futheline').setup({
  preset = 'rounded',
  components = {
    { 'mode' },      -- From preset
    { 'git' },       -- From preset
    { 'file' },      -- From preset
    { 'indent' },    -- From preset
    { 'lsp' },       -- Adding custom component
    { 'position' },  -- From preset
  },
})
```

---

## File Components

## File Components

### `file`

Displays the current filename with an icon. Shows modification and readonly status.

```lua
{ 'file' }
-- Output: 󰈙 init.lua
-- With modifications: 󰈙 init.lua ●
-- With readonly: 󰈙 init.lua 
```

**Options**: None

**Requires**: `mini.icons` (optional, for filetype-specific icons)

---

### `filetype`

Displays the file type with an icon.

```lua
-- Default: show full filetype
{ 'filetype' }
-- Output: 󰌜 lua

-- Abbreviated filetype
{ 'filetype', short = true }
-- Output: 󰌜 l
```

| Option | Type | Default | Description |
|--------|------|---------|-------------|
| `short` | boolean | `false` | Show abbreviated filetype |

**Requires**: `mini.icons` (optional, for filetype-specific icons)

---

### `encoding`

Displays the file encoding.

```lua
-- Default: always show
{ 'encoding' }
-- Output: UTF-8

-- Hide when UTF-8
{ 'encoding', hide_utf8 = true }
-- Output: (hidden when UTF-8)
```

| Option | Type | Default | Description |
|--------|------|---------|-------------|
| `hide_utf8` | boolean | `false` | Hide when encoding is UTF-8 |

---

### `format`

Displays the line ending format.

```lua
{ 'format' }
-- Output: LF    (Unix)
-- Output: CRLF  (DOS/Windows)
-- Output: CR    (Classic Mac)
```

**Options**: None

---

### `indent`

Displays the indentation style.

```lua
{ 'indent' }
-- Output: Spaces: 2  (when expandtab is true)
-- Output: Tabs: 4    (when expandtab is false)
```

**Options**: None

---

### `filesize`

Displays the human-readable file size.

```lua
{ 'filesize' }
-- Output: 100B   (bytes)
-- Output: 1.5KB  (kilobytes)
-- Output: 2.3MB  (megabytes)
-- Output: 1.0GB  (gigabytes)
```

**Options**: None

**Notes**:
- Hidden for empty files or non-existent files
- Updates on buffer changes

---

### `bufname`

Displays the full buffer path.

```lua
-- Default: absolute path
{ 'bufname' }
-- Output: /home/user/project/lua/futheline/init.lua

-- Relative to current directory
{ 'bufname', relative = true }
-- Output: lua/futheline/init.lua

-- Truncated from project root
{ 'bufname', root = true }
-- Output: futheline/init.lua

-- Maximum length
{ 'bufname', max_length = 40 }
-- Output: .../futheline/init.lua
```

| Option | Type | Default | Description |
|--------|------|---------|-------------|
| `relative` | boolean | `false` | Use relative path from cwd |
| `root` | boolean | `false` | Truncate from project root |
| `max_length` | number | `nil` | Maximum characters to display |

---

## Git Components

### `git`

Displays the current Git branch. Requires `gitsigns.nvim`.

```lua
-- Branch only
{ 'git' }
-- Output: 󰘬 main

-- With diff stats
{ 'git', show_diff = true }
-- Output: 󰘬 main  +2  -1  3
```

| Option | Type | Default | Description |
|--------|------|---------|-------------|
| `show_diff` | boolean | `false` | Show added/removed/changed counts |

**Requires**: `gitsigns.nvim`

**Icons**:
- 󰘬 (branch)
-  (added count)
-  (removed count)
-  (changed count)

**Notes**:
- Hidden when not in a git repository

---

### `gitblame`

Displays blame information for the current line.

```lua
-- Short: author name
{ 'gitblame' }
-- Output: John Doe

-- Full blame text
{ 'gitblame', full = true }
-- Output: John Doe - 2 hours ago

-- Truncated
{ 'gitblame', max_length = 30 }
-- Output: John Do... (truncated to 30 chars)
```

| Option | Type | Default | Description |
|--------|------|---------|-------------|
| `full` | boolean | `false` | Show full blame text instead of just author |
| `max_length` | number | `nil` | Maximum characters to display |

**Requires**: `gitsigns.nvim`

**Notes**:
- Hidden when no blame information available
- Updates when cursor moves to different line

---

### `githunks`

Displays the diff hunks for the current line.

```lua
{ 'githunks' }
-- Output:  -5  +10  (removed 5 lines, added 10 lines in current hunk)
```

**Options**: None

**Requires**: `gitsigns.nvim`

**Notes**:
- Hidden when not in a hunk
- Shows cumulative changes within the current hunk

---

### `gitcommit`

Displays indicator when editing a git commit.

```lua
{ 'gitcommit' }
-- Output: COMMIT   (in gitcommit buffers)
-- Output: REBASE   (in gitrebase buffers)
```

**Options**: None

**Notes**:
- Hidden in regular buffers
- Automatically detects gitcommit and gitrebase filetypes

---

## LSP Components

### `lsp`

Displays the attached LSP client.

```lua
-- Simple indicator
{ 'lsp' }
-- Output: LSP  (when client attached)

-- With server name
{ 'lsp', show_server = true }
-- Output: LSP lua_ls

-- Multiple servers
{ 'lsp', show_server = true }
-- Output: LSP lua_ls
```

| Option | Type | Default | Description |
|--------|------|---------|-------------|
| `show_server` | boolean | `false` | Show the LSP server name |

**Notes**:
- Hidden when no LSP clients attached
- Shows only the first server name

---

### `lspservers`

Displays all attached LSP servers.

```lua
-- All servers, space-separated
{ 'lspservers' }
-- Output: lua_ls ts_ls json_ls

-- Limited to N servers
{ 'lspservers', max = 2 }
-- Output: lua_ls ts_ls +3  (when more than 2)

-- Custom separator
{ 'lspservers', separator = '|' }
-- Output: lua_ls|ts_ls|json_ls
```

| Option | Type | Default | Description |
|--------|------|---------|-------------|
| `separator` | string | `' '` | Separator between server names |
| `max` | number | `nil` | Maximum servers to show (shows +N for remainder) |

---

### `lspprogress`

Displays LSP progress messages from work done progress.

```lua
{ 'lspprogress' }
-- Output: Indexing...

{ 'lspprogress', max_length = 30 }
-- Output: Indexing project files...
```

| Option | Type | Default | Description |
|--------|------|---------|-------------|
| `max_length` | number | `nil` | Maximum characters to display |

**Notes**:
- Hidden when no progress messages
- Shows the first active progress message
- Updates on LSP progress notifications

---

### `diagnostics`

Displays LSP diagnostic counts with icons.

```lua
{ 'diagnostics' }
-- Output:  2  5  (2 errors, 5 warnings)
-- Output: (hidden when no diagnostics)
```

**Options**: None

**Icons**:
-  (errors)
-  (warnings)
-  (hints)
-  (info)

**Notes**:
- Hidden when all counts are zero
- Each diagnostic type only shows when count > 0

---

## Vim State Components

### `mode`

Displays the current Vim mode with icon and label.

```lua
-- Default configuration
{ 'mode', border = 'round' }

-- Different icon style
{ 'mode', icon_style = 'neovim' }

-- Custom icon
{ 'mode', icon_style = 'custom', custom_icon = '' }

-- Different mode style
{ 'mode', mode_style = 'short' }
{ 'mode', mode_style = 'long' }
{ 'mode', mode_style = 'icon' }
{ 'mode', mode_style = 'icon_short' }
{ 'mode', mode_style = 'icon_long' }
```

**Mode Icon Styles**:
| Style | Icon | Example |
|-------|------|---------|
| `vim` | 󰊠 | 󰊠 NORMAL |
| `neovim` |  |  NORMAL |
| `custom` | (user-defined) |  NORMAL |
| `nil` | (none) | NORMAL |

**Mode Label Styles**:
| Style | n | i | v | R | c | t |
|-------|---|---|---|---|---|---|
| `short` | N | I | V | R | C | T |
| `long` | NORMAL | INSERT | VISUAL | REPLACE | COMMAND | TERMINAL |
| `icon` | 󰊠 | 󰊠 | 󰊠 | 󰊠 | 󰊠 | 󰊠 |
| `icon_short` | 󰊠 N | 󰊠 I | 󰊠 V | 󰊠 R | 󰊠 C | 󰊠 T |
| `icon_long` | 󰊠 NORMAL | 󰊠 INSERT | 󰊠 VISUAL | 󰊠 REPLACE | 󰊠 COMMAND | 󰊠 TERMINAL |

**Configuration**:
```lua
mode = {
  icon_style = 'vim',
  custom_icon = '',
  mode_style = 'icon_long',
  colors = {
    -- Per-mode colors (see Theme documentation)
  },
  labels = {
    -- Custom labels per mode
  },
}
```

---

### `spell`

Displays spell check status when enabled.

```lua
{ 'spell' }
-- Output: spell EN  (when spell check is on)
-- Output: (hidden when spell check is off)
```

**Options**: None

**Notes**:
- Shows the first language code from spelllang
- Hidden when `&spell` is false

---

### `paste`

Displays paste mode indicator when active.

```lua
{ 'paste' }
-- Output: PASTE ON  (when paste mode is enabled)
-- Output: (hidden when paste mode is off)
```

**Options**: None

**Notes**:
- Hidden when `&paste` is false

---

### `macro`

Displays macro recording indicator.

```lua
{ 'macro' }
-- Output: recording @"  (when recording to register ")
-- Output: recording @a  (when recording to register a)
-- Output: (hidden when not recording)
```

**Options**: None

**Notes**:
- Shows which register is being recorded
- Hidden when not in recording mode

---

### `search`

Displays search match count.

```lua
{ 'search' }
-- Output: 3/15  (3rd match of 15 total)
-- Output: (hidden when no matches)
```

**Options**: None

**Notes**:
- Uses `searchcount()` function
- Recomputes on each call for accuracy
- Hidden when no matches or search pattern is empty

---

### `selection`

Displays visual selection count.

```lua
{ 'selection' }
-- Output: 5L 12C  (5 lines, 12 characters in charwise selection)
-- Output: 10L     (10 lines in linewise selection)
-- Output: (hidden when not in visual mode)
```

**Options**: None

**Notes**:
- Shows line and character count for characterwise (v)
- Shows only line count for linewise (V)
- Shows only line count for blockwise (Ctrl-V)

---

## Context Components

### `position`

Displays cursor position.

```lua
{ 'position' }
-- Output: Ln 42  Col 8  67%
```

**Options**: None

**Notes**:
- Shows current line number
- Shows current column number
- Shows scroll percentage

---

### `quickfix`

Displays quickfix or location list item count.

```lua
-- Quickfix list
{ 'quickfix' }
-- Output: qf 5  (5 items in quickfix list)

-- Location list
{ 'quickfix', type = 'loclist' }
-- Output: loc 3  (3 items in location list)
```

| Option | Type | Default | Description |
|--------|------|---------|-------------|
| `type` | string | `'quickfix'` | `'quickfix'` or `'loclist'` |

**Notes**:
- Hidden when list is empty
- Shows count of all items, not just visible

---

### `treesitter`

Displays Treesitter function/method context for current cursor position.

```lua
{ 'treesitter' }
-- Output: my_function_name

-- Truncated
{ 'treesitter', max_length = 30 }
-- Output: my_function_name...

-- Full context
{ 'treesitter', max_length = 50 }
-- Output: MyClass.my_function_name
```

| Option | Type | Default | Description |
|--------|------|---------|-------------|
| `max_length` | number | `30` | Maximum characters to display |

**Requires**: Treesitter highlighting enabled (`vim.treesitter.highlight.active[0]`)

**Notes**:
- Uses Treesitter `locals` or `injections` queries
- Extracts function.name or method.name captures
- Hidden when no function context found at cursor

---

## All Component Options

| Component | Option | Type | Default |
|-----------|--------|------|---------|
| **file** | - | - | - |
| **filetype** | `short` | boolean | `false` |
| **encoding** | `hide_utf8` | boolean | `false` |
| **format** | - | - | - |
| **indent** | - | - | - |
| **filesize** | - | - | - |
| **bufname** | `relative` | boolean | `false` |
| | `root` | boolean | `false` |
| | `max_length` | number | `nil` |
| **git** | `show_diff` | boolean | `false` |
| **gitblame** | `full` | boolean | `false` |
| | `max_length` | number | `nil` |
| **githunks** | - | - | - |
| **gitcommit** | - | - | - |
| **lsp** | `show_server` | boolean | `false` |
| **lspservers** | `separator` | string | `' '` |
| | `max` | number | `nil` |
| **lspprogress** | `max_length` | number | `nil` |
| **diagnostics** | - | - | - |
| **mode** | `icon_style` | string | `'vim'` |
| | `custom_icon` | string | `''` |
| | `mode_style` | string | `'icon_long'` |
| | `colors` | table | `{}` |
| | `labels` | table | `{}` |
| **spell** | - | - | - |
| **paste** | - | - | - |
| **macro** | - | - | - |
| **search** | - | - | - |
| **selection** | - | - | - |
| **position** | - | - | - |
| **quickfix** | `type` | string | `'quickfix'` |
| **treesitter** | `max_length` | number | `30` |
| **All components** | `border` | string | `default_border` |

---

## Component Return Values

Each component returns either:

- A component table (shown in statusline):
  ```lua
  {
    content = 'content text',
    icon = {
      text = 'icon',
      hl = { fg = '#color', bg = '#color' },
      pos = 'left',
    },
    hl = { fg = '#color', bg = '#color' },
    border = 'round',
  }
  ```

- `nil` (component is hidden)

A component returns `nil` when:
- The data is not available (e.g., no git branch)
- The feature is disabled (e.g., spell check off)
- The condition is not met (e.g., not in visual mode)
