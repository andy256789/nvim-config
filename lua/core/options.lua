-- Options configuration
local opt = vim.opt
local g = vim.g

-- Disable netrw banner
g.netrw_banner = 0
g.editorconfig = true

-- Leader key
g.mapleader = " "
g.maplocalleader = " "

-- Cursor and display settings
opt.guicursor = "a:block"

-- Numbers
opt.number = true
opt.relativenumber = true

-- Indentation
opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.autoindent = true
opt.smartindent = true
opt.wrap = false

-- Files
opt.swapfile = false
opt.backup = false
opt.undofile = true

-- Search
opt.incsearch = true
opt.inccommand = "split"
opt.ignorecase = true
opt.smartcase = true
opt.hlsearch = true

-- Colors
opt.termguicolors = true
opt.background = "dark"

-- UI
opt.scrolloff = 8
opt.signcolumn = "yes"
-- Transparency
opt.winblend = 10
opt.pumblend = 10

-- Folding
opt.foldenable = true
opt.foldmethod = "manual"
opt.foldlevel = 99
opt.foldcolumn = "0"

-- Backspace behavior
opt.backspace = {"start", "eol", "indent"}

-- Window splitting
opt.splitright = true
opt.splitbelow = true

-- File path
opt.isfname:append("@-@")

-- Performance
opt.updatetime = 50

-- Clipboard
opt.clipboard = "unnamedplus"

-- Mouse
opt.mouse = "a" 