local ensure_packer = function()
	local fn = vim.fn
	local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
	if fn.empty(fn.glob(install_path)) > 0 then
		fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
		vim.cmd([[packadd packer.nvim]])
		return true
	end
	return false
end

local packer_bootstrap = ensure_packer()

-- autocommand that reloads neovim and installs/updates/removes plugins
-- when file is saved
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugin-setup.lua source <afile> | PackerSync
  augroup end
]])

local vscode = vim.g.vscode == 1

-- protected import of packer
local status, packer = pcall(require, "packer")
if not status then
	return
end

return packer.startup(function(use)
	use("wbthomason/packer.nvim")
	-- My plugins here

	-- Color Scheme
	-- use("natac13/gruvbox-material", {
	-- 	branch = "feat/color-update",
	-- }) -- prefered colorscheme
	use("sainnhe/gruvbox-material", { disable = vscode }) -- prefered colorscheme
	use("sainnhe/everforest", { opt = true, disable = vscode })
	use("eddyekofo94/gruvbox-flat.nvim", { opt = true, disable = vscode })
	use("catppuccin/nvim", { as = "catppuccin", opt = true, disable = vscode })
	use("rose-pine/neovim", { as = "rose-pine", opt = true, disable = vscode })

	-- icons
	use("nvim-tree/nvim-web-devicons", { disable = vscode })

	-- Fuzzy Finder (files, lsp, etc)
	use({ "nvim-telescope/telescope.nvim", branch = "0.1.x", requires = { "nvim-lua/plenary.nvim" }, disable = vscode })
	-- Fuzzy Finder Algorithm which requires local dependencies to be built. Only load if `make` is available
	use({
		"nvim-telescope/telescope-fzf-native.nvim",
		run = "make",
		cond = vim.fn.executable("make") == 1,
		disable = vscode,
	})
	use({ "nvim-telescope/telescope-ui-select.nvim", disable = vscode }) -- for showing lsp code actions

	use({ "kevinhwang91/nvim-ufo", requires = "kevinhwang91/promise-async", disable = vscode })

	use("tpope/vim-surround")

	use("tpope/vim-sleuth", { disable = vscode })

	use("lewis6991/gitsigns.nvim", { disable = vscode })

	use("numToStr/Comment.nvim", { disable = vscode })

	use("nvim-tree/nvim-tree.lua", { disable = vscode })

	use("tpope/vim-fugitive", { disable = vscode })

	use("nvim-lualine/lualine.nvim", { disable = vscode })

	use({
		"akinsho/bufferline.nvim",
		tag = "v3.*",
	}, { disable = vscode })

	use("folke/which-key.nvim")

	use("jose-elias-alvarez/typescript.nvim", { disable = vscode })

	use({
		"nvim-treesitter/nvim-treesitter",
		run = function()
			local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
			ts_update()
		end,
	}, { disable = vscode })

	use("nvim-treesitter/nvim-treesitter-context", { disable = vscode })
	use("nvim-treesitter/playground", { disable = vscode })

	-- Lua
	use({
		"folke/trouble.nvim",
		requires = "nvim-tree/nvim-web-devicons",
		config = function()
			require("trouble").setup({
				-- your configuration comes here
				-- or leave it empty to use the default settings
				-- refer to the configuration section below
			})
		end,
		disable = vscode,
	})

	use({
		"VonHeikemen/lsp-zero.nvim",
		branch = "v2.x",
		disable = vscode,
		requires = {
			-- LSP Support
			{ "neovim/nvim-lspconfig", { disable = vscode } },
			{
				-- Optional
				"williamboman/mason.nvim",
				run = function()
					pcall(vim.cmd, "MasonUpdate")
				end,
				disable = vscode,
			},
			{ "williamboman/mason-lspconfig.nvim", { disable = vscode } },
			{ "jay-babu/mason-null-ls.nvim", { disable = vscode } },
			{ "jose-elias-alvarez/null-ls.nvim", { disable = vscode } },

			-- Autocompletion
			{ "hrsh7th/nvim-cmp", { disable = vscode } },
			-- { "hrsh7th/cmp-buffer" },
			-- { "hrsh7th/cmp-path" },
			-- { "saadparwaiz1/cmp_luasnip" },
			{ "hrsh7th/cmp-nvim-lsp", { disable = vscode } },
			-- { "hrsh7th/cmp-nvim-lua" },

			-- Snippets
			{ "L3MON4D3/LuaSnip", { disable = vscode } },
			-- { "rafamadriz/friendly-snippets" },
		},
	})

	-- auto closing
	use("windwp/nvim-autopairs", { disable = vscode })

	use("github/copilot.vim", { disable = vscode })

	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if packer_bootstrap then
		require("packer").sync()
	end
end)
