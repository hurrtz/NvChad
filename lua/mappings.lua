require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

-- Command mode shortcuts
map("n", ";", ":", { desc = "CMD enter command mode" })

-- Insert mode escapes
map("i", "jk", "<ESC>", { desc = "escape insert mode" })
map("i", "kj", "<ESC>", { desc = "escape insert mode" })

-- File operations
map("n", "<leader>q", "<cmd>q<CR>", { desc = "quit" })
map("n", "<leader>w", "<cmd>w<CR>", { desc = "save" })
map("n", "<leader>wq", "<cmd>wq<CR>", { desc = "save and quit" })

-- Better window navigation
map("n", "<C-h>", "<C-w>h", { desc = "move to left window" })
map("n", "<C-j>", "<C-w>j", { desc = "move to lower window" })
map("n", "<C-k>", "<C-w>k", { desc = "move to upper window" })
map("n", "<C-l>", "<C-w>l", { desc = "move to right window" })

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
