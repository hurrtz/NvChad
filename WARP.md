# WARP.md

This file provides guidance to WARP (warp.dev) when working with code in this repository.

## Overview

This is a NvChad v2.5 configuration that provides a highly optimized, beautiful, and performant Neovim setup. NvChad is designed as a "plugin" that can be imported via lazy.nvim, allowing for easy updates while maintaining personal customizations.

**Key characteristics:**
- Lightning-fast startup time (~0.02-0.07s) through aggressive lazy loading
- Modular plugin-based architecture
- 50+ beautiful themes with runtime switching
- Modern LSP integration with Neovim 0.11+ support
- Built-in terminal, file explorer, fuzzy finder, and completion

**Requirements:**
- Neovim 0.11+
- Git for plugin management

## Architecture

NvChad v2.5 uses a plugin-based architecture where the core is imported via lazy.nvim:

```
lua/
├── nvchad/                 # NvChad core (imported as plugin)
│   ├── autocmds.lua       # FilePost event system and core autocmds
│   ├── mappings.lua       # Default keybindings
│   ├── options.lua        # Core Vim options and settings
│   ├── configs/           # Plugin configurations
│   │   ├── cmp.lua        # Completion setup
│   │   ├── lspconfig.lua  # LSP configuration
│   │   ├── telescope.lua  # Fuzzy finder
│   │   ├── conform.lua    # Code formatting
│   │   └── ...            # Other plugin configs
│   └── plugins/
│       └── init.lua       # Main plugin specifications
└── custom/               # Your personal customizations
    ├── chadrc.lua       # Main configuration overrides
    ├── plugins.lua      # Additional plugins
    ├── mappings.lua     # Custom keybindings
    ├── options.lua      # Vim option overrides
    └── configs/         # Plugin config overrides
```

## Key Components

### Core Plugins
- **base46**: Theme system with compilation for performance
- **NvChad UI**: Custom statusline, tabufline, and dashboard
- **lazy.nvim**: Modern plugin manager with lazy loading
- **mason.nvim**: LSP server, formatter, and linter installer
- **nvim-lspconfig**: LSP client configurations
- **conform.nvim**: Code formatting (replaces null-ls)
- **nvim-cmp**: Completion engine with multiple sources
- **telescope.nvim**: Fuzzy finder for files, buffers, and more
- **nvim-treesitter**: Syntax highlighting and parsing
- **nvim-tree.lua**: File explorer
- **which-key.nvim**: Keybinding helper

### UI Enhancement Plugins
- **volt**: Enhanced UI components
- **menu**: Context menus
- **minty**: Color picker and utilities (`:Huefy`, `:Shades`)
- **indent-blankline.nvim**: Visual indentation guides

## Essential Commands

| Command | Purpose |
|---------|---------|
| `:Lazy` | Open plugin manager |
| `:Mason` | Install LSP servers, formatters, linters |
| `:NvCheatsheet` | Show keybinding cheatsheet |
| `:Huefy` | Open color picker |
| `:Shades` | Generate color shades |
| `:TSUpdate` | Update Treesitter parsers |
| `:LspInfo` | Show LSP server status |
| `:checkhealth` | Run health checks |

## Essential Keybindings

| Keymap | Function |
|--------|----------|
| `<Space>` | Leader key |
| `<leader>ff` | Find files (Telescope) |
| `<leader>fw` | Live grep (Telescope) |
| `<leader>fb` | Find buffers |
| `<leader>fh` | Help tags |
| `<leader>fo` | Old files |
| `<leader>th` | Theme switcher |
| `<leader>ch` | Show cheatsheet |
| `<C-n>` | Toggle file tree |
| `<leader>e` | Focus file tree |
| `<leader>/` | Toggle line comment |
| `<leader>fm` | Format file |
| `<Tab>` / `<S-Tab>` | Next/prev buffer |
| `<leader>x` | Close buffer |
| `<leader>b` | New buffer |

### Terminal
| Keymap | Function |
|--------|----------|
| `<leader>h` | New horizontal terminal |
| `<leader>v` | New vertical terminal |
| `<A-h>` | Toggle horizontal terminal |
| `<A-v>` | Toggle vertical terminal |
| `<A-i>` | Toggle floating terminal |
| `<C-x>` | Escape terminal mode |

### LSP (when available)
| Keymap | Function |
|--------|----------|
| `gD` | Go to declaration |
| `gd` | Go to definition |
| `<leader>D` | Type definition |
| `<leader>ra` | Rename symbol |
| `<leader>wa` | Add workspace folder |
| `<leader>wr` | Remove workspace folder |
| `<leader>ds` | Diagnostic loclist |

## Customization

### Adding Plugins
Edit `lua/custom/plugins.lua`:
```lua
return {
  {
    "author/plugin-name",
    event = "VeryLazy",
    opts = {
      -- plugin options
    },
  },
  
  -- Override existing plugin
  {
    "nvim-tree/nvim-tree.lua",
    opts = {
      view = { width = 40 },
    },
  },
}
```

### Custom Keybindings
Edit `lua/custom/mappings.lua`:
```lua
local map = vim.keymap.set

-- Normal mode mapping
map("n", "<leader>gg", "<cmd>LazyGit<CR>", { desc = "Open LazyGit" })

-- Multiple modes
map({"n", "v"}, "<leader>ca", vim.lsp.buf.code_action, { desc = "Code actions" })
```

### LSP Configuration
Create `lua/custom/configs/lspconfig.lua`:
```lua
local configs = require("nvchad.configs.lspconfig")

-- Use NvChad's defaults
local on_attach = configs.on_attach
local capabilities = configs.capabilities

local lspconfig = require("lspconfig")

-- Setup language servers
lspconfig.tsserver.setup {
  on_attach = on_attach,
  capabilities = capabilities,
}

lspconfig.pyright.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  settings = {
    python = {
      analysis = {
        typeCheckingMode = "strict",
      },
    },
  },
}
```

### Formatting Configuration
Create `lua/custom/configs/conform.lua`:
```lua
return {
  formatters_by_ft = {
    lua = { "stylua" },
    javascript = { "prettier" },
    typescript = { "prettier" },
    python = { "black" },
    go = { "gofmt" },
    rust = { "rustfmt" },
  },
  
  format_on_save = {
    timeout_ms = 500,
    lsp_fallback = true,
  },
}
```

### Theme and UI Customization
Edit `lua/custom/chadrc.lua`:
```lua
local M = {}

M.ui = {
  theme = "onedark",
  theme_toggle = { "onedark", "one_light" },
  transparency = false,
  
  statusline = {
    theme = "vscode_colored",
    separator_style = "round",
  },
  
  tabufline = {
    show_numbers = true,
  },
}

-- Enable Mason packages
M.mason = {
  ensure_installed = {
    -- LSP servers
    "lua-language-server",
    "typescript-language-server",
    "pyright",
    
    -- Formatters
    "stylua",
    "prettier",
    "black",
  },
}

return M
```

## Development Workflow

### Initial Setup
1. Install LSP servers: `:Mason` then install required servers
2. Configure languages in `lua/custom/configs/lspconfig.lua`
3. Set up formatters in `lua/custom/configs/conform.lua`
4. Customize keybindings in `lua/custom/mappings.lua`

### Daily Usage
- **File navigation**: `<leader>ff` (find files), `<C-n>` (file tree)
- **Code search**: `<leader>fw` (live grep), `<leader>fz` (buffer search)
- **Buffer management**: `<Tab>`/`<S-Tab>` (navigate), `<leader>x` (close)
- **Code editing**: `<leader>fm` (format), `<leader>/` (comment)
- **Terminal access**: `<A-i>` (floating), `<A-h>` (horizontal), `<A-v>` (vertical)

### Theme Management
- Switch themes: `<leader>th`
- Create custom themes: Add to base46 or override in chadrc
- Use color tools: `:Huefy` (color picker), `:Shades` (shade generator)

## Update and Maintenance

### Updating Plugins
```bash
# Open Neovim and run:
:Lazy update
:Mason update
```

### Updating Your Fork
```bash
# Pull upstream changes
git fetch upstream
git merge upstream/v2.5

# Push to your fork
git push origin v2.5
```

### Troubleshooting
- **Plugin issues**: `:Lazy clean` then `:Lazy update`
- **LSP problems**: `:LspInfo`, `:Mason`, check language server installation
- **Performance**: `:Lazy profile` to check startup times
- **Reset to defaults**: Delete `~/.local/share/nvim` and restart
- **Health checks**: `:checkhealth` for comprehensive system check

## File Organization

### Custom Directory Structure
```
lua/custom/
├── chadrc.lua           # Main configuration
├── plugins.lua          # Additional plugins
├── mappings.lua         # Custom keybindings  
├── options.lua          # Vim options
└── configs/
    ├── lspconfig.lua    # LSP server configurations
    ├── conform.lua      # Formatter settings
    ├── telescope.lua    # Telescope overrides
    └── overrides.lua    # Plugin option overrides
```

### Best Practices
- Keep customizations in `lua/custom/` to avoid conflicts
- Use descriptive names for custom keybindings
- Test changes incrementally
- Backup your configuration regularly (via Git)
- Document custom configurations for future reference

This NvChad v2.5 setup provides a powerful, extensible development environment while maintaining excellent performance and ease of maintenance.
