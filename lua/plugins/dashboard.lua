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
        -- Defaults to a picker that supports `fzf-lua`, `telescope.nvim` and `mini.pick`
        ---@type fun(cmd:string, opts:table)|nil
        pick = nil,
        -- Used by the `keys` section to show keymaps.
        -- Set your custom keymaps here.
        -- When using a function, the `items` argument are the default keymaps.
        ---@type snacks.dashboard.Item[]
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
        { section = "keys",  gap = 1, padding = 1 },

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

        { pane = 2, icon = "󰋚 ", title = "Recent Files", section = "recent_files", indent = 2, padding = 1 },

        { pane = 2, icon = "󰏗 ", title = "Projects", section = "projects", indent = 2, padding = 1 },

        { pane = 2, icon = "🚀", title = "Powered by Alexis Pigeon", indent = 2, padding = 1 },

        { section = "startup" },
      },
    }
  }
}
