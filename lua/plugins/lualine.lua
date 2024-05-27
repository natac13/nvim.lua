return {
	"nvim-lualine/lualine.nvim",
	lazy = false,
	dependencies = {
		"AndreM222/copilot-lualine",
	},
	opts = {
		options = {
			-- theme = "gruvbox-material",
			theme = "catppuccin",
			section_separators = "",
			component_separators = "",
			-- component_separators = { left = "", right = "" },
			-- section_separators = { left = "", right = "" },
		},
		sections = {
			lualine_a = { "mode" },
			lualine_b = { "branch", "diff", { "diagnostics" } },
			lualine_c = {
				{
					"filename",
					path = 1,
				},
			},
			lualine_x = { "copilot", "encoding", "fileformat", "filetype" },
			lualine_y = { "progress" },
			lualine_z = { "location" },
		},
		inactive_sections = {
			lualine_a = {},
			lualine_b = {},
			lualine_c = {
				{
					"filename",
					path = 1,
				},
			},
			-- lualine_x = { "location" },
			lualine_y = {},
			lualine_z = {},
		},
		tabline = {
			lualine_a = {
				{
					"buffers",
					show_filename_only = true,
					hide_filename_extension = false,
					show_modified_status = true,
					mode = 0,
					icons_enabled = false,
				},
			},
			lualine_b = {},
			lualine_c = {},
			lualine_x = {},
			lualine_y = {},
			lualine_z = {},
		},
		extensions = {
			"fugitive",
			"lazy",
			"man",
			"neo-tree",
			"quickfix",
			"trouble",
		},
	},
}
