local M = {
	"sainnhe/gruvbox-material",
	-- lazy = false, -- make sure we load this during startup if it is your main colorscheme
	-- priority = 1000, -- make sure to load this before all the other start plugins
	event = "VeryLazy",
}

M.name = "gruvbox-material"
function M.config()
	vim.g.gruvbox_material_foreground = "material"
	vim.g.gruvbox_material_background = "hard"
	vim.g.gruvbox_material_better_performance = 1
	vim.g.gruvbox_material_enable_italic = 0
	vim.g.gruvbox_material_ui_contrast = "high"

	-- local status_ok, _ = pcall(vim.cmd.colorscheme, M.name)
	-- if not status_ok then
	-- 	return
	-- end
end

local RosePine = {
	"rose-pine/neovim",
	name = "rose-pine",
	event = "VeryLazy",
}
local Catppuccin = {
	"catppuccin/nvim",
	name = "catppuccin",
	lazy = false, -- make sure we load this during startup if it is your main colorscheme
	priority = 1000, -- make sure to load this before all the other start plugins
	config = function()
		local status_ok, _ = pcall(vim.cmd.colorscheme, "catppuccin")
		if not status_ok then
			return
		end
	end,
}

return {
	M,
	RosePine,
	Catppuccin,
}
