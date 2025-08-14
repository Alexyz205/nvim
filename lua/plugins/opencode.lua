return {
  "NickvanDyke/opencode.nvim",
  dependencies = { "folke/snacks.nvim" },
  opts = {
    -- Auto-find opencode processes
    auto_find = true,

    -- Custom prompts for various development tasks
    prompts = {
      -- Code review and analysis
      review = {
        prompt =
        "Review the selected code for potential bugs, security vulnerabilities, code structure, readability, and maintainability. Focus on adherence to design patterns and architectural principles. Provide constructive feedback with specific, actionable recommendations.",
        description = "Expert code review with actionable insights"
      },

      -- Bug fixes and debugging
      fix = {
        prompt =
        "There is a problem in this code. Identify the root cause of issues and rewrite the code with fixes. Explain what was wrong and how your changes address the problems without introducing new issues.",
        description = "Diagnose and fix code issues with explanations"
      },

      -- Performance optimization
      optimize = {
        prompt =
        "Optimize the selected code to improve performance and readability. Focus on identifying computational bottlenecks, algorithmic inefficiencies, and suboptimal data structures. Explain your optimization strategy and the benefits of your changes while balancing optimization with maintainability.",
        description = "Enhance performance while maintaining readability"
      },

      -- Documentation generation
      docs = {
        prompt =
        "Add comprehensive documentation comments to the selected code. Focus on clear descriptions of purpose, parameters, return values, and exceptions. Use appropriate language formats and include helpful usage examples that demonstrate practical application.",
        description = "Generate comprehensive code documentation"
      },

      -- Test generation
      tests = {
        prompt =
        "Generate comprehensive tests for the selected code. Focus on unit tests, integration tests, and edge cases using appropriate testing frameworks. Follow testing best practices like arrange-act-assert pattern and create readable, maintainable tests with clear failure messages.",
        description = "Create thorough, maintainable test suites"
      },

      -- Code explanation
      explain = {
        prompt =
        "Explain this code in detail, covering: high-level purpose, architectural analysis, execution flow, and areas for improvement. Focus on Clean Architecture principles and proper separation of concerns.",
        description = "In-depth code analysis with improvement insights"
      },

      -- Clean Architecture refactoring
      refactor_clean = {
        prompt =
        "Refactor this code using Clean Architecture principles. Focus on proper separation of concerns with Domain Layer (core business entities), Application Layer (use cases), Interface Adapters Layer (controllers, DTOs), and Infrastructure Layer (external services). Follow the Dependency Rule where dependencies point inward only.",
        description = "Transform code using Clean Architecture patterns"
      },

      -- Commit message generation
      commit = {
        prompt =
        "Write a commit message for the staged changes using Conventional Commits specification. Keep the title under 50 characters, use imperative mood, and include a detailed explanation in the body wrapped at 72 characters. Explain why the change was made, not just what changed.",
        description = "Craft conventional, informative commit messages"
      },

      -- Logging addition
      add_logging = {
        prompt =
        "Add appropriate logging statements to the code, including different log levels (DEBUG, INFO, WARN, ERROR) and contextual information for troubleshooting. Focus on strategic logging for better observability without cluttering the code.",
        description = "Implement strategic logging for better observability"
      }
    },

    -- Context providers for injecting code context
    context_providers = {
      -- Default providers will be used unless overridden
    },
  },
  keys = {
    {
      "<leader>oc",
      function()
        require("opencode").toggle()
      end,
      desc = "Toggle opencode",
    },
    {
      "<leader>oa",
      function()
        require("opencode").ask()
      end,
      desc = "Ask opencode",
      mode = "n",
    },
    {
      "<leader>oa",
      function()
        require("opencode").ask("@selection: ")
      end,
      desc = "Ask opencode about selection",
      mode = "v",
    },
    {
      "<leader>op",
      function()
        require("opencode").select_prompt()
      end,
      desc = "Select prompt",
      mode = { "n", "v" },
    },
    {
      "<leader>on",
      function()
        require("opencode").command("session_new")
      end,
      desc = "New session",
    },
  },
}

