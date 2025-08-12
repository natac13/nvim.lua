return {

	{
		"catppuccin/nvim",
		lazy = false,
		priority = 1000,
		config = function()
			require("catppuccin").setup({
				no_bold = false, -- Enable bold for better contrast
				no_italic = true,
				term_colors = true,
				flavour = "mocha",
				default_integrations = true,
				integrations = {
					alpha = true,
					barbecue = { alt_background = true },
					cmp = true,
					fidget = true,
					gitsigns = true,
					harpoon = true,
					indent_blankline = {
						enabled = true,
						scope_color = "lavender",
						colored_indent_levels = false,
					},
					mason = true,
					native_lsp = { 
						enabled = true,
						virtual_text = {
							errors = { "italic" },
							hints = { "italic" },
							warnings = { "italic" },
							information = { "italic" },
						},
						underlines = {
							errors = { "underline" },
							hints = { "underline" },
							warnings = { "underline" },
							information = { "underline" },
						},
					},
					neotree = true,
					notify = true,
					telescope = false,
					treesitter = true,
					treesitter_context = true,
					ufo = true,
					which_key = true,
				},
				-- color_overrides = {
				-- 	mocha = {
				-- 		pink = "#f4b8e4",
				-- 		base = "#1d2021",
				-- 		mantle = "#191b1c",
				-- 		crust = "#141617",
				-- 	},
				-- },
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
