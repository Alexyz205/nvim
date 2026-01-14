# My LazyVim-Based Neovim Configuration

Welcome to my Neovim configuration repository! This setup is built on top of LazyVim, providing a powerful foundation while being tailored for efficiency, simplicity, and ease of customization. It's optimized for performance and focused on keeping things lightweight by using a minimal number of essential plugins.

## Quick Start

```bash
# Clone the repository
git clone https://github.com/alexyz205/nvim ~/.config/nvim

# Launch Neovim (plugins will auto-install)
nvim

# Optional: Open the dashboard
nvim +Dashboard
```

**First Launch**: LazyVim will automatically install all plugins. This may take a few minutes. Once complete, restart Neovim for the best experience.

## What is LazyVim?

LazyVim is a Neovim setup powered by 💤 lazy.nvim to make it easy to customize and extend your config. It transforms your Neovim into a full-fledged IDE while maintaining blazing fast performance.

### LazyVim Features

- 🔥 Transforms Neovim into a full-fledged IDE
- 💤 Easily customizable and extendable with lazy.nvim
- 🚀 Blazingly fast performance
- 🧹 Sane default settings for options, autocmds, and keymaps
- 📦 Pre-configured with a wealth of plugins ready to use

## Why LazyVim?

I chose LazyVim as the foundation for my Neovim setup because:

- **Curated Plugin Ecosystem**: LazyVim provides a carefully selected set of plugins that work well together, reducing configuration complexity.
- **Lazy Loading**: As the name suggests, LazyVim intelligently loads plugins only when needed, improving startup time and performance.
- **Modular Structure**: The configuration is organized in a clean, modular way that makes it easy to customize and extend.
- **Sane Defaults**: LazyVim comes with sensible defaults that provide a great experience out of the box.

## Philosophy

My philosophy with this setup is **simple, efficient, and minimal**. I aim for:

- **Simplicity**: The configuration is kept straightforward, ensuring that it's easy to maintain and extend.
- **Efficiency**: By using a minimal number of essential plugins, I ensure that my editor remains fast and lightweight, without unnecessary bloat.
- **Minimal Plugins**: I use only the plugins that provide significant value, resisting the temptation to overload the editor with unnecessary tools.

## Key Features

- **Seamless Navigation**: Thanks to the integration with Tmux Navigator, I can switch between Neovim and Tmux panes with ease using the same key bindings.
- **AI-Powered Development**: OpenCode integration provides intelligent code assistance with custom prompts for review, optimization, documentation, testing, and Clean Architecture refactoring.
- **Git Integration**: Lazygit integration through snacks.nvim with custom Catppuccin theming for a consistent look and feel.
- **Dashboard & Picker**: The snacks.nvim plugin provides a clean, minimal dashboard and an integrated file picker that replaces Telescope, offering quick access to recent files, fuzzy finding, and common actions.
- **Security Handling**: Custom configurations for Git and Mason to handle certificate validation in restricted environments.
- **Lightweight and Fast**: By leveraging LazyVim's lazy-loading capabilities and using only essential plugins, I've ensured that my editor is fast and responsive, even when working with large codebases.

## Essential Keybindings

This configuration uses `<Space>` as the leader key. Here are the most important keybindings:

### General

| Keybinding | Mode | Description |
|------------|------|-------------|
| `<Space>` | N | Leader key - opens Which-Key menu |
| `<C-s>` | N | Save current file |
| `<C-S>` | N | Save all files |
| `<C-c>` | N | Copy entire file to clipboard |

### Navigation

| Keybinding | Mode | Description |
|------------|------|-------------|
| `<C-h/j/k/l>` | N | Navigate splits/tmux panes (left/down/up/right) |
| `<C-d>` | N | Scroll down and center |
| `<C-u>` | N | Scroll up and center |
| `n` / `N` | N | Next/previous search result (centered) |

### File Management

| Keybinding | Mode | Description |
|------------|------|-------------|
| `<leader>e` | N/V | Open Yazi file manager at current file |
| `<leader>E` | N | Open Yazi in working directory |
| `<leader>ff` | N | Find files (LazyVim default) |
| `<leader>sg` | N | Live grep (LazyVim default) |

### Git Integration

| Keybinding | Mode | Description |
|------------|------|-------------|
| `<leader>gg` | N | Open Lazygit (LazyVim default) |
| `<leader>gb` | N | Git blame line (LazyVim default) |

### AI Assistant (OpenCode)

| Keybinding | Mode | Description |
|------------|------|-------------|
| `<leader>oc` | N | Toggle OpenCode interface |
| `<leader>oa` | N/V | Ask OpenCode (with selection in visual) |
| `<leader>op` | N/V | Select from custom prompts (review, fix, optimize, docs, tests, etc.) |
| `<leader>on` | N | Start new OpenCode session |

### Visual Mode

| Keybinding | Mode | Description |
|------------|------|-------------|
| `J` | V | Move selected lines down |
| `K` | V | Move selected lines up |
| `<leader>p` | V | Paste without yanking |
| `<leader>y` | V | Yank to system clipboard |

### Insert Mode Navigation

| Keybinding | Mode | Description |
|------------|------|-------------|
| `<C-b>` | I | Move to beginning of line |
| `<C-e>` | I | Move to end of line |
| `<C-h/j/k/l>` | I | Move cursor (left/down/up/right) |

**Tip**: Press `<Space>` in normal mode to see all available keybindings with Which-Key!

## Configuration Structure

```
~/.config/nvim/
├── init.lua                 # Entry point, sets leader key
├── lua/
│   ├── config/
│   │   ├── autocmds.lua    # Custom autocommands
│   │   ├── keymaps.lua     # Custom keybindings
│   │   ├── lazy.lua        # Lazy.nvim bootstrap
│   │   └── options.lua     # Neovim options
│   └── plugins/
│       ├── disabled.lua    # Disabled LazyVim plugins
│       ├── opencode.lua    # AI assistant configuration
│       ├── snacks.lua      # Dashboard & Lazygit config
│       ├── vim-tmux-navigator.lua
│       └── yazi.lua        # File manager integration
├── lazy-lock.json          # Plugin version lock
└── lazyvim.json           # LazyVim extras configuration
```

## How to Install

### Requirements

Before installing this configuration, make sure you have:

- Neovim >= 0.9.0 (needs to be built with LuaJIT)
- Git >= 2.19.0 (for partial clones support)
- A Nerd Font (v3.0 or greater) for proper icons
- A C compiler for nvim-treesitter
- curl for completion engine
- For LSP servers and other tools (Mason requirements):
  - Node.js and npm for JavaScript/TypeScript LSP servers and tools
  - Python 3 with pip and venv for Python-related servers and tools
- Optional but recommended:
  - lazygit for Git integration
  - ripgrep for live grep functionality
  - fd for finding files
  - A terminal that supports true color and undercurl (Ghostty, Kitty, WezTerm, Alacritty, or iTerm2)

### Installation Steps

1. Clone the repository into your Neovim configuration directory:

   ```bash
   git clone https://github.com/alexyz205/nvim ~/.config/nvim
   ```

2. Run Neovim, and Lazy.nvim will automatically install and configure plugins.

3. Ensure you have Tmux installed to take full advantage of the Tmux Navigator.

4. Enjoy your optimized, LazyVim-based Neovim setup!

## Customization

This Neovim configuration is designed to be easily customizable. You can extend the functionality by adding new plugins, changing key mappings, adjusting Neovim options, and configuring plugins as needed. Here's a guide on how to make changes in the configuration files:

### 1. Adding Plugins

To add new plugins, you can simply modify the `lua/plugins/` directory. Specifically, plugins are added by editing or creating Lua files that define the plugin and its configurations.

- **Location**: `lua/plugins/`
- **Example**: You can add a new plugin by creating a file like `lua/plugins/myplugin.lua` and defining the plugin with Lazy.nvim:

  ```lua
  return {
    'plugin-author/plugin-name',
    config = function()
      -- Your plugin configuration here
    end
  }
  ```

### 2. Updating Key Mappings

All key mappings are centralized in the `lua/config/keymaps.lua` file. This is where you can define, modify, or remove key mappings to suit your workflow.

- **Location**: `lua/config/keymaps.lua`
- **Example**: To add a new key mapping:

  ```lua
  local map = vim.keymap.set
  local opts = { noremap = true, silent = true }

  -- Example: Mapping Ctrl+s to save the file
  map("n", "<C-s>", "<cmd>w<CR>", { desc = "Save file" })
  ```

### 3. Modifying Neovim Options

Neovim-specific options such as line numbering, tab spaces, and more are set in the `lua/config/options.lua` file. Here you can tweak various options to align with your coding preferences.

- **Location**: `lua/config/options.lua`
- **Example**: To change the tab width or enable relative line numbers:

  ```lua
  local opt = vim.opt

  -- Set tab width to 2 spaces
  opt.tabstop = 2
  opt.shiftwidth = 2
  opt.expandtab = true

  -- Enable relative line numbers
  opt.relativenumber = true
  ```

After making changes, simply reload Neovim or source the configuration with `:source %`.

### 4. Overriding LazyVim Defaults

LazyVim comes with many defaults that you might want to override. You can do this by creating specific files in your `lua/plugins/` directory.

- **Example**: To disable a LazyVim default plugin, create a file like `lua/plugins/disabled.lua`:

  ```lua
  return {
    -- disable bufferline
    { "akinsho/bufferline.nvim", enabled = false },
    -- disable tokyonight
    { "folke/tokyonight.nvim", enabled = false },
  }
  ```

## LazyVim Documentation

For more details about LazyVim and its capabilities, refer to the [official LazyVim documentation](https://www.lazyvim.org/).

## Conclusion

This Neovim setup is designed to enhance productivity while keeping things lean. It provides the necessary tools for a developer while avoiding the overhead of unnecessary features or plugins. By maintaining a balance between functionality and simplicity, it offers a fast, efficient, and pleasant editing experience.

Feel free to fork, modify, and improve this configuration to fit your workflow!
