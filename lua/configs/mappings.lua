-- General
local map = vim.keymap.set

map("i", "<C-b>", "<ESC>^i", { desc = "move beginning of line" })
map("i", "<C-e>", "<End>", { desc = "move end of line" })
map("i", "<C-h>", "<Left>", { desc = "move left" })
map("i", "<C-l>", "<Right>", { desc = "move right" })
map("i", "<C-j>", "<Down>", { desc = "move down" })
map("i", "<C-k>", "<Up>", { desc = "move up" })

map("n", "<C-s>", "<cmd>w<CR>", { desc = "General Save file" })
map("n", "<C-c>", "<cmd>%y+<CR>", { desc = "General Copy whole file" })

map("n", "<leader>h", "<cmd>sp<CR>", { desc = "Horizontal split" })
map("n", "<leader>v", "<cmd>vsp<CR>", { desc = "Vertical split" })

-- visual mode mappings
map("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move selected lines down" })
map("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move selected lines up" })

-- normal navigation
map("n", "J", "mzJ`z", { desc = "Join lines without inserting a space" })
map("n", "<C-d>", "<C-d>zz", { desc = "Scroll down and recenter cursor" })
map("n", "<C-u>", "<C-u>zz", { desc = "Scroll up and recenter cursor" })
map("n", "n", "nzzzv", { desc = "Go to next search result and recenter cursor" })
map("n", "N", "Nzzzv", { desc = "Go to previous search result and recenter cursor" })

-- yank and paste
map("x", "<leader>p", [["_dP]], { desc = "Paste without yanking" })
map({ "n", "v" }, "<leader>y", [["+y]], { desc = "Yank to system clipboard" })
map("n", "<leader>Y", [["+Y]], { desc = "Yank entire line to system clipboard" })
map({ "n", "v" }, "<leader>d", [["_d]], { desc = "Delete without yanking" })

map("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], { desc = "Substitute word under cursor" })

map("n", "<leader><leader>", "<cmd>so<CR>", { desc = "Source current file" })


-- buffer navigation
map("n", "<tab>", "<cmd>bnext<CR>", { desc = "Next buffer" })
map("n", "<s-tab>", "<cmd>bprevious<CR>", { desc = "Previous buffer" })
map("n", "<leader>Q", "<cmd>bdelete<CR>", { desc = "Delete buffer" })

-- formater
map("n", "<leader>fm", function()
    require("conform").format { lsp_fallback = true }
end, { desc = "General Format file" })

-- comment
map("n", "<C-_>", "gcc", { desc = "Toggle Comment", remap = true })
map("v", "<C-_>", "gc", { desc = "Toggle comment", remap = true })

-- nvimtree
map("n", "<C-n>", "<cmd>NvimTreeToggle<CR>", { desc = "nvimtree toggle window" })

-- telescope
map("n", "<leader>fw", "<cmd>Telescope live_grep<CR>", { desc = "telescope live grep" })
map("n", "<C-p>", "<cmd>Telescope git_files<CR>", { desc = "telescope git files" })
map("n", "<leader>fb", "<cmd>Telescope buffers<CR>", { desc = "telescope find buffers" })
map("n", "<leader>fh", "<cmd>Telescope help_tags<CR>", { desc = "telescope help page" })
map("n", "<leader>ma", "<cmd>Telescope marks<CR>", { desc = "telescope find marks" })
map("n", "<leader>fo", "<cmd>Telescope oldfiles<CR>", { desc = "telescope find oldfiles" })
map("n", "<leader>fz", "<cmd>Telescope current_buffer_fuzzy_find<CR>", { desc = "telescope find in current buffer" })
map("n", "<leader>cm", "<cmd>Telescope git_commits<CR>", { desc = "telescope git commits" })
map("n", "<leader>gt", "<cmd>Telescope git_status<CR>", { desc = "telescope git status" })
map("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "telescope find files" })
map(
    "n",
    "<leader>fa",
    "<cmd>Telescope find_files follow=true no_ignore=true hidden=true<CR>",
    { desc = "telescope find all files" }
)

-- tmux
map("n", "<C-h>", "<cmd>TmuxNavigateLeft<CR>", { desc = "switch window left" })
map("n", "<C-j>", "<cmd>TmuxNavigateDown<CR>", { desc = "switch window down" })
map("n", "<C-k>", "<cmd>TmuxNavigateUp<CR>", { desc = "switch window up" })
map("n", "<C-l>", "<cmd>TmuxNavigateRight<CR>", { desc = "switch window right" })
