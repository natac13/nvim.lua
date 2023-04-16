vim.g.gruvbox_material_background = "hard"
vim.g.gruvbox_material_better_performance = 1

-- set colorscheme to gruvbox-material with protected call
-- in case it isn't installed
local status, _ = pcall(vim.cmd, "colorscheme gruvbox-material")
if not status then
	print("Colorscheme Gruvbox-Material not found!") -- print error if colorscheme not installed
	return
end
