-- Display
vim.opt.cmdheight = 0
vim.opt.colorcolumn = ""
vim.opt.cursorcolumn = false
vim.opt.cursorline = true
vim.opt.cursorlineopt = "number"
vim.opt.errorbells = false
vim.opt.fillchars = { eob = " " }
vim.opt.laststatus = 3
vim.opt.modeline = false
vim.opt.number = true
vim.opt.numberwidth = 2
vim.opt.relativenumber = true
vim.opt.ruler = false
vim.opt.showmatch = true
vim.opt.showmode = false
vim.opt.signcolumn = "yes"
vim.opt.splitkeep = "screen"
vim.opt.title = true
vim.opt.wrap = true

-- Whitespace Visualisation
vim.opt.list = false
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }

-- Indentation
vim.opt.autoindent = true
vim.opt.expandtab = true
vim.opt.shiftround = true
vim.opt.shiftwidth = 4
vim.opt.smartindent = true
vim.opt.smarttab = true
vim.opt.softtabstop = 4
vim.opt.tabstop = 4

-- Wrapping
vim.opt.textwidth = 80
vim.opt.formatoptions = "qjrn"

-- Search
vim.opt.hlsearch = true
vim.opt.ignorecase = true
vim.opt.incsearch = true
vim.opt.smartcase = true

-- Editing Behaviour
vim.opt.autoread = true
vim.opt.completeopt = { "menuone", "noselect" }
vim.opt.cpoptions:append("$")
vim.opt.virtualedit = "all"
vim.opt.whichwrap:append("<>[]hl")

-- System
vim.opt.clipboard = "unnamedplus"
vim.opt.encoding = "utf-8"
vim.opt.hidden = true
vim.opt.updatetime = 250

-- Undo & History
vim.opt.backup = false
vim.opt.history = 1000
vim.opt.swapfile = true
vim.opt.undofile = true
vim.opt.undolevels = 1000

local undodir = vim.fn.stdpath("data") .. "/undo"
if vim.fn.isdirectory(undodir) == 0 then
	vim.fn.mkdir(undodir, "p")
end
vim.opt.undodir = undodir

-- Scrolling
vim.opt.scrolloff = 8
vim.opt.sidescrolloff = 8

-- Splits
vim.opt.splitbelow = true
vim.opt.splitright = true

-- Spelling
vim.opt.spelllang = "en_gb"

-- Mouse
vim.opt.mouse = "a"

-- Disable Intro
vim.opt.shortmess:append("sI")
