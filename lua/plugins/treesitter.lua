local M = {
	"nvim-treesitter/nvim-treesitter",
	event = "BufReadPost",
	dependencies = {
		{
			"JoosepAlviste/nvim-ts-context-commentstring",
			event = "VeryLazy",
		},
		{
			"nvim-tree/nvim-web-devicons",
			event = "VeryLazy",
		},
		{
			"nvim-treesitter/nvim-treesitter-context",
		},
		{
			"nvim-treesitter/playground",
		},
	},
	build = function()
		require("nvim-treesitter.install").update({ with_sync = true })
	end,
}
function M.config()
	-- local treesitter = require "nvim-treesitter"
	local configs = require("nvim-treesitter.configs")

	configs.setup({
		ensure_installed = { "query", "javascript", "typescript", "tsx", "c_sharp", "go", "rust", "vim", "lua", "c" }, -- put the language you want in this array
		-- ensure_installed = "all", -- one of "all" or a list of languages
		ignore_install = { "" }, -- List of parsers to ignore installing
		sync_install = false, -- install languages synchronously (only applied to `ensure_installed`)
		auto_install = true,
		highlight = {
			enable = true, -- false will disable the whole extension
			disable = {}, -- list of language that will be disabled
		},
		autopairs = {
			enable = true,
		},
		-- indent = { enable = true, disable = { "python", "css" } },
		context_commentstring = {
			enable = true,
			enable_autocmd = false,
		},
	})
end

return M
