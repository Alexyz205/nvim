return {
  "pwntester/octo.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "folke/snacks.nvim",
    "nvim-tree/nvim-web-devicons",
  },
  cmd = "Octo",
  opts = {
    -- Use the snacks picker backend (same as the dashboard)
    picker = "snacks",
    -- Prefer "upstream" remote for forks, else "origin" (mirrors gitlab.lua)
    default_remote = { "upstream", "origin" },
    -- Bare `Octo` command opens a picker of available actions
    enable_builtin = true,
  },
  keys = {
    { "<leader>op", "<CMD>Octo pr list<CR>", desc = "GitHub: List Pull Requests" },
    { "<leader>oi", "<CMD>Octo issue list<CR>", desc = "GitHub: List Issues" },
    { "<leader>oc", "<CMD>Octo pr checks<CR>", desc = "GitHub: PR Checks" },
  },
}
