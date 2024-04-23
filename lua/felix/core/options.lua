local opt = vim.opt -- for conciseness

-- line numbers
opt.relativenumber = true
opt.number = true

-- tabs + indentation
opt.tabstop = 4
opt.shiftwidth = 4
opt.softtabstop = 4
opt.smartindent = true
opt.expandtab = true

-- line wrapping
opt.wrap = false

-- swapfile
opt.swapfile = false
opt.backup = false
opt.undofile = true

-- search
opt.hlsearch = false
opt.incsearch = true

-- appearance
opt.termguicolors = true
opt.signcolumn = "yes"

-- clipboard
opt.clipboard:append("unnamedplus")

opt.scrolloff = 8

opt.updatetime = 100
