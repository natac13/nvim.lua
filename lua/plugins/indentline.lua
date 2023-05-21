local M = {
	"lukas-reineke/indent-blankline.nvim",
	event = "BufReadPre",
}

function M.config()
	local indent = require("indent_blankline")

	indent.setup({
		-- char = "▏",
		show_trailing_blankline_indent = false,
		show_first_indent_level = true,
		use_treesitter = true,
		show_current_context = true,
		buftype_exclude = { "terminal", "nofile" },
		filetype_exclude = {
			"help",
			"packer",
			"NvimTree",
		},
	})
end

return M
