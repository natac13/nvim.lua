return { -- Autoformat
	"stevearc/conform.nvim",
	lazy = false,
	enabled = true,
	event = { "LspAttach", "BufReadPost", "BufNewFile" },
	keys = {
		{
			"<leader>lf",
			function()
				require("conform").format({ async = true, lsp_fallback = true })
			end,
			mode = "",
			desc = "[L]anguage [F]ormat",
		},
	},
	opts = {
		log_level = vim.log.levels.DEBUG,
		notify_on_error = true,
		format_on_save = function(bufnr)
			-- Disable "format_on_save lsp_fallback" for languages that don't
			-- have a well standardized coding style. You can add additional
			-- languages here or re-enable it for the disabled ones.
			local disable_filetypes = { c = true, cpp = true }
			return {
				timeout_ms = 1000,
				lsp_fallback = not disable_filetypes[vim.bo[bufnr].filetype],
			}
		end,
		formatters_by_ft = {
			lua = { "stylua" },
			go = { "goimports", "gofmt" },
			-- Use biome for JS/TS if biome.json exists, otherwise prettier
			javascript = { "biome", "prettierd", "prettier" },
			typescript = { "biome", "prettierd", "prettier" },
			typescriptreact = { "biome", "prettierd", "prettier" },
			javascriptreact = { "biome", "prettierd", "prettier" },
			json = { "biome", "prettierd", "prettier" },
			jsonc = { "biome", "prettierd", "prettier" },
			css = { "prettierd", "prettier" },
			graphql = { "prettierd", "prettier" },
			vue = { "prettierd", "prettier" },
			html = { "prettierd", "prettier" },
			markdown = { "prettierd", "prettier" },
			yaml = { "prettierd", "prettier" },
			astro = { "prettierd", "prettier" },
			toml = { "prettierd", "prettier" },
		},
		formatters = {
			biome = {
				require_cwd = true,
			},
		},
	},
}
