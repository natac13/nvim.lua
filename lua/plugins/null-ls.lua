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

		null_ls.setup({
			debug = true,
			sources = {
				-- formatting
				formatting.eslint, -- javascript, typescript, css, html, json, yaml, markdown
				formatting.prettier, -- javascript, typescript, css, html, json, yaml, markdown
				formatting.stylua, -- lua
				-- formatting.goimports, -- go
				-- formatting.goimports_reviser, -- go
				-- formatting.gofmt, -- go
				-- formatting.rustfmt, -- rust

				-- linting
				lint.eslint,
				-- lint.golangci_lint,
				lint.hadolint, -- dockerfile

				-- code actions
				action.eslint,
				action.refactoring,
			},
		})

		mason_null_ls.setup({
			ensure_installed = nil,
			automatic_installation = true,
		})
	end,
}

return M
