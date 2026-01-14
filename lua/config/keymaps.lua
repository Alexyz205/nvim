-- ============================================================================
-- Custom Keymaps Configuration
-- ============================================================================
-- Personal keybindings that extend LazyVim defaults
-- Organized by category for easy navigation and maintenance
-- ============================================================================

local map = vim.keymap.set

-- ============================================================================
-- Insert Mode Navigation
-- ============================================================================
-- Emacs-style movement in insert mode for efficiency

map("i", "<C-b>", "<ESC>^i", { desc = "Move to beginning of line" })
map("i", "<C-e>", "<End>", { desc = "Move to end of line" })
map("i", "<C-h>", "<Left>", { desc = "Move left" })
map("i", "<C-l>", "<Right>", { desc = "Move right" })
map("i", "<C-j>", "<Down>", { desc = "Move down" })
map("i", "<C-k>", "<Up>", { desc = "Move up" })

-- ============================================================================
-- File Operations
-- ============================================================================

map("n", "<C-s>", "<cmd>w<CR>", { desc = "Save file" })
map("n", "<C-S>", "<cmd>wa<CR>", { desc = "Save all files" })
map("n", "<C-c>", "<cmd>%y+<CR>", { desc = "Copy whole file" })

-- ============================================================================
-- Visual Mode - Line Movement
-- ============================================================================
-- Move selected lines up/down with automatic re-indentation

map("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move selected lines down" })
map("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move selected lines up" })

-- ============================================================================
-- Search and Replace
-- ============================================================================

map("n", "<leader>r", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], {
  desc = "Substitute word under cursor",
})

-- ============================================================================
-- Normal Mode Navigation Enhancements
-- ============================================================================
-- Improved scrolling and search navigation with cursor centering

map("n", "J", "mzJ`z", { desc = "Join lines keeping cursor position" })
map("n", "<C-d>", "<C-d>zz", { desc = "Scroll down and center" })
map("n", "<C-u>", "<C-u>zz", { desc = "Scroll up and center" })
map("n", "n", "nzzzv", { desc = "Next search result (centered)" })
map("n", "N", "Nzzzv", { desc = "Previous search result (centered)" })

-- ============================================================================
-- Clipboard Operations
-- ============================================================================
-- Smart clipboard handling with system integration

-- Paste without losing yanked text
map("x", "<leader>p", [["_dP]], { desc = "Paste without yanking" })

-- Yank to system clipboard
map({ "n", "v" }, "<leader>y", [["+y]], { desc = "Yank to system clipboard" })
map("n", "<leader>Y", [["+Y]], { desc = "Yank line to system clipboard" })

-- Delete without yanking
map({ "n", "v" }, "<leader>d", [["_d]], { desc = "Delete without yanking" })

-- ============================================================================
-- Development Utilities
-- ============================================================================

map("n", "<leader><leader>", "<cmd>so<CR>", { desc = "Source current file" })

-- ============================================================================
-- Tmux Navigation Integration
-- ============================================================================
-- Seamless navigation between Neovim splits and Tmux panes
-- Requires: vim-tmux-navigator plugin

map("n", "<C-h>", "<cmd>TmuxNavigateLeft<CR>", { desc = "Navigate left (Tmux aware)" })
map("n", "<C-j>", "<cmd>TmuxNavigateDown<CR>", { desc = "Navigate down (Tmux aware)" })
map("n", "<C-k>", "<cmd>TmuxNavigateUp<CR>", { desc = "Navigate up (Tmux aware)" })
map("n", "<C-l>", "<cmd>TmuxNavigateRight<CR>", { desc = "Navigate right (Tmux aware)" })

-- ============================================================================
-- Notes
-- ============================================================================
-- LazyVim provides extensive default keymaps
-- Press <Space> to see which-key menu for available bindings
-- See: https://www.lazyvim.org/keymaps
