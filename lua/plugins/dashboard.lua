return {
  "folke/snacks.nvim",
  ---@type snacks.Config
  opts = {
    dashboard = {
      -- Dashboard configuration
      width = 60,
      row = nil,                                                                   -- dashboard position. nil for center
      col = nil,                                                                   -- dashboard position. nil for center
      pane_gap = 4,                                                                -- empty columns between vertical panes
      autokeys = "1234567890abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ", -- autokey sequence
      -- These settings are used by some built-in sections
      preset = {
        ---@type snacks.dashboard.Item[]
        keys = {
          { icon = " ", key = "f", desc = "Find File", action = ":lua Snacks.dashboard.pick('files')" },
          { icon = " ", key = "n", desc = "New File", action = ":ene | startinsert" },
          { icon = " ", key = "g", desc = "Find Text", action = ":lua Snacks.dashboard.pick('live_grep')" },
          { icon = " ", key = "r", desc = "Recent Files", action = ":lua Snacks.dashboard.pick('oldfiles')" },
          {
            icon = " ",
            key = "c" ,
            desc = "Config",
            action = ":lua Snacks.dashboard.pick('files', {cwd = vim.fn.stdpath('config')})",
          },
          { icon = " ", key = "s", desc = "Restore Session", section = "session" },
          { icon = "󰒲 ", key = "l", desc = "Lazy", action = ":Lazy", enabled = package.loaded.lazy ~= nil },
          { icon = " ", key = "q", desc = "Quit", action = ":qa" },
        },
        -- Used by the `header` section
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

        -- GitLab MR shortcuts
        { icon = " ", title = "GitLab", padding = { 0, 1 }, indent = 2 },
        {
          key = "mc",
          icon = "󱓻 ",
          desc = "Choose Merge Request",
          indent = 2,
          action = function() require("gitlab").choose_merge_request() end,
        },
        {
          key = "mC",
          icon = "󱓼 ",
          desc = "Create Merge Request",
          indent = 2,
          padding = 1,
          action = function() require("gitlab").create_mr() end,
        },

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
          ttl = 5 * 60,
          indent = 3,
        },

        {
          pane = 2,
          icon = " ",
          title = "Merge Requests",
          section = "terminal",
          enabled = function()
            return Snacks.git.get_root() ~= nil
          end,
          cmd = "glab mr list --author=@me -P5 2>/dev/null || echo 'No GitLab remote or token configured'",
          height = 7,
          padding = 1,
          ttl = 5 * 60,
          indent = 3,
        },

        {
          pane = 2,
          icon = " ",
          title = "Pipelines",
          section = "terminal",
          enabled = function()
            return Snacks.git.get_root() ~= nil
          end,
          cmd = "glab ci list -P5 2>/dev/null || echo 'No GitLab remote or token configured'",
          height = 7,
          padding = 1,
          ttl = 5 * 60,
          indent = 3,
        },

        { pane = 2, icon = "󰋚 ", title = "Recent Files", section = "recent_files", indent = 2, padding = 1 },

        { pane = 2, icon = "󰏗 ", title = "Projects", section = "projects", indent = 2, padding = 1 },

        { pane = 2, icon = "🚀", title = "Powered by Alexis Pigeon", indent = 2, padding = 1 },

        { section = "startup" },
      },
    }
  }
}
