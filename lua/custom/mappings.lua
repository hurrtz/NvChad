-- Custom keybindings for NvChad v2.5
local map = vim.keymap.set

-- Insert mode mappings
map("i", "jk", "<ESC>", { desc = "escape insert mode", nowait = true })
map("i", "kj", "<ESC>", { desc = "escape insert mode", nowait = true })

-- Normal mode mappings
map("n", ";", ":", { desc = "shorthand for command prefix", nowait = true })

-- Additional useful mappings
map("n", "<leader>q", "<cmd>q<CR>", { desc = "quit" })
map("n", "<leader>w", "<cmd>w<CR>", { desc = "save" })
map("n", "<leader>wq", "<cmd>wq<CR>", { desc = "save and quit" })

-- Better window navigation
map("n", "<C-h>", "<C-w>h", { desc = "move to left window" })
map("n", "<C-j>", "<C-w>j", { desc = "move to lower window" })
map("n", "<C-k>", "<C-w>k", { desc = "move to upper window" })
map("n", "<C-l>", "<C-w>l", { desc = "move to right window" })
