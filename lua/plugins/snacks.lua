-- ============================================================================
-- Snacks.nvim Configuration
-- ============================================================================
-- Unified configuration for snacks.nvim plugin
-- Includes: Dashboard, Lazygit integration, and other snacks features
-- ============================================================================

return {
  "folke/snacks.nvim",
  ---@type snacks.Config
  opts = {
    -- ========================================================================
    -- Dashboard Configuration
    -- ========================================================================
    -- Beautiful startup dashboard with project info and quick actions
    dashboard = {
      width = 60,
      row = nil, -- Center vertically
      col = nil, -- Center horizontally
      pane_gap = 4, -- Space between vertical panes
      autokeys = "1234567890abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ",

      preset = {
        pick = nil, -- Use default picker (fzf-lua, telescope, or mini.pick)
        -- Custom ASCII art header
        header = [[
      █████╗ ██╗     ███████╗██╗  ██╗██╗   ██╗███████╗
      ██╔══██╗██║     ██╔════╝╚██╗██╔╝╚██╗ ██╔╝╚══███╔╝
    ███████║██║     █████╗   ╚███╔╝  ╚████╔╝   ███╔╝
    ██╔══██║██║     ██╔══╝   ██╔██╗   ╚██╔╝   ███╔╝
      ██║  ██║███████╗███████╗██╔╝ ██╗   ██║   ███████╗
      ╚═╝  ╚═╝╚══════╝╚══════╝╚═╝  ╚═╝   ╚═╝   ╚══════╝]],
      },

      sections = {
        { section = "header" },
        { section = "keys", gap = 1, padding = 1 },

        -- Git status panel (right pane)
        {
          pane = 2,
          icon = "󰊢 ",
          title = "Git Status",
          section = "terminal",
          enabled = function()
            return Snacks.git.get_root() ~= nil
          end,
          cmd = "git status --short --branch --renames",
          height = 5,
          padding = 1,
          ttl = 5 * 60, -- Cache for 5 minutes
          indent = 3,
        },

        -- Recent files panel
        {
          pane = 2,
          icon = "󰋚 ",
          title = "Recent Files",
          section = "recent_files",
          indent = 2,
          padding = 1,
        },

        -- Projects panel
        {
          pane = 2,
          icon = "󰏗 ",
          title = "Projects",
          section = "projects",
          indent = 2,
          padding = 1,
        },

        -- Footer branding
        {
          pane = 2,
          icon = "🚀",
          title = "Powered by Alexis Pigeon",
          indent = 2,
          padding = 1,
        },

        { section = "startup" },
      },
    },

    -- ========================================================================
    -- Lazygit Configuration
    -- ========================================================================
    -- Integrated lazygit terminal with Catppuccin Mocha theme
    lazygit = {
      configure = true, -- Auto-configure lazygit with Neovim
      -- Lazygit configuration merged with defaults
      config = {
        os = { editPreset = "nvim-remote" }, -- Edit in current Neovim instance
        gui = {
          nerdFontsVersion = "3", -- Use Nerd Fonts v3 icons
          -- Catppuccin Mocha color scheme
          theme = {
            activeBorderColor = { "#89b4fa", "bold" }, -- Blue
            inactiveBorderColor = { "#f9e2af" }, -- Yellow
            optionsTextColor = { "#cba6f7" }, -- Mauve
            selectedLineBgColor = { "#6c7086" }, -- Gray
            cherryPickedCommitBgColor = { "#45475a" }, -- Surface0
            cherryPickedCommitFgColor = { "#89b4fa" }, -- Blue
            unstagedChangesColor = { "#f38ba8" }, -- Red
            defaultFgColor = { "#cdd6f4" }, -- Text
            searchingActiveBorderColor = { "#f9e2af" }, -- Yellow
          },
        },
      },
      -- Dynamic theming using Neovim highlights as fallback
      theme = {
        [241] = { fg = "Special" },
        activeBorderColor = { fg = "MatchParen", bold = true },
        cherryPickedCommitBgColor = { fg = "Identifier" },
        cherryPickedCommitFgColor = { fg = "Function" },
        defaultFgColor = { fg = "Normal" },
        inactiveBorderColor = { fg = "FloatBorder" },
        optionsTextColor = { fg = "Function" },
        searchingActiveBorderColor = { fg = "MatchParen", bold = true },
        selectedLineBgColor = { bg = "Visual" },
        unstagedChangesColor = { fg = "DiagnosticError" },
      },
      win = {
        style = "lazygit",
      },
    },
  },
}
