# My LazyVim-Based Neovim Configuration

Welcome to my Neovim configuration repository! This setup is built on top of LazyVim, providing a powerful foundation while being tailored for efficiency, simplicity, and ease of customization. It's optimized for performance and focused on keeping things lightweight by using a minimal number of essential plugins.

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

## Core Plugins

LazyVim includes many excellent plugins by default. Here are some of the key plugins I've added or customized:

1. **[Catppuccin](https://github.com/catppuccin/nvim)**: A soothing pastel color scheme designed to be easy on the eyes, enhancing the aesthetic appeal of your Neovim environment.

2. **[vim-tmux-navigator](https://github.com/christoomey/vim-tmux-navigator)**: Facilitates seamless navigation between tmux panes and Neovim splits, improving workflow efficiency.

3. **[snacks.nvim](https://github.com/folke/snacks.nvim)**: A plugin by Folke that provides a beautiful dashboard and Lazygit integration with Catppuccin theming.

4. **[opencode.nvim](https://github.com/NickvanDyke/opencode.nvim)**: Integration with OpenCode for AI-powered code assistance, featuring custom prompts for code review, optimization, documentation, testing, and Clean Architecture refactoring.

LazyVim also provides these essential tools that I rely on:

5. **[nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter)**: Provides better syntax highlighting, folding, and other features using tree-sitter for an enhanced code editing experience.

6. **[LSP Support](https://github.com/neovim/nvim-lspconfig)**: Comprehensive language server protocol integration for intelligent code completion, navigation, and analysis with custom Mason configuration for certificate handling.

7. **[Which-Key.nvim](https://github.com/folke/which-key.nvim)**: A keybinding helper that shows available keymaps in a popup, helping users learn and remember key mappings.

## Key Features

- **Seamless Navigation**: Thanks to the integration with Tmux Navigator, I can switch between Neovim and Tmux panes with ease using the same key bindings.
- **AI-Powered Development**: OpenCode integration provides intelligent code assistance with custom prompts for review, optimization, documentation, testing, and Clean Architecture refactoring.
- **Git Integration**: Lazygit integration through snacks.nvim with custom Catppuccin theming for a consistent look and feel.
- **Dashboard & Picker**: The snacks.nvim plugin provides a clean, minimal dashboard and an integrated file picker that replaces Telescope, offering quick access to recent files, fuzzy finding, and common actions.
- **Security Handling**: Custom configurations for Git and Mason to handle certificate validation in restricted environments.
- **Lightweight and Fast**: By leveraging LazyVim's lazy-loading capabilities and using only essential plugins, I've ensured that my editor is fast and responsive, even when working with large codebases.

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
