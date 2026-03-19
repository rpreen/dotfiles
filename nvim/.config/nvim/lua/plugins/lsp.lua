return {
	"neovim/nvim-lspconfig",
	lazy = false,
	dependencies = {
		{
			"mason-org/mason-lspconfig.nvim",
			dependencies = {
				{ "mason-org/mason.nvim", opts = {} },
			},
			config = function()
				local servers = { "ruff", "clangd", "texlab" }

				if vim.fn.executable("node") == 1 then
					table.insert(servers, "pyright")
				end

				require("mason-lspconfig").setup({
					ensure_installed = servers,
					automatic_installation = true,
					automatic_enable = true,
				})
			end,
		},
		{ "hrsh7th/cmp-nvim-lsp" },
	},
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		-- Pyright types and completion
		local capabilities = require("cmp_nvim_lsp").default_capabilities()

		local on_attach = function(_, bufnr)
			vim.keymap.set(
				"n",
				"gd",
				vim.lsp.buf.definition,
				{ buffer = bufnr, desc = "Go to definition" }
			)

			vim.keymap.set(
				"n",
				"gD",
				vim.lsp.buf.declaration,
				{ buffer = bufnr, desc = "Go to declaration" }
			)

			vim.keymap.set(
				"n",
				"gr",
				vim.lsp.buf.references,
				{ buffer = bufnr, desc = "Go to references" }
			)

			vim.keymap.set(
				"n",
				"gi",
				vim.lsp.buf.implementation,
				{ buffer = bufnr, desc = "Go to implementation" }
			)

			vim.keymap.set(
				"n",
				"K",
				vim.lsp.buf.hover,
				{ buffer = bufnr, desc = "Show hover info" }
			)

			vim.keymap.set(
				"n",
				"<leader>rn",
				vim.lsp.buf.rename,
				{ buffer = bufnr, desc = "Rename" }
			)

			vim.keymap.set(
				"n",
				"<leader>rf",
				vim.lsp.buf.code_action,
				{ buffer = bufnr, desc = "Code action" }
			)
		end

		vim.lsp.config("pyright", {
			capabilities = capabilities,
			on_attach = on_attach,
			settings = {
				pyright = {
					disableOrganizeImports = true,
				},
				python = {
					analysis = {
						ignore = { "*" }, -- Using Ruff
						typeCheckingMode = "basic",
					},
				},
			},
		})

		-- Ruff linting
		vim.lsp.config("ruff", {})

		-- LaTeX
		vim.lsp.config("texlab", {
			capabilities = capabilities,
		})

		-- C/C++
		vim.lsp.config("clangd", {
			capabilities = capabilities,
		})

		-- Diagnostics popup on hover
		vim.diagnostic.config({
			float = { border = "rounded", source = "always" },
			virtual_text = false,
			signs = true,
			underline = true,
			update_in_insert = false,
			severity_sort = true,
		})

		vim.api.nvim_create_autocmd("CursorHold", {
			callback = function()
				vim.diagnostic.open_float(nil, { focusable = false })
			end,
		})
	end,
}
