return { -- Autoformat
	"stevearc/conform.nvim",
	lazy = false,
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
			-- Conform can also run multiple formatters sequentially
			-- python = { "isort", "black" },
			--
			-- You can use a sub-list to tell conform to run *until* a formatter
			-- is found.
			javascript = { { "prettierd", "prettier" } },
			typescript = { { "prettierd", "prettier" } },
			typescriptreact = { { "prettierd", "prettier" } },
		},
	},
}
