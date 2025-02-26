require("nvim-tree").setup({
    sort = {
        sorter = "case_sensitive"
    },
    view = {
        width = 30,
        side = "right"
    },
    renderer = {
        group_empty = true,
        highlight_git = true,
        icons = {
            show = {
                git = true
            }
        }
    },
    filters = {
        dotfiles = true
    },
    git = {
        enable = true
    }
})
