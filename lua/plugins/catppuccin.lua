return {
    -- add catppuccin theme
    { "catppuccin/nvim" },

    -- Configure LazyVim to load catppuccin
    {
      "LazyVim/LazyVim",
      opts = {
        colorscheme = "catppuccin-mocha",
      },
    }
  }
