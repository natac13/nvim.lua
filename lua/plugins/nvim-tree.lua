local M = {
	"nvim-tree/nvim-tree.lua",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
		event = "VeryLazy",
	},
}

function M.config()
	vim.g.loaded = 1
	vim.g.loaded_netrwPlugin = 1

	require("nvim-tree").setup({
		filters = {
			dotfiles = false,
		},
		git = {
			ignore = false,
		},
		diagnostics = {
			enable = true,
			show_on_dirs = true,
			icons = {
				hint = "",
				info = "",
				warning = "",
				error = "",
			},
		},
		-- update_focused_file = {
		--   enable = true,
		-- },
		-- renderer = {
		--   icons = {
		--     glyphs = {
		--       default = "",
		--       symlink = "",
		--       folder = {
		--         arrow_open = "",
		--         arrow_closed = "",
		--         default = "",
		--         open = "",
		--         empty = "",
		--         empty_open = "",
		--         symlink = "",
		--         symlink_open = "",
		--       },
		--       git = {
		--         unstaged = "",
		--         staged = "S",
		--         unmerged = "",
		--         renamed = "➜",
		--         untracked = "U",
		--         deleted = "",
		--         ignored = "◌",
		--       },
		--     },
		--   },
		-- },
		view = {
			width = 30,
			side = "left",
			-- mappings = {
			--   list = {
			--     { key = { "l", "<CR>", "o" }, cb = tree_cb "edit file" },
			--     { key = "h",                  cb = tree_cb "close_node" },
			--     { key = "v",                  cb = tree_cb "vsplit" },
			--   },
			-- },
		},
	})
end

return M
