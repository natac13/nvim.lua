return {
	{ -- Linting
		"mfussenegger/nvim-lint",
		event = { "BufReadPre", "BufNewFile" },
		enabled = true,
		config = function()
			local lint = require("lint")
			lint.linters_by_ft = {
				markdown = { "markdownlint" },
				-- javascript = { "eslint" },
				-- typescript = { "eslint" },
				-- typescriptreact = { "eslint" },
				-- javascriptreact = { "eslint" },
			}
			-- Create autocommand which carries out the actual linting
			-- on the specified events.
			local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })
			vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
				group = lint_augroup,
				callback = function()
					lint.try_lint()
					lint.try_lint("cspell")
				end,
			})

			local lint_progress = function()
				local linters = require("lint").get_running()
				if #linters == 0 then
					return "󰦕"
				end
				return "󱉶 " .. table.concat(linters, ", ")
			end

			-- make vim command to show linting lint_progress
			vim.cmd("command! LintProgress echo '" .. lint_progress() .. "'")
		end,
	},
}
