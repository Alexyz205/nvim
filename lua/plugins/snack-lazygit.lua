return {
  "folke/snacks.nvim",
  ---@type snacks.Config
  opts = {
    lazygit = {
      -- Configure lazygit to use the current colorscheme
      -- and integrate edit with the current Neovim instance
      configure = true,
      -- Extra configuration for lazygit that will be merged with the default
      config = {
        os = { editPreset = "nvim-remote" },
        gui = {
          -- Set to an empty string "" to disable icons
          nerdFontsVersion = "3",
          -- Apply catppuccin theme colors from existing lazygit-config.yml
          theme = {
            activeBorderColor = {
              "#89b4fa",
              "bold",
            },
            inactiveBorderColor = {
              "#a6adc8",
            },
            optionsTextColor = {
              "#89b4fa",
            },
            selectedLineBgColor = {
              "#313244",
            },
            cherryPickedCommitBgColor = {
              "#45475a",
            },
            cherryPickedCommitFgColor = {
              "#89b4fa",
            },
            unstagedChangesColor = {
              "#f38ba8",
            },
            defaultFgColor = {
              "#cdd6f4",
            },
            searchingActiveBorderColor = {
              "#f9e2af",
            },
          },
        },
      },
      -- Theme for lazygit using Neovim highlights as a fallback for dynamic theming
      theme = {
        [241]                      = { fg = "Special" },
        activeBorderColor          = { fg = "MatchParen", bold = true },
        cherryPickedCommitBgColor  = { fg = "Identifier" },
        cherryPickedCommitFgColor  = { fg = "Function" },
        defaultFgColor             = { fg = "Normal" },
        inactiveBorderColor        = { fg = "FloatBorder" },
        optionsTextColor           = { fg = "Function" },
        searchingActiveBorderColor = { fg = "MatchParen", bold = true },
        selectedLineBgColor        = { bg = "Visual" }, -- set to `default` to have no background colour
        unstagedChangesColor       = { fg = "DiagnosticError" },
      },
      win = {
        style = "lazygit",
      },
    }
  }
}
