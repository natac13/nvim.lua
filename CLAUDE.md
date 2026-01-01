# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Architecture Overview

This is a modern Neovim configuration using Lazy.nvim as the plugin manager. The configuration is organized into modular components:

### Core Structure

- `init.lua` - Main entry point that loads core modules
- `lua/config/` - Core configuration files (options, keymaps, autocommands, lazy plugin manager)
- `lua/plugins/` - Individual plugin configurations
- `lua/utils/` - Utility functions and helpers

### Key Components

#### Plugin Management

- Uses Lazy.nvim for plugin management
- Plugins are configured in separate files under `lua/plugins/`
- `lazy-lock.json` pins specific plugin versions

#### Language Support

- LSP configuration in `lua/plugins/lsp.lua` with Mason for auto-installation
- Supports: TypeScript/JavaScript, Go, Python, Rust, Lua, and more
- Formatting via Conform.nvim (`lua/plugins/conform.lua`)
- Linting via nvim-lint (`lua/plugins/nvim_lint.lua`)
- Syntax highlighting via Treesitter (`lua/plugins/treesitter.lua`)

#### Key Plugins

- **Telescope**: Fuzzy finder for files, LSP symbols, grep, etc.
- **Neo-tree**: File explorer
- **Oil.nvim**: Directory editor
- **Copilot**: AI assistance
- **Gitsigns**: Git integration
- **Which-key**: Keybinding help
- **Treesitter**: Advanced syntax highlighting
- **nvim-cmp**: Autocompletion
- **Harpoon**: Quick file navigation
- **Barbecue**: LSP breadcrumbs
- **Todo-comments**: Comment highlighting
- **Persistence**: Session management

## Common Development Tasks

### Plugin Management

```bash
# Install/update plugins
:Lazy

# Check plugin status
:Lazy status

# Update all plugins
:Lazy update
```

### LSP and Formatting

```bash
# Install LSP servers
:Mason

# Format current buffer
<leader>lf

# Organize imports (TypeScript)
<leader>oi

# Restart TypeScript server
:RestartTsServer
```

### Testing

No specific test runner configured - depends on project-specific setup.

## Configuration Details

### Leader Key

- Leader key is set to `<Space>`
- Local leader is also `<Space>`

### Key Bindings

- Most keybindings use `<leader>` prefix
- LSP bindings use `<leader>l` prefix
- Search bindings use `<leader>s` prefix
- Git bindings use `<leader>g` prefix

### Language-Specific Settings

- 2-space indentation for most languages
- Format on save enabled for most filetypes (except C/C++)
- Biome formatter preferred over Prettier when `biome.json` exists
- Auto-organize imports for TypeScript
- Support for multiple formatters: stylua (Lua), goimports/gofmt (Go), biome/prettier (JS/TS)

### Window Management

- Vertical split: `<leader>|`
- Horizontal split: `<leader>-`
- Window navigation: `<C-h/j/k/l>`
- Buffer navigation: `<S-h/l>`

## Development Notes

### Plugin Configuration Pattern

Each plugin is configured in its own file under `lua/plugins/` and returns a table with:

- Plugin specification
- Dependencies
- Configuration options
- Key mappings

### Disabled Features

- Netrw (replaced with Oil.nvim and Neo-tree)
- Some default vim plugins for performance
- Treesitter context (disabled by default)

### Custom Commands

- `RestartTsServer` - Restart TypeScript language server
- `TypescriptVersion` - Select TypeScript version

### Additional Key Bindings

- `jk` in insert mode - Exit to normal mode
- `<leader>z` - Execute current line as Lua
- `<leader>Z` - Execute current file
- `<leader>w` - Save file
- `<leader>yr` - Copy relative file path
- `<leader>bd` - Delete buffer
- `<leader>bD` - Delete all buffers except current
- `<leader>qs` - Restore session for current directory
- `<leader>ql` - Restore last session
- `<leader>qd` - Stop session persistence
