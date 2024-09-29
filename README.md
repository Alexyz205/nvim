# My Neovim Configuration

Welcome to my Neovim configuration repository! This setup is tailored for efficiency, simplicity, and ease of customization. It’s optimized for performance and focused on keeping things lightweight by using a minimal number of essential plugins.

## Why Neovim?

I chose Neovim as my primary editor because:

- **Lightweight and Fast**: Neovim is built for speed. Unlike many heavy IDEs, it remains fast and responsive even with multiple plugins.
- **Optimized for Performance**: With a focus on reducing bottlenecks and improving performance, Neovim allows me to run complex workflows without lag.
- **Highly Customizable**: The extensive plugin ecosystem and Lua-based configuration make Neovim extremely flexible, allowing me to tailor it to my specific workflow needs.
- **Great Community**: Neovim is backed by an active community that continually innovates, providing modern features for a powerful developer experience.

## Philosophy

My philosophy with this setup is **simple, efficient, and minimal**. I aim for:

- **Simplicity**: The configuration is kept straightforward, ensuring that it’s easy to maintain and extend.
- **Efficiency**: By using a minimal number of essential plugins, I ensure that my editor remains fast and lightweight, without unnecessary bloat.
- **Minimal Plugins**: I use only the plugins that provide significant value, resisting the temptation to overload the editor with unnecessary tools.

## Plugins I Use

1. **[Catppuccin](https://github.com/catppuccin/nvim)**: A soothing pastel color scheme designed to be easy on the eyes, enhancing the aesthetic appeal of your Neovim environment.

2. **[Dashboard-nvim](https://github.com/glepnir/dashboard-nvim)**: A minimalist startup dashboard with customizable shortcuts, providing a clean interface when you launch Neovim.

3. **[Indent Blankline](https://github.com/lukas-reineke/indent-blankline.nvim)**: This plugin adds indentation guides to all lines, helping visualize code structure.
   
4. **[Comment.nvim](https://github.com/numToStr/Comment.nvim)**: A simple and easy-to-use plugin for quickly commenting code in any file type.
   
5. **[Conform.nvim](https://github.com/stevearc/conform.nvim)**: A powerful formatting tool that integrates with various formatters to keep your code well-structured and clean.
   
6. **[Gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim)**: This plugin shows git diff information in the sign column, allowing for easy tracking of changes in files.
   
7. **[LSP Zero](https://github.com/VonHeikemen/lsp-zero.nvim)**: A comprehensive configuration setup for Neovim’s built-in LSP, making it easier to configure and use language servers.
   
8. **[Lualine.nvim](https://github.com/nvim-lualine/lualine.nvim)**: A fast and flexible status line plugin, giving your Neovim a clean and functional status bar.
   
9. **[nvim-tree.lua](https://github.com/nvim-tree/nvim-tree.lua)**: A file explorer tree for Neovim that helps you easily navigate and manage your project files.
   
10. **[Telescope.nvim](https://github.com/nvim-telescope/telescope.nvim)**: A highly extendable fuzzy finder plugin that enables fast searching, picking files, and content within Neovim.
   
11. **[nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter)**: Provides better syntax highlighting, folding, and other features using tree-sitter for an enhanced code editing experience.
   
12. **[vim-tmux-navigator](https://github.com/christoomey/vim-tmux-navigator)**: Facilitates seamless navigation between tmux panes and Neovim splits, improving workflow efficiency.
   
13. **[Which-Key.nvim](https://github.com/folke/which-key.nvim)**: A keybinding helper that shows available keymaps in a popup, helping users learn and remember key mappings.

## Key Features

- **Seamless Navigation**: Thanks to the integration with Tmux Navigator, I can switch between Neovim and Tmux panes with ease.
- **Git Integration**: Lazygit allows for fast, in-editor Git operations, making repository management much smoother.
- **Lightweight and Fast**: By carefully selecting plugins, I've ensured that my editor is fast and responsive, even when working with large codebases.

## How to Install

To install this configuration:

1. Clone the repository into your Neovim configuration directory:
   ```bash
   git clone https://github.com/alexyz205/nvim ~/.config/nvim
   ```

2. Run Neovim, Lazyvim will automatically install and configure plugins.

3. Ensure you have Tmux installed to take full advantage of the Tmux Navigator.

4. Enjoy your optimized, lightweight, and highly customizable Neovim setup!

## Customization

This Neovim configuration is designed to be easily customizable. You can extend the functionality by adding new plugins, changing key mappings, adjusting Neovim options, and configuring plugins as needed. Here’s a guide on how to make changes in the configuration files:

### 1. Adding Plugins

To add new plugins, you can simply modify the `lua/plugins/` directory. Specifically, plugins are added by editing or creating Lua files that define the plugin and its configurations.

- **Location**: `lua/plugins/`
- **Example**: You can add a new plugin by creating a file like `lua/plugins/myplugin.lua` and defining the plugin with Packer:
  
  ```lua
  return {
    'plugin-author/plugin-name',
    config = function()
      -- Your plugin configuration here
    end
  }
  ```

### 2. Updating Key Mappings

All key mappings are centralized in the `lua/configs/mappings.lua` file. This is where you can define, modify, or remove key mappings to suit your workflow.

- **Location**: `lua/configs/mappings.lua`
- **Example**: To add a new key mapping:
  
  ```lua
  local map = vim.api.nvim_set_keymap
  local opts = { noremap = true, silent = true }

  -- Example: Mapping Ctrl+e to toggle NERDTree
  map('n', '<C-e>', ':NERDTreeToggle<CR>', opts)
  ```

### 3. Modifying Neovim Options

Neovim-specific options such as line numbering, tab spaces, and more are set in the `lua/configs/options.lua` file. Here you can tweak various options to align with your coding preferences.

- **Location**: `lua/configs/options.lua`
- **Example**: To change the tab width or enable relative line numbers:
  
  ```lua
  local opt = vim.opt

  -- Set tab width to 4 spaces
  opt.tabstop = 4
  opt.shiftwidth = 4
  opt.expandtab = true

  -- Enable relative line numbers
  opt.relativenumber = true
  ```

After making changes, simply reload Neovim or source the configuration with `:source %`.

### 4. Configuring Plugins

For plugin-specific configurations, you can organize them in the `after/plugins/` directory. Each plugin's settings can be customized in its own file for easy maintenance.

- **Location**: `after/plugins/`
- **Example**: Let’s say you want to configure `nvim-tree.lua` for a custom setup. You would create or modify `after/plugins/nvim-tree.lua`:

  ```lua
  require('nvim-tree').setup({
    view = {
      width = 30,
      side = 'left'
    },
    filters = {
      dotfiles = true
    }
  })
  ```

This modular structure ensures that plugin configurations are cleanly separated and easy to manage.

## Conclusion

This Neovim setup is designed to enhance productivity while keeping things lean. It provides the necessary tools for a developer while avoiding the overhead of unnecessary features or plugins. If you're looking for a highly optimized yet customizable Neovim setup, give this a try!

Feel free to fork, modify, and improve this configuration to fit your workflow!
