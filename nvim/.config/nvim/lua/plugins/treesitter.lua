return {
	"nvim-treesitter/nvim-treesitter",
	lazy = false,
	branch = "master",
	build = ":TSUpdate",
	dependencies = { "nvim-treesitter/nvim-treesitter-textobjects" },
	config = function()
		require("nvim-treesitter.configs").setup({
			highlight = {
				enable = true,
				disable = { "csv" },
			},
			indent = { enable = true },
			incremental_selection = {
				enable = true,
				keymaps = {
					init_selection = "<CR>",
					node_incremental = "<CR>",
					scope_incremental = "<TAB>",
					node_decremental = "<BS>",
				},
			},
			auto_install = true,
			ensure_installed = {
				"c",
				"lua",
				"query",
				"python",
				"markdown",
			},
		})

		-- Folding configuration
		vim.opt.foldmethod = "expr"
		vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
		vim.opt.foldtext = "v:lua.MyFoldText()"
		vim.opt.foldlevel = 99
		vim.opt.foldlevelstart = -1
		vim.opt.foldnestmax = 5
		vim.opt.foldenable = true

		-- Fold text
		function _G.MyFoldText()
			local line = vim.fn.getline(vim.v.foldstart)
			local numberOfLines = 1 + vim.v.foldend - vim.v.foldstart
			local sub = line:gsub("/%*", ""):gsub("%*/", ""):gsub("{{{%d=", "")
			return vim.v.folddashes .. sub .. " (" .. numberOfLines .. " Lines)"
		end
	end,
}
