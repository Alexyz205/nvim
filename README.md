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

I use the [NvChad](https://nvchad.com/) distribution as the foundation for my Neovim setup, which comes with several pre-configured plugins and sensible defaults. 
In addition, I've added a couple of extra tools to enhance my workflow:

1. **[Tmux Navigator](https://github.com/christoomey/vim-tmux-navigator)**  
   Efficient navigation between Tmux panes and Neovim splits without using the mouse or remembering complicated keybindings.

2. **[Lazygit](https://github.com/jesseduffield/lazygit)**  
   A simple terminal UI for Git commands, providing a quick and easy way to manage repositories directly from Neovim.

### Core Plugins (via NvChad)

The NvChad distribution includes a collection of curated, optimized plugins, including:

- **LSP (Language Server Protocol)**: For language intelligence (auto-completion, go-to-definition, linting, etc.).
- **cmp**: For auto-completion, integrated with LSP.
- **mason**: For managing LSP, DAP (Debugger Adapter Protocol), and other developer tools.
- **Telescope**: A powerful fuzzy finder for searching files, text, and much more.
- **Treesitter**: For better syntax highlighting and code parsing.

## Key Features

- **Seamless Navigation**: Thanks to the integration with Tmux Navigator, I can switch between Neovim and Tmux panes with ease.
- **Git Integration**: Lazygit allows for fast, in-editor Git operations, making repository management much smoother.
- **Lightweight and Fast**: By carefully selecting plugins, I've ensured that my editor is fast and responsive, even when working with large codebases.

## How to Install

To install this configuration:

1. Clone the repository into your Neovim configuration directory:
   ```bash
   git clone https://github.com/anathos221/nvim ~/.config/nvim
   ```

2. Run Neovim, Lazyvim will automatically install and configure plugins.

3. Ensure you have Tmux installed to take full advantage of the Tmux Navigator.

4. Enjoy your optimized, lightweight, and highly customizable Neovim setup!

Here’s an updated section to include in your `README.md` under **Customization**, detailing how users can configure and add plugins, modify keymaps, update Neovim options, and configure individual plugins based on your setup:

---

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
