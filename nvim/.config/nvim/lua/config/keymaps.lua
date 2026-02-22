-- Toggle highlighting current column
vim.keymap.set(
	"n",
	"<Leader>l",
	":set cursorcolumn!<CR>",
	{ silent = true, desc = "Toggle cursor highlighting" }
)

-- Set quick command mode from normal mode
vim.keymap.set("n", ";", ":", { silent = true, desc = "Command mode" })

-- Allow movement between wrapped lines as if separate lines
vim.keymap.set("n", "j", "gj", { silent = true, desc = "Move down" })
vim.keymap.set("n", "k", "gk", { silent = true, desc = "Move up" })

-- Set quick escape from insert mode
vim.keymap.set("i", "jj", "<esc>", { silent = true, desc = "Escape insert" })
vim.keymap.set("i", "Jj", "<esc>", { silent = true, desc = "Escape insert" })
vim.keymap.set("i", "jJ", "<esc>", { silent = true, desc = "Escape insert" })
vim.keymap.set("i", "JJ", "<esc>", { silent = true, desc = "Escape insert" })

-- Insensitive quit
vim.cmd([[
  cnoreabbrev Q q
  cnoreabbrev Qa qa
  cnoreabbrev QA qa
  cnoreabbrev Wq wq
  cnoreabbrev WQ wq
  cnoreabbrev W w
]])

-- Clear search highlight
vim.keymap.set(
	"n",
	",/",
	":nohlsearch<CR>",
	{ silent = true, desc = "Clear search" }
)

-- Toggle line comment
vim.keymap.set("n", ",,", "gcc", { remap = true, desc = "Toggle comment" })
vim.keymap.set("v", ",,", "gc", { remap = true, desc = "Toggle comment" })
