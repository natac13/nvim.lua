local status, lualine = pcall(require, "lualine")
if not status then
	return
end

lualine.setup({
	options = {
		theme = "gruvbox-material",
		-- component_separators = "|",
		-- section_separators = "",
	},
	sections = {
		lualine_a = { "buffers" },
	},
})
