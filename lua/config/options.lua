local opt = vim.opt

-- tab/indent
opt.tabstop = 2
opt.shiftwidth = 2
opt.softtabstop = 2
opt.expandtab = true
opt.smartindent = true
opt.wrap = false

-- search
opt.incsearch = true
opt.ignorecase = true
opt.smartcase = true

-- visual
opt.number = true
opt.relativenumber = true
opt.termguicolors = true
opt.signcolumn = "no"

-- etc
opt.encoding = "UTF-8"
opt.cmdheight = 1
opt.scrolloff = 5
-- opt.mouse:append("a")

-- vim.api.nvim_set_keymap('i', '<C-v>', '<C-r>+', { noremap = true, silent = true })
-- vim.api.nvim_set_keymap('v', '<C-c>', '"+y', { noremap = true, silent = true })
