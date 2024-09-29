local cmp = require "cmp"

local field_arrangement = {
    atom = { "kind", "abbr", "menu" },
    atom_colored = { "kind", "abbr", "menu" },
}

local function border(hl_name)
    return {
        { "╭", hl_name },
        { "─", hl_name },
        { "╮", hl_name },
        { "│", hl_name },
        { "╯", hl_name },
        { "─", hl_name },
        { "╰", hl_name },
        { "│", hl_name },
    }
end

cmp.setup {
    completion = {
        completeopt = "menu,menuone",
    },

    window = {
        completion = {
            border = border "CmpDocBorder",
            winhighlight = "Normal:CmpDoc",
        },
        documentation = {
            border = border "CmpDocBorder",
            winhighlight = "Normal:CmpDoc",
        },
    },

    mapping = {
        ["<C-p>"] = cmp.mapping.select_prev_item(),
        ["<C-n>"] = cmp.mapping.select_next_item(),
        ["<C-d>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<C-e>"] = cmp.mapping.close(),

        ["<CR>"] = cmp.mapping.confirm {
            behavior = cmp.ConfirmBehavior.Insert,
            select = true,
        },
    },
    sources = {
        { name = "nvim_lsp" },
        { name = "buffer" },
        { name = "luasnip" },
        { name = "nvim_lua" },
        { name = "path" },
    },
    snippet = {
        expand = function(args)
            vim.snippet.expand(args.body)
        end,
    },
}
