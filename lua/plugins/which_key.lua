return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	opts = {
		preset = "modern",
		delay = 500,
		icons = {
			breadcrumb = "»",
			separator = "➜",
			group = "+",
		},
		layout = {
			height = { min = 4, max = 25 },
			width = { min = 20, max = 50 },
			spacing = 3,
			align = "left",
		},
		show_help = true,
		show_keys = true,
	},
	config = function(_, opts)
		local wk = require("which-key")
		wk.setup(opts)

		-- Define key groups with better organization
		wk.add({
			{ "<leader>b", group = " Buffer" },
			{ "<leader>f", group = " Find" },
			{ "<leader>g", group = " Git" },
			{ "<leader>l", group = " LSP" },
			{ "<leader>q", group = " Session" },
			{ "<leader>s", group = " Search" },
			{ "<leader>t", group = " Toggle" },
			{ "<leader>w", group = " Window" },
			{ "<leader>y", group = " Yank" },
		})
	end,
}
