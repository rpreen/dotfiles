return {
	"yetone/avante.nvim",
	build = "make",
	event = "VeryLazy",
	version = false,
	opts = {
		mode = "agentic",
		provider = "copilot",
		providers = {
			copilot = {
				model = "claude-opus-4-6",
			},
			groq = {
				__inherited_from = "openai",
				api_key_name = "GROQ_API_KEY",
				endpoint = "https://api.groq.com/openai/v1/",
				model = "llama-3.3-70b-versatile",
				max_tokens = 32768,
				disable_tools = true,
			},
			gemini = {
				api_key_name = "GEMINI_API_KEY",
				model = "gemini-2.5-flash",
				disable_tools = true,
			},
			ollama = {
				__inherited_from = "openai",
				endpoint = "http://localhost:11434/v1",
				model = "qwen2.5-coder:7b",
				disable_tools = true,
			},
		},
		windows = {
			position = "right",
			width = 45,
		},
		file_selector = {
			provider = "telescope",
		},
	},
	dependencies = {
		"nvim-lua/plenary.nvim",
		"MunifTanjim/nui.nvim",
		"stevearc/dressing.nvim",
		"nvim-tree/nvim-web-devicons",
		{
			-- requires Node.js >=22
			-- get: https://nodesource.com/products/distributions
			-- run: :Copilot auth
			"zbirenbaum/copilot.lua",
			cmd = "Copilot",
			event = "InsertEnter",
			config = function()
				require("copilot").setup({
					panel = {
						auto_refresh = false,
						keymap = {
							accept = "<CR>",
							jump_prev = "[[",
							jump_next = "]]",
							refresh = "gr",
							open = "<M-CR>",
						},
					},
					suggestion = {
						auto_trigger = false,
						keymap = {
							accept = "<M-l>",
							prev = "<M-[>",
							next = "<M-]>",
							dismiss = "<C-]>",
						},
					},
				})
			end,
		},
		{
			-- support for image pasting
			"HakonHarnes/img-clip.nvim",
			event = "VeryLazy",
			opts = {
				default = {
					embed_image_as_base64 = false,
					prompt_for_file_name = false,
					drag_and_drop = {
						insert_mode = true,
					},
					use_absolute_path = true,
				},
			},
		},
		{
			"MeanderingProgrammer/render-markdown.nvim",
			opts = {
				file_types = { "Avante" },
			},
			ft = { "Avante" },
		},
	},
}
