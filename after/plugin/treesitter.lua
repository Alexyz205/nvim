require("nvim-treesitter.configs").setup({
    ensure_installed = { "c", "lua", "vim", "vimdoc", "python", "javascript", "html" },
    sync_install = false,
    highlight = { enable = true },
    indent = { enable = true },  
})