-- load lspconfig
require("nvchad.configs.lspconfig").defaults()

-- List of servers installed by default
local servers = { "lua_ls", "ltex", "pyright" }

require("mason-lspconfig").setup {
    automatic_installation = true,
    ensure_installed = servers
}

require("mason-lspconfig").setup_handlers({
    function(server_name) -- Default handler for any LSP server
        require("lspconfig")[server_name].setup {}
    end,
})
