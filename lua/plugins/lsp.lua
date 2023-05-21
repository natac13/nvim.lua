return {
	{
		"VonHeikemen/lsp-zero.nvim",
		branch = "v2.x",
		lazy = true,
		config = function()
			-- This is where you modify the settings for lsp-zero
			-- Note: autocompletion settings will not take effect

			require("lsp-zero.settings").preset({})

			vim.diagnostic.config({
				virtual_text = true,
			})
		end,
	},

	-- Autocompletion
	{
		"hrsh7th/nvim-cmp",
		event = { "InsertEnter", "BufReadPre", "BufNewFile" },
		dependencies = {
			{ "L3MON4D3/LuaSnip" },
			{ "hrsh7th/cmp-buffer" },
			{ "hrsh7th/cmp-path" },
		},
		config = function()
			-- Here is where you configure the autocompletion settings.
			-- The arguments for .extend() have the same shape as `manage_nvim_cmp`:
			-- https://github.com/VonHeikemen/lsp-zero.nvim/blob/v2.x/doc/md/api-reference.md#manage_nvim_cmp

			require("lsp-zero.cmp").extend()

			-- And you can configure cmp even more, if you want to.
			local cmp = require("cmp")
			local cmp_action = require("lsp-zero.cmp").action()
			local cmp_select = { behavior = cmp.SelectBehavior.Select }

			cmp.setup({
				mapping = {
					["<C-Space>"] = cmp.mapping.complete(),
					["<C-f>"] = cmp_action.luasnip_jump_forward(),
					["<C-b>"] = cmp_action.luasnip_jump_backward(),
					["<C-k>"] = cmp.mapping.select_prev_item(cmp_select),
					["<C-j>"] = cmp.mapping.select_next_item(cmp_select),
					["<C-y>"] = cmp.mapping.confirm({ select = true }),
					["<CR>"] = cmp.mapping.confirm({ select = true }),
					-- Disable completion with <Tab> and <S-Tab>
					-- this helps with copilot setup
					["<Tab>"] = cmp.config.disable,
					["<S-Tab>"] = cmp.config.disable,
				},
				sources = {
					{ name = "nvim_lsp" },
					{ name = "nvim_lua" },
					{ name = "luasnip" },
					{ name = "buffer" },
					{ name = "path" },
				},
			})
		end,
	},

	-- LSP
	{
		"neovim/nvim-lspconfig",
		cmd = "LspInfo",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			{ "hrsh7th/cmp-nvim-lsp" },
			{ "williamboman/mason-lspconfig.nvim" },
			{
				"williamboman/mason.nvim",
				build = function()
					pcall(vim.cmd, "MasonUpdate")
				end,
			},
		},
		config = function()
			-- This is where all the LSP shenanigans will live

			local lsp = require("lsp-zero")
			lsp.ensure_installed({
				"tsserver",
				"rust_analyzer",
				"gopls",
			})

			lsp.set_sign_icons({
				error = "",
				warn = "",
				hint = "",
				info = "",
			})

			lsp.on_attach(function(client, bufnr)
				-- lsp.default_keymaps({buffer = bufnr})

				vim.keymap.set("n", "gd", function()
					vim.lsp.buf.definition()
				end, { buffer = bufnr, remap = false, desc = "Go to definition" })

				vim.keymap.set("n", "gD", function()
					vim.lsp.buf.declaration()
				end, { buffer = bufnr, remap = false, desc = "Go to declaration" })

				vim.keymap.set("n", "gi", function()
					vim.lsp.buf.implementation()
				end, { buffer = bufnr, remap = false, desc = "Go to implementation" })

				vim.keymap.set("n", "K", function()
					vim.lsp.buf.hover()
				end, { buffer = bufnr, remap = false, desc = "Show hover" })

				vim.keymap.set("n", "<leader>lS", function()
					vim.lsp.buf._workspace_symbol()
				end, { buffer = bufnr, remap = false, desc = "Workspace symbol" })

				vim.keymap.set("n", "<leader>ls", function()
					vim.lsp.buf.document_symbol()
				end, { buffer = bufnr, remap = false, desc = "Document symbol" })

				vim.keymap.set("n", "gl", function()
					vim.diagnostic.open_float()
				end, { buffer = bufnr, remap = false, desc = "Show diagnostics" })

				vim.keymap.set("n", "[d", function()
					vim.diagnostic.goto_next()
				end, { buffer = bufnr, remap = false, desc = "Next diagnostic" })

				vim.keymap.set("n", "]d", function()
					vim.diagnostic.goto_prev()
				end, { buffer = bufnr, remap = false, desc = "Previous diagnostic" })

				vim.keymap.set("n", "<leader>ac", function()
					vim.lsp.buf.code_action()
				end, { buffer = bufnr, remap = false, desc = "Code action" })

				vim.keymap.set("n", "gr", function()
					vim.lsp.buf.references()
				end, { buffer = bufnr, remap = false, desc = "Go to References" })

				vim.keymap.set("n", "<leader>lr", function()
					vim.lsp.buf.rename()
				end, { buffer = bufnr, remap = false, desc = "Rename symbol" })

				vim.keymap.set("i", "gs", function()
					vim.lsp.buf.signature_help()
				end, { buffer = bufnr, remap = false, desc = "Signature help" })

				vim.keymap.set("n", "<leader>lf", function()
					vim.lsp.buf.format({ async = true })
				end, { buffer = bufnr, remap = false, desc = "Format Current File" })
			end)

			-- (Optional) Configure lua language server for neovim
			require("lspconfig").lua_ls.setup(lsp.nvim_lua_ls())

			-- format on save
			lsp.format_on_save({
				format_opts = {
					async = false,
					timeout_ms = 10000,
				},
				servers = {
					["null-ls"] = { "javascript", "typescript", "lua", "typescriptreact", "javascriptreact" },
				},
			})

			lsp.skip_server_setup({ "tsserver" })

			lsp.setup()
		end,
	},
}
