-- ============================================================================
-- OpenCode.nvim - AI-Powered Coding Assistant
-- ============================================================================
-- Integration with OpenCode for intelligent code assistance
-- Provides AI-powered code review, optimization, documentation, and more
-- ============================================================================
--
-- Features:
--   - Custom prompts for various development tasks
--   - Code review and analysis
--   - Bug fixing and optimization
--   - Documentation generation
--   - Test suite creation
--   - Clean Architecture refactoring
--   - Commit message generation
--
-- Keybindings:
--   <leader>oc : Toggle OpenCode interface
--   <leader>oa : Ask OpenCode (normal/visual mode)
--   <leader>op : Select from predefined prompts
--   <leader>on : Start new OpenCode session
--
-- See: https://github.com/NickvanDyke/opencode.nvim
-- ============================================================================

return {
  "nickjvandyke/opencode.nvim",
  version = "*",
  dependencies = {
    {
      "folke/snacks.nvim",
      optional = true,
      opts = {
        input = {},
        picker = {
          actions = {
            opencode_send = function(...) return require("opencode").snacks_picker_send(...) end,
          },
          win = {
            input = {
              keys = {
                ["<a-a>"] = { "opencode_send", mode = { "n", "i" } },
              },
            },
          },
        },
      },
    },
  },
  config = function()
    ---@type opencode.Opts
    vim.g.opencode_opts = {
      prompts = {
        -- Supplement built-in prompts (review, explain, fix, optimize, test, document, etc.)
        commit = { prompt = "Write a conventional commit message for @diff" },
        logging = { prompt = "Add strategic logging (DEBUG/INFO/WARN/ERROR) to @this" },
        refactor = { prompt = "Refactor @this following Clean Architecture principles" },
      },
    }

    vim.o.autoread = true

    -- Core keymaps
    vim.keymap.set({ "n", "x" }, "<C-a>", function() require("opencode").ask("@this: ", { submit = true }) end, { desc = "Ask opencode" })
    vim.keymap.set({ "n", "x" }, "<C-x>", function() require("opencode").select() end, { desc = "Opencode actions" })
    vim.keymap.set({ "n", "t" }, "<C-.>", function() require("opencode").toggle() end, { desc = "Toggle opencode" })

    -- Operator (supports ranges and dot-repeat)
    vim.keymap.set({ "n", "x" }, "go", function() return require("opencode").operator("@this ") end, { desc = "Send range to opencode", expr = true })
    vim.keymap.set("n", "goo", function() return require("opencode").operator("@this ") .. "_" end, { desc = "Send line to opencode", expr = true })

    -- Scroll opencode messages
    vim.keymap.set("n", "<S-C-u>", function() require("opencode").command("session.half.page.up") end, { desc = "Scroll opencode up" })
    vim.keymap.set("n", "<S-C-d>", function() require("opencode").command("session.half.page.down") end, { desc = "Scroll opencode down" })

    -- Restore default increment/decrement since <C-a>/<C-x> are remapped
    vim.keymap.set("n", "+", "<C-a>", { desc = "Increment", noremap = true })
    vim.keymap.set("n", "-", "<C-x>", { desc = "Decrement", noremap = true })
  end,
}
