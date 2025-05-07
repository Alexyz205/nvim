# My LazyVim-Based Neovim Configuration

Welcome to my Neovim configuration repository! This setup is built on top of LazyVim, providing a powerful foundation while being tailored for efficiency, simplicity, and ease of customization. It's optimized for performance and focused on keeping things lightweight by using a minimal number of essential plugins.

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

LazyVim also provides these essential tools that I rely on:

3. **[Telescope.nvim](https://github.com/nvim-telescope/telescope.nvim)**: A highly extendable fuzzy finder plugin that enables fast searching, picking files, and content within Neovim.

4. **[nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter)**: Provides better syntax highlighting, folding, and other features using tree-sitter for an enhanced code editing experience.

5. **[LSP Support](https://github.com/neovim/nvim-lspconfig)**: Comprehensive language server protocol integration for intelligent code completion, navigation, and analysis.

6. **[Which-Key.nvim](https://github.com/folke/which-key.nvim)**: A keybinding helper that shows available keymaps in a popup, helping users learn and remember key mappings.

7. **[nvim-tree.lua](https://github.com/nvim-tree/nvim-tree.lua)**: A file explorer tree for Neovim that helps you easily navigate and manage your project files.

## Key Features

- **Seamless Navigation**: Thanks to the integration with Tmux Navigator, I can switch between Neovim and Tmux panes with ease.
- **Git Integration**: LazyVim includes powerful Git tools for fast, in-editor Git operations, making repository management much smoother.
- **Lightweight and Fast**: By leveraging LazyVim's lazy-loading capabilities, I've ensured that my editor is fast and responsive, even when working with large codebases.

## How to Install

To install this configuration:

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

All key mappings are centralized in the `lua/configs/keymaps.lua` file. This is where you can define, modify, or remove key mappings to suit your workflow.

- **Location**: `lua/configs/keymaps.lua`
- **Example**: To add a new key mapping:

  ```lua
  local map = vim.keymap.set
  local opts = { noremap = true, silent = true }

  -- Example: Mapping Ctrl+e to toggle nvim-tree
  map('n', '<C-e>', ':NvimTreeToggle<CR>', opts)
  ```

### 3. Modifying Neovim Options

Neovim-specific options such as line numbering, tab spaces, and more are set in the `lua/configs/options.lua` file. Here you can tweak various options to align with your coding preferences.

- **Location**: `lua/configs/options.lua`
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
    -- disable trouble.nvim
    { "folke/trouble.nvim", enabled = false },
  }
  ```

## LazyVim Documentation

For more details about LazyVim and its capabilities, refer to the [official LazyVim documentation](https://www.lazyvim.org/).

## Conclusion

This Neovim setup is designed to enhance productivity while keeping things lean. It provides the necessary tools for a developer while avoiding the overhead of unnecessary features or plugins. If you're looking for a highly optimized yet customizable Neovim setup built on LazyVim, give this a try!

Feel free to fork, modify, and improve this configuration to fit your workflow!
