-- ============================================================================
-- Lazy.nvim Plugin Manager Bootstrap
-- ============================================================================
-- Automatically installs and configures lazy.nvim plugin manager
-- This file is loaded by init.lua and sets up the plugin ecosystem
-- ============================================================================

-- Install lazy.nvim if not already installed
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "--branch=stable",
    lazyrepo,
    lazypath,
  })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- ============================================================================
-- Plugin Configuration
-- ============================================================================

require("lazy").setup({
  spec = {
    -- Import LazyVim base configuration and plugins
    { "LazyVim/LazyVim", import = "lazyvim.plugins" },

    -- Set colorscheme to Catppuccin Mocha
    {
      "LazyVim/LazyVim",
      opts = {
        colorscheme = "catppuccin-mocha",
      },
    },

    -- Import custom plugins from lua/plugins/
    { import = "plugins" },
  },

  defaults = {
    -- Custom plugins load during startup by default
    -- Set to true to lazy-load all custom plugins
    lazy = false,

    -- Use latest git commit for plugins
    -- Alternative: version = "*" for stable releases (if available)
    version = false,
  },

  checker = {
    enabled = true, -- Automatically check for plugin updates
    notify = false, -- Don't show notifications for updates
  },

  -- ============================================================================
  -- Performance Optimizations
  -- ============================================================================
  performance = {
    rtp = {
      -- Disable unused built-in Neovim plugins
      disabled_plugins = {
        "gzip",
        -- "matchit",     -- Keep for bracket matching
        -- "matchparen",  -- Keep for parenthesis highlighting
        -- "netrwPlugin", -- Keep if needed, we use Yazi instead
        "tarPlugin",
        "tohtml",
        "tutor",
        "zipPlugin",
      },
    },
  },
})
