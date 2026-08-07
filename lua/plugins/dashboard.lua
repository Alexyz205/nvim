local function get_remote_url()
	if not Snacks.git.get_root() then
		return ""
	end
	return vim.fn.system("git remote get-url origin 2>/dev/null"):lower()
end

local function is_gitlab()
	return get_remote_url():find("git.dxyz.pro") ~= nil
end

local function is_github()
	return get_remote_url():find("github.com") ~= nil
end

local function gh_run(args, success_msg)
	vim.fn.jobstart(vim.list_extend({ "gh" }, args), {
		on_exit = function(_, code)
			if code == 0 then
				vim.notify(success_msg, vim.log.levels.INFO)
			else
				vim.notify(
					"gh " .. table.concat(args, " ") .. " failed (exit " .. code .. ")",
					vim.log.levels.ERROR
				)
			end
		end,
	})
end

return {
	"folke/snacks.nvim",
	---@type snacks.Config
	opts = {
		dashboard = {
			width = 60,
			row = nil,
			col = nil,
			pane_gap = 4,
			autokeys = "1234567890abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ",
			preset = {
				---@type snacks.dashboard.Item[]
				keys = {
					{ icon = " ", key = "f", desc = "Find File", action = ":lua Snacks.dashboard.pick('files')" },
					{ icon = " ", key = "n", desc = "New File", action = ":ene | startinsert" },
					{
						icon = " ",
						key = "g",
						desc = "Find Text",
						action = ":lua Snacks.dashboard.pick('live_grep')",
					},
					{
						icon = " ",
						key = "r",
						desc = "Recent Files",
						action = ":lua Snacks.dashboard.pick('oldfiles')",
					},
					{
						icon = " ",
						key = "c",
						desc = "Config",
						action = ":lua Snacks.dashboard.pick('files', {cwd = vim.fn.stdpath('config')})",
					},
					{ icon = " ", key = "s", desc = "Restore Session", section = "session" },
					{
						icon = "󰒲 ",
						key = "l",
						desc = "Lazy",
						action = ":Lazy",
						enabled = package.loaded.lazy ~= nil,
					},
					{ icon = " ", key = "q", desc = "Quit", action = ":qa" },
				},
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

				-- Quick GitLab action shortcuts (pane 1) - only for git.dxyz.pro remotes
				{ icon = " ", title = "GitLab Actions", padding = { 0, 1 }, indent = 2, enabled = is_gitlab },
				{
					icon = " ",
					key = "a",
					desc = "Approve MR",
					indent = 2,
					enabled = is_gitlab,
					action = function()
						require("gitlab").approve()
					end,
				},
				{
					icon = " ",
					key = "A",
					desc = "Revoke Approval",
					indent = 2,
					enabled = is_gitlab,
					action = function()
						require("gitlab").revoke()
					end,
				},
				{
					icon = "󰁪 ",
					key = "S",
					desc = "MR Summary",
					indent = 2,
					enabled = is_gitlab,
					action = function()
						require("gitlab").summary()
					end,
				},
				{
					icon = "󰑬 ",
					key = "i",
					desc = "Pipeline",
					indent = 2,
					enabled = is_gitlab,
					action = function()
						require("gitlab").pipeline()
					end,
				},
				{
					icon = "󰙵 ",
					key = "d",
					desc = "Discussions",
					indent = 2,
					enabled = is_gitlab,
					action = function()
						require("gitlab").toggle_discussions()
					end,
				},
				{
					icon = "󰈙 ",
					key = "o",
					desc = "Open in Browser",
					indent = 2,
					enabled = is_gitlab,
					action = function()
						require("gitlab").open_in_browser()
					end,
				},
				{
					icon = "󰖟 ",
					key = "u",
					desc = "Copy MR URL",
					indent = 2,
					enabled = is_gitlab,
					action = function()
						require("gitlab").copy_mr_url()
					end,
				},
				{
					icon = "󰊤 ",
					key = "C",
					desc = "Choose MR",
					indent = 2,
					enabled = is_gitlab,
					action = function()
						require("gitlab").choose_merge_request()
					end,
				},
				{
					icon = "󱓼 ",
					key = "N",
					desc = "Create MR",
					indent = 2,
					padding = 1,
					enabled = is_gitlab,
					action = function()
						require("gitlab").create_mr()
					end,
				},

				-- Quick GitHub action shortcuts (pane 1) - only for github.com remotes
				{ icon = " ", title = "GitHub Actions", padding = { 0, 1 }, indent = 2, enabled = is_github },
				{
					icon = " ",
					key = "a",
					desc = "Approve PR",
					indent = 2,
					enabled = is_github,
					action = function()
						gh_run({ "pr", "review", "--approve" }, "PR approved")
					end,
				},
				{
					icon = " ",
					key = "A",
					desc = "Request Changes",
					indent = 2,
					enabled = is_github,
					action = function()
						gh_run({ "pr", "review", "--request-changes" }, "Changes requested")
					end,
				},
				{
					icon = "󰁪 ",
					key = "S",
					desc = "PR Summary",
					indent = 2,
					enabled = is_github,
					action = ":Octo pr edit",
				},
				{
					icon = "󰑬 ",
					key = "i",
					desc = "Checks",
					indent = 2,
					enabled = is_github,
					action = ":Octo pr checks",
				},
				{
					icon = "󰙵 ",
					key = "d",
					desc = "Discussions",
					indent = 2,
					enabled = is_github,
					action = ":Octo review",
				},
				{
					icon = "󰈙 ",
					key = "o",
					desc = "Open in Browser",
					indent = 2,
					enabled = is_github,
					action = ":Octo pr browser",
				},
				{
					icon = "󰖟 ",
					key = "u",
					desc = "Copy PR URL",
					indent = 2,
					enabled = is_github,
					action = ":Octo pr url",
				},
				{
					icon = "󰊤 ",
					key = "C",
					desc = "Choose PR",
					indent = 2,
					enabled = is_github,
					action = ":Octo pr list",
				},
				{
					icon = "󱓼 ",
					key = "N",
					desc = "Create PR",
					indent = 2,
					padding = 1,
					enabled = is_github,
					action = ":Octo pr create",
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
					title = "My Merge Requests",
					section = "terminal",
					enabled = is_gitlab,
					cmd = "glab mr list --author=@me -P5 2>/dev/null | sed '/^Showing/d' || echo 'No GitLab remote or token configured'",
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
					enabled = is_gitlab,
					cmd = "glab ci list -P5 2>/dev/null | sed '/^Showing/d;/^$/d' || echo 'No GitLab remote or token configured'",
					height = 7,
					padding = 1,
					ttl = 5 * 60,
					indent = 3,
				},

				{
					pane = 2,
					icon = " ",
					title = "My Pull Requests",
					section = "terminal",
					enabled = is_github,
					cmd = "gh pr list --author @me --limit 5 2>/dev/null || echo 'No GitHub remote or token configured'",
					height = 7,
					padding = 1,
					ttl = 5 * 60,
					indent = 3,
				},

				{
					pane = 2,
					icon = " ",
					title = "Workflow Runs",
					section = "terminal",
					enabled = is_github,
					cmd = "gh run list --limit 5 2>/dev/null || echo 'No GitHub remote or token configured'",
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
		},
	},
}
