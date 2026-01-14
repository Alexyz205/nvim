-- ============================================================================
-- Neovim Initialization
-- ============================================================================
-- Main entry point for LazyVim-based configuration
-- Sets up leader key and bootstraps the plugin manager
-- ============================================================================

-- Set leader key BEFORE loading lazy.nvim
-- This ensures plugins can properly detect the leader key
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Bootstrap lazy.nvim plugin manager
require("config.lazy")
