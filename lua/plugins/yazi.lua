-- ============================================================================
-- Yazi File Manager Integration
-- ============================================================================
-- Modern terminal file manager integration with Neovim
-- Provides fast, feature-rich file navigation with image previews
-- ============================================================================
--
-- Features:
--   - Blazing fast file navigation
--   - Image preview support
--   - Bulk file operations
--   - Integration with Neovim buffers
--
-- Dependencies:
--   - yazi: Install via package manager (brew install yazi)
--   - snacks.nvim: For terminal integration
--
-- Keybindings:
--   <leader>e : Open yazi at current file location
--   <leader>E : Open yazi in working directory
--   <C-up>    : Resume last yazi session
--
-- See: https://github.com/mikavilpas/yazi.nvim
-- ============================================================================

return {
  "mikavilpas/yazi.nvim",
  event = "VeryLazy",
  dependencies = {
    "folke/snacks.nvim",
  },
  keys = {
    {
      "<leader>e",
      mode = { "n", "v" },
      "<cmd>Yazi<cr>",
      desc = "Open yazi at current file",
    },
    {
      "<leader>E",
      "<cmd>Yazi cwd<cr>",
      desc = "Open yazi in working directory",
    },
    {
      "<c-up>",
      "<cmd>Yazi toggle<cr>",
      desc = "Resume last yazi session",
    },
  },
  opts = {
    -- Don't hijack netrw for directory opening
    open_for_directories = false,
    keymaps = {
      show_help = "<f1>",
    },
  },
  init = function()
    -- Disable netrw plugin to avoid conflicts
    vim.g.loaded_netrwPlugin = 1
  end,
}
