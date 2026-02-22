return {
	"nvim-telescope/telescope.nvim",
	lazy = false,
	dependencies = {
		{ "nvim-lua/plenary.nvim" },
		{ "nvim-telescope/telescope-file-browser.nvim" },
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
	},

	config = function()
		local telescope = require("telescope")
		local actions = require("telescope.actions")
		local action_state = require("telescope.actions.state")

		telescope.setup({
			defaults = {
				prompt_prefix = "  ",
				selection_caret = "➤ ",
				entry_prefix = "  ",
				initial_mode = "insert",
				results_title = false,
				selection_strategy = "reset",
				sorting_strategy = "ascending",
				layout_strategy = "horizontal",
				layout_config = {
					prompt_position = "top",
					preview_cutoff = 120,
					width = 0.75,
					horizontal = {
						mirror = false,
					},
					vertical = {
						mirror = false,
					},
				},
				path_display = {
					"absolute",
				},
				mappings = {
					i = {
						["<C-j>"] = actions.move_selection_next,
						["<C-k>"] = actions.move_selection_previous,
						["<C-b>"] = actions.preview_scrolling_up,
						["<C-f>"] = actions.preview_scrolling_down,
					},
					n = {
						["<C-b>"] = actions.preview_scrolling_up,
						["<C-f>"] = actions.preview_scrolling_down,
					},
				},
			},
			pickers = {
				git_commits = {
					mappings = {
						i = {
							-- show diffview for the selected commit
							["<C-d>"] = function()
								local entry = action_state.get_selected_entry()
								actions.close(vim.api.nvim_get_current_buf())
								vim.cmd(
									("DiffviewOpen %s^!"):format(entry.value)
								)
							end,
						},
					},
				},
				git_bcommits = {
					mappings = {
						i = {
							-- show diffview for the selected commit of current buffer
							["<C-d>"] = function()
								local entry = action_state.get_selected_entry()
								actions.close(vim.api.nvim_get_current_buf())
								vim.cmd(
									("DiffviewOpen %s^!"):format(entry.value)
								)
							end,
						},
					},
				},
				git_branches = {
					mappings = {
						i = {
							-- show diffview comparing selected branch with current branch
							["<C-d>"] = function()
								local entry = action_state.get_selected_entry()
								actions.close(vim.api.nvim_get_current_buf())
								vim.cmd(
									("DiffviewOpen %s.."):format(entry.value)
								)
							end,
						},
					},
				},
			},
		})

		telescope.load_extension("file_browser")

		local builtin = require("telescope.builtin")

		vim.keymap.set(
			"n",
			"<leader>t",
			":Telescope file_browser<CR>",
			{ desc = "Project File Browser" }
		)

		vim.keymap.set(
			"n",
			"<leader>g",
			builtin.live_grep,
			{ desc = "Live Grep" }
		)

		vim.keymap.set("n", "<leader>b", builtin.buffers, { desc = "Buffers" })

		vim.keymap.set(
			"n",
			"<leader>f",
			builtin.find_files,
			{ desc = "Find Files" }
		)

		vim.keymap.set(
			"n",
			"<leader>fg",
			builtin.git_files,
			{ desc = "Find Git Files" }
		)

		vim.keymap.set(
			"n",
			"<leader>fd",
			"<cmd>Telescope lsp_definitions<CR>",
			{ desc = "Find LSP Definitions" }
		)

		vim.keymap.set(
			"n",
			"<leader>fr",
			"<cmd>Telescope lsp_references<CR>",
			{ desc = "Find LSP References" }
		)
	end,
}
