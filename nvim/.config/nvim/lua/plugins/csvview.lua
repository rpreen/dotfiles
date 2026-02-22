return {
	"hat0uma/csvview.nvim",
	ft = { "csv" },
	opts = {
		view = {
			display_mode = "border",
		},
		parser = {
			comments = { "#", "//" },
		},
		header_lnum = 1,
		keymaps = {
			textobject_field_inner = { "if", mode = { "o", "x" } },
			textobject_field_outer = { "af", mode = { "o", "x" } },
			jump_next_field_start = { "<Tab>", mode = { "n", "v" } },
			jump_prev_field_start = { "<S-Tab>", mode = { "n", "v" } },
			jump_next_row = { "<Enter>", mode = { "n", "v" } },
			jump_prev_row = { "<S-Enter>", mode = { "n", "v" } },
		},
	},
	cmd = { "CsvViewEnable", "CsvViewDisable", "CsvViewToggle" },

	config = function(_, opts)
		require("csvview").setup(opts)

		vim.api.nvim_create_autocmd("FileType", {
			pattern = "csv",
			callback = function()
				require("csvview").enable()
			end,
		})
	end,
}
