return {

	{
		"catppuccin/nvim",
		lazy = false,
		priority = 1000,
		config = function()
			require("catppuccin").setup({
				no_bold = true,
				no_italic = true,
				term_colors = true,
				flavour = "mocha",
				integrations = {
					cmp = true,
					fidget = true,
					gitsigns = true,
					harpoon = true,
					indent_blankline = {
						enabled = false,
						scope_color = "sapphire",
						colored_indent_levels = false,
					},
					mason = true,
					native_lsp = { enabled = true },
					noice = true,
					notify = true,
					symbols_outline = true,
					telescope = true,
					treesitter = true,
					treesitter_context = true,
				},
			})

			vim.cmd.colorscheme("catppuccin")

			-- Hide all semantic highlights until upstream issues are resolved (https://github.com/catppuccin/nvim/issues/480)
			-- for _, group in ipairs(vim.fn.getcompletion("@lsp", "highlight")) do
			-- 	vim.api.nvim_set_hl(0, group, {})
			-- end
		end,
	},
	{
		"sainnhe/gruvbox-material",
		event = "VeryLazy",
		name = "gruvbox-material",
		config = function()
			vim.g.gruvbox_material_foreground = "material"
			vim.g.gruvbox_material_background = "hard"
			vim.g.gruvbox_material_better_performance = 1
			vim.g.gruvbox_material_enable_italic = 0
			vim.g.gruvbox_material_ui_contrast = "high"
		end,
	},
	{
		"rose-pine/neovim",
		event = "VeryLazy",
		name = "rose-pine",
	},
}
