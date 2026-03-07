return {
	"sindrets/diffview.nvim",
	cmd = "DiffviewOpen",
	lazy = false,
	keys = {
		{
			"<leader>gd",
			function()
				local function toggle_diffview(cmd)
					if next(require("diffview.lib").views) == nil then
						vim.cmd(cmd)
					else
						vim.cmd("DiffviewClose")
					end
				end
				toggle_diffview("DiffviewOpen")
			end,
			desc = "Toggle Diffview",
		},
		{
			"<leader>dc",
			function()
				vim.cmd("DiffviewClose")
			end,
			desc = "Close Diffview",
		},
		{
			"<leader>gD",
			function()
				vim.cmd("DiffviewOpen master..HEAD")
			end,
			desc = "Diff master",
		},
		{
			"<leader>gf",
			function()
				vim.cmd("DiffviewFileHistory %")
			end,
			desc = "File Diff History",
		},
	},

	config = function()
		local diffview = require("diffview")
		diffview.setup({
			enhanced_diff_hl = true,
			hooks = {
				-- Highlight 'DiffChange' as 'DiffDelete' on the left,
				-- and 'DiffAdd' on the right.
				view_opened = function(view)
					view.winopts = view.winopts or {}
					view.winopts.diff2 = view.winopts.diff2 or {}
					view.winopts.diff2.a = view.winopts.diff2.a or {}
					view.winopts.diff2.b = view.winopts.diff2.b or {}

					view.winopts.diff2.a.winhl = {
						"DiffChange:DiffAddAsDelete",
						"DiffText:DiffDeleteText",
						"DiffDelete:Normal",
						"DiffAdd:DiffDelete",
					}
					view.winopts.diff2.b.winhl = {
						"DiffChange:DiffAdd",
						"DiffText:DiffAddText",
						"DiffDelete:Normal",
					}
				end,
			},
		})

		vim.opt.diffopt = {
			"internal",
			"filler",
			"closeoff",
			"vertical",
			"algorithm:histogram",
			"indent-heuristic",
			"linematch:120",
		}
	end,
}
