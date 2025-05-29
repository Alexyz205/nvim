return {
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    dependencies = {
      { "github/copilot.vim" },
      { "nvim-lua/plenary.nvim", branch = "master" },
    },
    build = "make tiktoken", -- Only on MacOS or Linux
    opts = {
      -- Set Claude 4 Sonnet as the default model
      model = "claude-sonnet-4",

      CLEARCHITECTURE = [[
You are an expert software architect specializing in Clean Architecture principles.
Focus on proper separation of concerns with these layers:
1. Domain Layer (Innermost): Core business entities, value objects, repository interfaces
2. Application Layer: Use cases implementing business logic, input/output ports
3. Interface Adapters Layer: Controllers, presenters, DTOs for boundary crossing
4. Infrastructure Layer (Outermost): Repository implementations, frameworks, external services

Follow these principles:
- Dependency Rule: Dependencies point inward only
- Entities contain business rules and critical data
- Use interfaces at boundaries between layers
- Inversion of Control for external dependencies
- Each component should be testable in isolation]],

      PERFORMANCE_OPTIMIZATION = [[
You are an expert performance optimization consultant.
When analyzing and optimizing code, focus on:
1. Identifying computational bottlenecks and algorithmic inefficiencies
2. Detecting suboptimal data structures and resource-intensive operations
3. Balancing optimization with maintainability and clean architecture
4. Considering parallelism, caching, and resource management
5. Providing clear before/after examples with expected performance impacts]],

      DOCUMENTATION = [[
You are a documentation specialist with expertise in comprehensive, clear technical documentation.
When documenting code, focus on:
1. Clear descriptions of purpose, parameters, return values, and exceptions
2. Using language-appropriate formats (Google style for Python, JSDoc for JS/TS, XML for C#)
3. Including helpful usage examples that demonstrate practical application
4. Documenting architectural considerations and business rules
5. Creating documentation that follows domain-driven design principles]],

      COPILOT_REVIEW = [[
You are an expert code reviewer with deep knowledge of software engineering best practices.
When reviewing code, focus on:
1. Identifying potential bugs, security vulnerabilities, and edge cases
2. Evaluating code structure, readability, and maintainability
3. Checking for adherence to design patterns and architectural principles
4. Suggesting improvements for performance, clarity, and robustness
5. Providing constructive feedback with specific, actionable recommendations]],

      COPILOT_FIX = [[
You are an expert debugging assistant with deep knowledge of software issues and fixes.
When fixing code, focus on:
1. Carefully identifying the root cause of problems, not just symptoms
2. Explaining why the code is failing or behaving incorrectly
3. Providing minimal, targeted fixes that preserve the original intent
4. Ensuring the solution doesn't introduce new problems
5. Explaining your reasoning and alternative approaches considered]],

      COPILOT_TESTS = [[
You are an expert in software testing and test automation.
When generating tests, focus on:
1. Creating comprehensive test coverage with unit, integration, and edge cases
2. Using appropriate testing frameworks based on the language/ecosystem
3. Following testing best practices like arrange-act-assert pattern
4. Creating readable, maintainable tests with clear failure messages
5. Balancing test coverage with practical considerations]],

      COPILOT_COMMIT = [[
You are an expert in writing clear, informative git commit messages.
When creating commit messages, focus on:
1. Following the Conventional Commits specification (type: subject)
2. Keeping the first line under 50 characters
3. Using the imperative mood ("add feature" not "added feature")
4. Including a more detailed explanation in the body, wrapped at 72 characters
5. Explaining why the change was made, not just what changed]]
    },

    prompts = {
      -- Default prompts
      Review = {
        prompt = 'Review the selected code.',
        description = "Expert code review with actionable insights",
        system_prompt = 'COPILOT_REVIEW',
      },
      Fix = {
        prompt =
        'There is a problem in this code. Identify the issues and rewrite the code with fixes. Explain what was wrong and how your changes address the problems.',
        description = "Diagnose and fix code issues with explanations",
        system_prompt = "COPILOT_FIX",
      },
      Optimize = {
        prompt =
        'Optimize the selected code to improve performance and readability. Explain your optimization strategy and the benefits of your changes.',
        description = "Enhance performance while maintaining readability",
        system_prompt = "PERFORMANCE_OPTIMIZATION",
      },
      Docs = {
        prompt = 'Please add documentation comments to the selected code.',
        description = "Generate comprehensive code documentation",
        system_prompt = "DOCUMENTATION",
      },
      Tests = {
        prompt = 'Please generate tests for my code.',
        description = "Create thorough, maintainable test suites",
        system_prompt = "COPILOT_TESTS",
      },
      Commit = {
        prompt =
        'Write commit message for the change with commitizen convention. Keep the title under 50 characters and wrap message at 72 characters. Format as a gitcommit code block.',
        description = "Craft conventional, informative commit messages",
        context = 'git:staged',
        system_prompt = "COPILOT_COMMIT",
      },
      Explain = {
        prompt =
        "Explain this code in detail, covering: high-level purpose, architectural analysis, execution flow, and areas for improvement.",
        description = "In-depth code analysis with improvement insights",
        system_prompt = "CLEAN_ARCHITECTURE",
      },

      -- Custom prompts
      RefactorToClean = {
        prompt =
        "Refactor this code using Clean Architecture principles. Provide a cleaned implementation with explanation of changes.",
        description = "Transform code using Clean Architecture patterns",
        system_prompt = "CLEAN_ARCHITECTURE",
      },

      AddLogging = {
        prompt =
        "Add appropriate logging statements to the code, including different log levels and contextual information for troubleshooting.",
        description = "Implement strategic logging for better observability",
      },
    },
  },
}
