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
			vim.keymap.set("n", "<leader>bD", function()
				local bufs = vim.api.nvim_list_bufs()
				local current_buf = vim.api.nvim_get_current_buf()
				for _, i in ipairs(bufs) do
					if i ~= current_buf then
						vim.api.nvim_buf_delete(i, {})
					end
				end
			end, { noremap = true, silent = true, desc = "Delete all buffers except current" })
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
	-- VSCode like breadcrumbs
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
	-- Neovim setup for init.lua and plugin development with full signature help, docs and completion for the nvim lua API
	{
		"folke/neodev.nvim",
		config = function()
			require("neodev").setup({
				library = { plugins = { "neotest" }, types = true },
			})
		end,
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
