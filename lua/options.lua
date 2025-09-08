require "nvchad.options"

-- add yours here!

local opt = vim.opt
local g = vim.g

-- Display options
opt.relativenumber = true
opt.cursorline = true
opt.scrolloff = 8
opt.sidescrolloff = 8

-- Performance optimizations
opt.lazyredraw = true
opt.updatetime = 300
opt.timeoutlen = 500

-- Search improvements
opt.ignorecase = true
opt.smartcase = true
opt.hlsearch = false
opt.incsearch = true

-- Indentation
opt.shiftwidth = 2
opt.tabstop = 2
opt.softtabstop = 2
opt.expandtab = true
opt.smartindent = true

-- Split behavior
opt.splitbelow = true
opt.splitright = true

-- Backup and swap files
opt.backup = false
opt.writebackup = false
opt.swapfile = false
opt.undofile = true

-- Disable some providers for faster startup
g.loaded_ruby_provider = 0
g.loaded_perl_provider = 0
g.loaded_python3_provider = 0
g.loaded_node_provider = 0
