vim.g.gruvbox_material_foreground = "material"
vim.g.gruvbox_material_background = "hard"
vim.g.gruvbox_material_better_performance = 1
vim.g.gruvbox_material_enable_italic = 0
vim.g.gruvbox_material_ui_contrast = "high"

-- local grpid = vim.api.nvim_create_augroup("custom_highlights_gruvboxmaterial", {})
-- vim.api.nvim_create_autocmd("ColorScheme", {
-- 	group = grpid,
-- 	pattern = "gruvbox-material",
-- 	command = "hi tsxAttrib guifg=#a9b665  |"
-- 		.. "hi typescriptString guifg=#d8a657 |"
-- 		.. "hi typescriptTypeArguments guifg=#a9b665 |"
-- 		.. "hi tsxString guifg=#d8a657  |"
-- 		.. "hi typescriptTemplate guifg=#d8a657  |"
-- 		.. "hi tsxTag guifg=#a9b665  |"
-- 		.. "hi tsxCloseString guifg=#a9b665  |"
-- 		.. "hi tsxTagName guifg=#e78a4e  |",
-- })
-- vim.cmd("hi! link Type Blue")

-- set colorscheme to gruvbox-material with protected call
-- in case it isn't installed
local status, _ = pcall(vim.cmd, "colorscheme gruvbox-material")
if not status then
	print("Colorscheme Gruvbox-Material not found!") -- print error if colorscheme not installed
	return
end

vim.g.everforest_background = "hard"
vim.g.everforest_enable_italic = 0
vim.g.everforset_better_performance = 1
vim.g.everforset_ui_contrast = "high"
-- local status, _ = pcall(vim.cmd, "colorscheme everforest")
-- if not status then
-- 	print("Colorscheme Gruvbox-Material not found!") -- print error if colorscheme not installed
-- 	return
-- end
--
