return {
  "harrisoncramer/gitlab.nvim",
  dependencies = {
    "MunifTanjim/nui.nvim",
    "nvim-lua/plenary.nvim",
    "sindrets/diffview.nvim",
    "nvim-tree/nvim-web-devicons",
  },
  build = function()
    require("gitlab.server").build(true)
  end,
  config = function()
    -- Detect the right remote: prefer "upstream" if it exists, else "origin"
    local function detect_remote()
      local result = vim.fn.system("git remote")
      if result:find("upstream") then
        return "upstream"
      end
      return "origin"
    end

    require("gitlab").setup({
      -- Auth provider for self-hosted GitLab
      -- Reads token from GITLAB_TOKEN env var, points API at git.dxyz.pro
      auth_provider = function()
        local token = os.getenv("GITLAB_TOKEN")
        if not token then
          return nil, nil, "GITLAB_TOKEN environment variable is not set"
        end
        return token, "https://git.dxyz.pro", nil
      end,

      -- Connection: auto-detect remote (upstream for forks, origin otherwise)
      connection_settings = {
        remote = detect_remote(),
      },
    })

    -- Global keymaps (prefix: gl for GitLab)
    local gitlab = require("gitlab")
    vim.keymap.set("n", "glS", gitlab.review, { desc = "GitLab: Start MR review" })
    vim.keymap.set("n", "glc", gitlab.choose_merge_request, { desc = "GitLab: Choose MR" })
    vim.keymap.set("n", "gls", gitlab.summary, { desc = "GitLab: MR summary" })
    vim.keymap.set("n", "glA", gitlab.approve, { desc = "GitLab: Approve MR" })
    vim.keymap.set("n", "glR", gitlab.revoke, { desc = "GitLab: Revoke approval" })
    vim.keymap.set("n", "gln", gitlab.create_note, { desc = "GitLab: Create note" })
    vim.keymap.set("n", "gld", gitlab.toggle_discussions, { desc = "GitLab: Toggle discussions" })
    vim.keymap.set("n", "glp", gitlab.pipeline, { desc = "GitLab: Pipeline status" })
    vim.keymap.set("n", "glo", gitlab.open_in_browser, { desc = "GitLab: Open in browser" })
    vim.keymap.set("n", "glM", gitlab.merge, { desc = "GitLab: Merge MR" })
    vim.keymap.set("n", "glC", gitlab.create_mr, { desc = "GitLab: Create MR" })
    vim.keymap.set("n", "glu", gitlab.copy_mr_url, { desc = "GitLab: Copy MR URL" })
    vim.keymap.set("n", "glD", gitlab.toggle_draft_mode, { desc = "GitLab: Toggle draft mode" })
    vim.keymap.set("n", "glP", gitlab.publish_all_drafts, { desc = "GitLab: Publish drafts" })

    -- Reviewer keymaps (visual mode for comment/suggest on selected lines)
    vim.keymap.set("v", "glcc", gitlab.create_multiline_comment, { desc = "GitLab: Comment on lines" })
    vim.keymap.set("v", "glcs", gitlab.create_comment_suggestion, { desc = "GitLab: Suggest on lines" })
  end,
}
