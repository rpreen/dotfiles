return {
	"hrsh7th/nvim-cmp",
	lazy = false,
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
		"hrsh7th/nvim-cmp",
		"L3MON4D3/LuaSnip",
		"saadparwaiz1/cmp_luasnip",
		"onsails/lspkind.nvim",
	},
	config = function()
		local cmp = require("cmp")
		local luasnip = require("luasnip")
		local lspkind = require("lspkind")

		cmp.setup({
			snippet = {
				expand = function(args)
					luasnip.lsp_expand(args.body)
				end,
			},
			window = {
				completion = {
					border = "single",
					winhighlight = table.concat({
						"Normal:CmpNormal",
						"FloatBorder:FloatBorder",
						"CursorLine:CmpCursorLine",
						"Search:None",
					}, ","),
				},
				documentation = {
					border = "single",
				},
			},
			mapping = {
				["<C-b>"] = cmp.mapping.scroll_docs(-4),

				["<C-f>"] = cmp.mapping.scroll_docs(4),

				["<Tab>"] = cmp.mapping(function(fallback)
					if cmp.visible() then
						cmp.select_next_item()
					else
						fallback()
					end
				end, { "i", "s" }),

				["<S-Tab>"] = cmp.mapping(function(fallback)
					if cmp.visible() then
						cmp.select_prev_item()
					else
						fallback()
					end
				end, { "i", "s" }),

				["<CR>"] = cmp.mapping.confirm({ select = true }),
			},
			sources = {
				{ name = "nvim_lsp" },
				{ name = "luasnip" },
				{ name = "path" },
				{ name = "buffer" },
			},

			-- Icons
			formatting = {
				fields = { "abbr", "icon", "kind" },
				format = lspkind.cmp_format({
					maxwidth = {
						menu = 50,
						abbr = 50,
					},
					ellipsis_char = "...",
					show_labelDetails = true,
					before = function(_, vim_item)
						return vim_item
					end,
				}),
			},
		})
	end,
}
