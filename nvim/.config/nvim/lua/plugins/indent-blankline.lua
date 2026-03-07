return {
	"lukas-reineke/indent-blankline.nvim",
	main = "ibl",
	config = function()
		local hooks = require("ibl.hooks")

		hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
			vim.api.nvim_set_hl(
				0,
				"RainbowGreen",
				{ fg = "#98C379", bold = false }
			)
		end)

		require("ibl").setup({
			indent = { char = "¦" },
			scope = {
				enabled = true,
				show_start = false,
				show_end = false,
				highlight = { "RainbowGreen" },
			},
		})

		hooks.register(
			hooks.type.SCOPE_HIGHLIGHT,
			hooks.builtin.scope_highlight_from_extmark
		)
	end,
}
