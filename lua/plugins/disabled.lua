-- ============================================================================
-- Disabled Plugins Configuration
-- ============================================================================
-- Plugins that are disabled or have features turned off
-- Used to override LazyVim defaults that don't fit our workflow
-- ============================================================================

return {
  -- Disable bufferline (prefer native tabline or other alternatives)
  {
    "akinsho/bufferline.nvim",
    enabled = false,
  },

  -- Disable tokyonight theme (using Catppuccin instead)
  {
    "folke/tokyonight.nvim",
    enabled = false,
  },

  -- Disable snacks.nvim explorer (using Yazi instead)
  {
    "folke/snacks.nvim",
    opts = {
      explorer = { enabled = false },
    },
  },
}
