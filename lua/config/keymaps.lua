-- General
local map = vim.keymap.set

map("i", "<C-b>", "<ESC>^i", { desc = "move beginning of line" })
map("i", "<C-e>", "<End>", { desc = "move end of line" })
map("i", "<C-h>", "<Left>", { desc = "move left" })
map("i", "<C-l>", "<Right>", { desc = "move right" })
map("i", "<C-j>", "<Down>", { desc = "move down" })
map("i", "<C-k>", "<Up>", { desc = "move up" })

map("n", "<C-s>", "<cmd>w<CR>", { desc = "Save file" })
map("n", "<C-S>", "<cmd>wa<CR>", { desc = "Save all files" })
map("n", "<C-c>", "<cmd>%y+<CR>", { desc = "Copy whole file" })

-- visual mode mappings
map("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move selected lines down" })
map("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move selected lines up" })
map("n", "<leader>r", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], { desc = "Substitute word under cursor" })

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

map("n", "<leader><leader>", "<cmd>so<CR>", { desc = "Source current file" })

-- tmux
map("n", "<C-h>", "<cmd>TmuxNavigateLeft<CR>", { desc = "switch window left" })
map("n", "<C-j>", "<cmd>TmuxNavigateDown<CR>", { desc = "switch window down" })
map("n", "<C-k>", "<cmd>TmuxNavigateUp<CR>", { desc = "switch window up" })
map("n", "<C-l>", "<cmd>TmuxNavigateRight<CR>", { desc = "switch window right" })
