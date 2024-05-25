return {
	{
		"tpope/vim-surround",
	},
	{
		"tpope/vim-sleuth",
	},
	-- Neovim notification and LSP progress messages
	{
		"tpope/vim-fugitive",
	},
	-- delete buffer
	{
		"famiu/bufdelete.nvim",
		event = "VeryLazy",
		config = function()
			vim.keymap.set(
				"n",
				"<leader>bd",
				":lua require('bufdelete').bufdelete(0, false)<cr>",
				{ noremap = true, silent = true, desc = "Delete buffer" }
			)
		end,
	},
	-- Neovim plugin to improve the default vim.ui interfaces
	{
		"stevearc/dressing.nvim",
		dependencies = { "MunifTanjim/nui.nvim" },
		opts = {},
		config = function()
			require("dressing").setup()
		end,
	},
	{
		"ThePrimeagen/harpoon",
		lazy = true,
	},
	{
		"nvim-tree/nvim-web-devicons",
		event = "VeryLazy",
		config = function()
			require("nvim-web-devicons").setup({
				color_icons = true,
				default = true,
			})
		end,
	},
	-- Indent guide for Neovim
	{
		"lukas-reineke/indent-blankline.nvim",
		main = "ibl",
		opts = {},
	},
	-- Comments
	{
		"numToStr/Comment.nvim",
		opts = {},
	},
	{
		"folke/todo-comments.nvim",
		event = "VimEnter",
		dependencies = { "nvim-lua/plenary.nvim" },
		opts = { signs = false },
	},
}
