local M = {
	"nvim-lualine/lualine.nvim",
	lazy = false,
	-- event = { "VimEnter", "InsertEnter", "BufReadPre", "BufAdd", "BufNew", "BufReadPost" },
}

function M.config()
	local status_ok, lualine = pcall(require, "lualine")
	if not status_ok then
		print("Missing Lualine plugin")
		return
	end

	lualine.setup({
		options = {
			theme = "gruvbox-material",
			-- theme = "catppuccin",
		},
	})
end

return M
