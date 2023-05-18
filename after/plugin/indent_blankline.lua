local ok, indent = pcall(require, "indent_blankline")
if not ok then
	print("Indent Blankline not loaded")
	return
end

indent.setup({
	-- char = "│",
	-- buftype_exclude = { "terminal" },
	-- filetype_exclude = { "help", "packer" },
	-- show_current_context = true,
	-- show_first_indent_level = false,
	-- show_trailing_blankline_indent = false,
})
