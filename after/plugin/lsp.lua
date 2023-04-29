if vim.g.vscode == 1 then
	return
end

local ufo_status, ufo = pcall(require, "ufo")
if not ufo_status then
	return
end

ufo.setup()

vim.opt.foldcolumn = "1"
vim.opt.foldlevel = 99
vim.opt.foldlevelstart = 99
vim.opt.foldenable = true

vim.keymap.set("n", "zR", require("ufo").openAllFolds)
vim.keymap.set("n", "zM", require("ufo").closeAllFolds)
vim.keymap.set("n", "<leader>lI", ":Mason<CR>", { desc = "Mason" })

local lsp = require("lsp-zero").preset("recommended")

lsp.ensure_installed({
	"tsserver",
})

lsp.set_sign_icons({
	error = "E",
	warn = "W",
	hint = "H",
	info = "I",
})

lsp.on_attach(function(client, bufnr)
	local opts = { buffer = bufnr, remap = false }

	vim.keymap.set("n", "gd", function()
		vim.lsp.buf.definition()
	end, {
		buffer = opts.buffer,
		remap = opts.remap,
		desc = "Go to definition",
	})
	vim.keymap.set("n", "gD", function()
		vim.lsp.buf.declaration()
	end, {
		buffer = opts.buffer,
		remap = opts.remap,
		desc = "Go to declaration",
	})
	vim.keymap.set("n", "gi", function()
		vim.lsp.buf.implementation()
	end, {
		buffer = opts.buffer,
		remap = opts.remap,
		desc = "Go to implementation",
	})
	vim.keymap.set("n", "K", function()
		vim.lsp.buf.hover()
	end, {
		buffer = opts.buffer,
		remap = opts.remap,
		desc = "Show hover",
	})
	vim.keymap.set("n", "<leader>lS", function()
		vim.lsp.buf._workspace_symbol()
	end, {
		buffer = opts.buffer,
		remap = opts.remap,
		desc = "Workspace symbol",
	})
	vim.keymap.set("n", "<leader>ls", function()
		vim.lsp.buf.document_symbol()
	end, {
		buffer = opts.buffer,
		remap = opts.remap,
		desc = "Document symbol",
	})
	vim.keymap.set("n", "gl", function()
		vim.diagnostic.open_float()
	end, {
		buffer = opts.buffer,
		remap = opts.remap,
		desc = "Show diagnostics",
	})
	vim.keymap.set("n", "[d", function()
		vim.diagnostic.goto_next()
	end, {
		buffer = opts.buffer,
		remap = opts.remap,
		desc = "Next diagnostic",
	})
	vim.keymap.set("n", "]d", function()
		vim.diagnostic.goto_prev()
	end, {
		buffer = opts.buffer,
		remap = opts.remap,
		desc = "Previous diagnostic",
	})
	vim.keymap.set("n", "<leader>ac", function()
		vim.lsp.buf.code_action()
	end, {
		buffer = opts.buffer,
		remap = opts.remap,
		desc = "Code action",
	})
	vim.keymap.set("n", "gr", function()
		vim.lsp.buf.references()
	end, {
		buffer = opts.buffer,
		remap = opts.remap,
		desc = "Go to References",
	})
	vim.keymap.set("n", "<leader>lr", function()
		vim.lsp.buf.rename()
	end, {
		buffer = opts.buffer,
		remap = opts.remap,
		desc = "Rename symbol",
	})
	vim.keymap.set("i", "gs", function()
		vim.lsp.buf.signature_help()
	end, {
		buffer = opts.buffer,
		remap = opts.remap,
		desc = "Signature help",
	})
	vim.keymap.set("n", "<leader>lf", function()
		vim.lsp.buf.formatting()
	end, {
		buffer = opts.buffer,
		remap = opts.remap,
		desc = "Format Current File",
	})
end)

lsp.set_server_config({
	capabilities = {
		textDocument = {
			foldingRange = {
				dynamicRegistration = false,
				lineFoldingOnly = true,
			},
		},
	},
})

-- Fix Undefined global 'vim'
require("lspconfig").lua_ls.setup(lsp.nvim_lua_ls())

lsp.setup()

require("typescript").setup({
	server = {
		on_attach = function(client, bufnr)
			vim.keymap.set("n", "<leader>rf", ":TypescriptRenameFile<CR>", {
				buffer = bufnr,
				remap = false,
				desc = "Rename file",
			}) -- rename file and update imports
			vim.keymap.set("n", "<leader>oi", ":TypescriptOrganizeImports<CR>", {
				buffer = bufnr,
				remap = false,
				desc = "Organize imports",
			}) -- organize imports (not in youtube nvim video)
			vim.keymap.set("n", "<leader>ru", ":TypescriptRemoveUnused<CR>", {
				buffer = bufnr,
				remap = false,
				desc = "Remove unused imports",
			}) -- remove unused variables (not in youtube nvim video)
		end,
	},
})

local cmp = require("cmp")
local cmp_select = { behavior = cmp.SelectBehavior.Select }

cmp.setup({
	mapping = {
		["<C-k>"] = cmp.mapping.select_prev_item(cmp_select),
		["<C-j>"] = cmp.mapping.select_next_item(cmp_select),
		["<C-y>"] = cmp.mapping.confirm({ select = true }),
		["<C-Space>"] = cmp.mapping.complete(),
		["<CR>"] = cmp.mapping.confirm({ select = true }),
		-- Disable completion with <Tab> and <S-Tab>
		-- this helps with copilot setup
		["<Tab>"] = cmp.config.disable,
		["<S-Tab>"] = cmp.config.disable,
	},
	sources = {
		{ name = "path" },
		{ name = "nvim_lsp" },
		{ name = "buffer", keyword_length = 3 },
		{ name = "luasnip", keyword_length = 2 },
	},
})

vim.diagnostic.config({
	virtual_text = true,
})

local null_ls_status_ok, null_ls = pcall(require, "null-ls")
if not null_ls_status_ok then
	return
end

local null_opts = lsp.build_options("null-ls", {
	on_attach = function(client)
		if client.server_capabilities.documentFormattingProvider then
			vim.cmd("autocmd BufWritePre <buffer> lua vim.lsp.buf.format()")
		end
	end,
})

local formatting = null_ls.builtins.formatting
local lint = null_ls.builtins.diagnostics
local action = null_ls.builtins.code_actions

null_ls.setup({
	debug = true,
	on_attach = null_opts.on_attach,
	sources = {
		-- formatting
		formatting.eslint_d,
		formatting.prettierd,
		formatting.stylua, -- Lua

		-- linting
		lint.eslint_d,
		lint.cspell,

		-- code actions
		action.eslint_d,
		action.cspell,
	},
})

require("mason-null-ls").setup({
	ensure_installed = nil,
	automatic_installation = true,
})
