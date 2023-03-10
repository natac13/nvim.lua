local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
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

-- protected import of packer
local status, packer = pcall(require, "packer")
if not status then
  return
end

return packer.startup(function(use)
  use("wbthomason/packer.nvim")
  -- My plugins here

  -- Color Scheme
  use("sainnhe/gruvbox-material") -- prefered colorscheme

  -- icons
  use("nvim-tree/nvim-web-devicons")

  -- Fuzzy Finder (files, lsp, etc)
  use { "nvim-telescope/telescope.nvim", branch = '0.1.x', requires = { 'nvim-lua/plenary.nvim' } }
  -- Fuzzy Finder Algorithm which requires local dependencies to be built. Only load if `make` is available
  use { "nvim-telescope/telescope-fzf-native.nvim", run = 'make', cond = vim.fn.executable 'make' == 1 }
  use({ "nvim-telescope/telescope-ui-select.nvim" }) -- for showing lsp code actions

  use("tpope/vim-surround")

  use("tpope/vim-sleuth")

  use("lewis6991/gitsigns.nvim")

  use("numToStr/Comment.nvim")

  use("nvim-tree/nvim-tree.lua")

  use('tpope/vim-fugitive')

  use('nvim-lualine/lualine.nvim')

  use {
	  'VonHeikemen/lsp-zero.nvim',
	  branch = 'v1.x',
	  requires = {
		  -- LSP Support
		  {'neovim/nvim-lspconfig'},
		  {'williamboman/mason.nvim'},
		  {'williamboman/mason-lspconfig.nvim'},

		  -- Autocompletion
		  {'hrsh7th/nvim-cmp'},
		  {'hrsh7th/cmp-buffer'},
		  {'hrsh7th/cmp-path'},
		  {'saadparwaiz1/cmp_luasnip'},
		  {'hrsh7th/cmp-nvim-lsp'},
		  {'hrsh7th/cmp-nvim-lua'},

		  -- Snippets
		  {'L3MON4D3/LuaSnip'},
		  {'rafamadriz/friendly-snippets'},
	  }
  }

  -- auto closing
  use {
    "windwp/nvim-autopairs",
    config = function() require("nvim-autopairs").setup {} end
  }
  
  use("github/copilot.vim")

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)
