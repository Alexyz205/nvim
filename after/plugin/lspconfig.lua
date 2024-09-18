-- load lspconfig
require("nvchad.configs.lspconfig").defaults()

local lspconfig = require "lspconfig"

-- EXAMPLE
local servers = { "lua_ls", "ltex" }

-- lsps with default config
local nvlsp = require "nvchad.configs.lspconfig"
for _, lsp in ipairs(servers) do
    lspconfig[lsp].setup {
        on_attach = nvlsp.on_attach,
        on_init = nvlsp.on_init,
        capabilities = nvlsp.capabilities
    }
end

require("mason-lspconfig").setup {
    automatic_installation = true,
    ensure_installed = servers
}