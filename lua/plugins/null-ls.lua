local M = {
	"jay-babu/mason-null-ls.nvim",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"williamboman/mason.nvim",
		"jose-elias-alvarez/null-ls.nvim",
	},
	config = function()
		local null_ls = require("null-ls")
		local mason_null_ls = require("mason-null-ls")
		-- local null_opts =
		local formatting = null_ls.builtins.formatting
		local lint = null_ls.builtins.diagnostics
		local action = null_ls.builtins.code_actions

		local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
		null_ls.setup({
			debug = true,
			sources = {
				-- formatting
				formatting.eslint, -- javascript, typescript, css, html, json, yaml, markdown
				formatting.prettier, -- javascript, typescript, css, html, json, yaml, markdown
				formatting.stylua, -- lua
				formatting.goimports, -- go
				formatting.goimports_reviser, -- go
				formatting.gofmt, -- go
				-- formatting.rustfmt, -- rust

				-- linting
				lint.eslint,
				lint.staticcheck, -- go
				lint.hadolint, -- dockerfile

				-- code actions
				action.eslint,
				action.refactoring,
			},
			-- you can reuse a shared lspconfig on_attach callback here
			on_attach = function(client, bufnr)
				if client.supports_method("textDocument/formatting") then
					vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
					vim.api.nvim_create_autocmd("BufWritePre", {
						group = augroup,
						buffer = bufnr,
						callback = function()
							-- on 0.8, you should use vim.lsp.buf.format({ bufnr = bufnr }) instead
							-- on later neovim version, you should use vim.lsp.buf.format({ async = false }) instead
							vim.lsp.buf.format({ bufnr = bufnr })
						end,
					})
				end
			end,
		})

		mason_null_ls.setup({
			ensure_installed = nil,
			automatic_installation = true,
		})
	end,
}

return M
