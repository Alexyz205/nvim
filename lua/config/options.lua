-- ============================================================================
-- Neovim Options Configuration
-- ============================================================================
-- Custom options that extend or override LazyVim defaults
-- These settings optimize the editor for personal workflow preferences
-- ============================================================================

local opt = vim.opt
local g = vim.g

-- ============================================================================
-- UI & Display Settings
-- ============================================================================

-- Line numbers
opt.number = true -- Show absolute line numbers
opt.relativenumber = true -- Show relative line numbers (great for motions)

-- Visual guides
opt.colorcolumn = "80" -- Show column guide at 80 characters
opt.signcolumn = "yes" -- Always show sign column (prevents text shift)
opt.scrolloff = 8 -- Keep 8 lines visible above/below cursor

-- Colors and appearance
opt.termguicolors = true -- Enable 24-bit RGB colors
g.snacks_animate = false -- Disable snacks.nvim animations for performance

-- Line wrapping
opt.wrap = false -- Don't wrap long lines

-- ============================================================================
-- Indentation & Formatting
-- ============================================================================

opt.tabstop = 2 -- Tab width is 2 spaces
opt.softtabstop = 2 -- Number of spaces for tab in insert mode
opt.shiftwidth = 2 -- Indent width for >> and << operators
opt.expandtab = true -- Convert tabs to spaces
opt.smartindent = true -- Auto-indent new lines intelligently

-- ============================================================================
-- Search Configuration
-- ============================================================================

opt.hlsearch = false -- Don't highlight all search matches
opt.incsearch = true -- Show matches as you type

-- ============================================================================
-- File Handling
-- ============================================================================

-- Backup and swap files
opt.swapfile = false -- Disable swap files (relying on undo history)
opt.backup = false -- Disable backup files

-- Persistent undo
opt.undofile = true -- Enable persistent undo history
opt.undodir = os.getenv("HOME") .. "/.vim/undodir" -- Store undo history here

-- ============================================================================
-- Performance & Behavior
-- ============================================================================

opt.updatetime = 50 -- Faster completion and diagnostics (default: 4000ms)
opt.isfname:append("@-@") -- Include @ in filenames

-- ============================================================================
-- Notes
-- ============================================================================
-- Leader key is set in init.lua before lazy.nvim loads
-- LazyVim provides many additional sensible defaults
-- See: https://www.lazyvim.org/configuration/general
