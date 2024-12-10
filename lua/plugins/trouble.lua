return {
	"folke/trouble.nvim",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		local trouble = require("trouble")
		trouble.setup()

		vim.keymap.set(
			"n",
			"<leader>xx",
			"<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
			{ silent = true, noremap = true, desc = "Buffer Diagnostics" }
		)
		vim.keymap.set(
			"n",
			"<leader>xX",
			"<cmd>Trouble diagnostics toggle<cr>",
			{ silent = true, noremap = true, desc = "All Diagnostics" }
		)

		-- vim.keymap.set(
		-- 	"n",
		-- 	"<leader>xw",
		-- 	"<cmd>TroubleToggle workspace_diagnostics<cr>",
		-- 	{ silent = true, noremap = true, desc = "Toggle Trouble Workspace Diagnostics" }
		-- )
		-- vim.keymap.set(
		-- 	"n",
		-- 	"<leader>xd",
		-- 	"<cmd>TroubleToggle document_diagnostics<cr>",
		-- 	{ silent = true, noremap = true, desc = "Toggle Trouble Document Diagnostics" }
		-- )
		vim.keymap.set(
			"n",
			"<leader>xl",
			"<cmd>Trouble loclist toggle<cr>",
			{ silent = true, noremap = true, desc = "Toggle Trouble Location List" }
		)
		vim.keymap.set(
			"n",
			"<leader>xq",
			"<cmd>Trouble qflist toggle<cr>",
			{ silent = true, noremap = true, desc = "Toggle Trouble Quickfix" }
		)
	end,
}
