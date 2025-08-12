return {
	{
		"tpope/vim-surround",
	},
	-- Neovim notification and LSP progress messages
	{
		"tpope/vim-fugitive",
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
		event = { "BufReadPost", "BufNewFile" },
		opts = {
			indent = { 
				char = "│",
				tab_char = "│",
			},
			scope = { enabled = false },
			exclude = {
				filetypes = { 
					"help", "alpha", "dashboard", "neo-tree", "Trouble", "lazy", "mason",
					"notify", "toggleterm", "lazyterm"
				},
			},
		},
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
	-- VSCode like breadcrumbs (lualine doesn't have this)
	{
		"utilyre/barbecue.nvim",
		name = "barbecue",
		version = "*",
		dependencies = {
			"SmiteshP/nvim-navic",
			"nvim-tree/nvim-web-devicons", -- optional dependency
		},
		opts = {
			-- configurations go here
		},
	},
	-- persist sessions
	{
		"folke/persistence.nvim",
		-- event = "BufReadPre", -- this will only start session saving when an actual file was opened
		opts = {},
		config = function()
			require("persistence").setup()
			-- restore the session for the current directory
			vim.api.nvim_set_keymap("n", "<leader>qs", [[<cmd>lua require("persistence").load()<cr>]], {})

			-- restore the last session
			vim.api.nvim_set_keymap(
				"n",
				"<leader>ql",
				[[<cmd>lua require("persistence").load({ last = true })<cr>]],
				{}
			)

			-- stop Persistence => session won't be saved on exit
			vim.api.nvim_set_keymap("n", "<leader>qd", [[<cmd>lua require("persistence").stop()<cr>]], {})
		end,
	},
	-- better code annotation
	{
		"danymat/neogen",
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
			"L3MON4D3/LuaSnip",
		},
		config = function()
			local neogen = require("neogen")

			neogen.setup({
				-- snippet_engine = "luasnip",
			})
		end,
		-- version = "*"
	},

	{
		"ThePrimeagen/refactoring.nvim",
		enabled = false,
		dependencies = {
			{ "nvim-lua/plenary.nvim" },
			{ "nvim-treesitter/nvim-treesitter" },
		},
		config = function()
			require("refactoring").setup({})
		end,
	},
}
