return {
	"nvimtools/none-ls.nvim",
	event = { "BufReadPre", "BufNewFile" },
	enabled = false,
	dependencies = {
		"jay-babu/mason-null-ls.nvim",
		"gbprod/none-ls-shellcheck.nvim",
		"nvim-lua/plenary.nvim",
	},
	config = function()
		local mason_null_ls = require("mason-null-ls")
		local null_ls = require("null-ls")
		local null_ls_utils = require("null-ls.utils")

		mason_null_ls.setup({
			ensure_installed = {
				"prettier", -- prettier formatter
				"stylua", -- lua formatter
				-- "eslint_d", -- js linter
				-- "golangci_lint", -- go linter
				-- "terraform_fmt", -- terraform formatter
				-- "terraform_validate", -- terraform linter
				"yamllint", -- yaml linter
				"buf", -- buf formatter
				"shfmt", -- shell formatter
				-- "gofumpt", -- go formatter
				"yamlfmt", -- yaml formatter
				-- "spell", -- spell checker
				"black", -- python formatter
			},
			automatic_installation = true,
		})
		-- local null_opts =
		local formatting = null_ls.builtins.formatting
		local diagnostics = null_ls.builtins.diagnostics
		local code_actions = null_ls.builtins.code_actions

		local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

		vim.keymap.set("n", "<leader>lf", vim.lsp.buf.format, { desc = "[L]anaguage [F]ormat" })

		null_ls.setup({
			root_dir = null_ls_utils.root_pattern(".null-ls-root", "Makefile", ".git", "package.json"),
			sources = {
				require("none-ls-shellcheck.diagnostics"),
				require("none-ls-shellcheck.code_actions"),
				formatting.prettier, -- javascript, typescript, css, html, json, yaml, markdown
				formatting.stylua, -- lua
				formatting.goimports, -- go
				-- formatting.goimports_reviser, -- go
				-- formatting.gofmt,         -- go
				-- formatting.rustfmt, -- rust
				formatting.terraform_fmt,
				formatting.buf,
				formatting.shfmt,
				formatting.yamlfmt,
				formatting.black,

				-- linting
				-- diagnostics.eslint_d,
				diagnostics.staticcheck, -- go
				diagnostics.hadolint, -- dockerfile
				diagnostics.terraform_validate,
				diagnostics.yamllint,

				-- code actions
				-- code_actions.eslint_d,
				code_actions.gitsigns,
				code_actions.refactoring,
			},
			-- you can reuse a shared lspconfig on_attach callback here
			on_attach = function(client, bufnr)
				if client.supports_method("textDocument/formatting") then
					vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
					vim.api.nvim_create_autocmd("BufWritePre", {
						group = augroup,
						buffer = bufnr,
						callback = function()
							vim.lsp.buf.format({ bufnr = bufnr })
						end,
					})
				end
			end,
		})
	end,
}
