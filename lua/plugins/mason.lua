-- Custom configuration for Mason to disable certificate validation in curl

return {
	-- Mason setup - core package management
	{
		"williamboman/mason.nvim",
		version = "^1.0.0",
		opts = function(_, opts)
			-- Keep existing options
			opts = opts or {}

			-- Ensure mason has a local registry source configured
			opts.registries = vim.list_extend(opts.registries or {}, {
				"github:mason-org/mason-registry",
			})

			-- Configure install settings with custom curl options
			opts.install = vim.tbl_deep_extend("force", opts.install or {}, {
				-- Override the command used for package installation
				-- Explicitly use curl with the -k flag to disable certificate validation
				download_static = function(source_file, target_file)
					local command = {
						"curl",
						"--silent",
						"--location",
						"--retry",
						"3",
						"--retry-delay",
						"1",
						"-k", -- -k or --insecure flag disables certificate validation
						"--output",
						target_file,
						source_file,
					}

					vim.notify("Downloading: " .. source_file .. " to " .. target_file, vim.log.levels.INFO)
					local result = vim.fn.system(command)

					if vim.v.shell_error ~= 0 then
						local err = ("Failed to download file %s from %s. Error:\n%s"):format(
							target_file,
							source_file,
							result
						)
						vim.notify(err, vim.log.levels.ERROR)
						error(err)
					end

					return result
				end,
			})

			return opts
		end,
		config = function(_, opts)
			require("mason").setup(opts)
			-- Force registry refresh on start to avoid "Cannot find package" errors
			vim.defer_fn(function()
				require("mason-registry").refresh()
			end, 100)
		end,
	},

	-- Mason LSP config - ensures proper LSP server configuration
	{
		"williamboman/mason-lspconfig.nvim",
		version = "^1.0.0",
		dependencies = {
			"williamboman/mason.nvim",
		},
		opts = function(_, opts)
			-- Convert strings to table format if needed
			local ensure_installed = {}

			-- These are valid server names for mason-lspconfig
			local server_names = {
				"lua_ls",
				"pyright",
				"jsonls",
				"marksman",
				"dockerls",
				"docker_compose_language_service",
			}

			-- Add all server names to ensure_installed
			for _, server in ipairs(server_names) do
				table.insert(ensure_installed, server)
			end

			-- Update options
			opts = vim.tbl_deep_extend("force", opts or {}, {
				ensure_installed = ensure_installed,
			})

			return opts
		end,
	},
}
