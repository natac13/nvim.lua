return {
	"jose-elias-alvarez/typescript.nvim",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		{ "neovim/nvim-lspconfig" },
	},
	config = function()
		local tsserver = require("typescript")

		tsserver.setup({
			server = {
				on_attach = function(_, bufnr)
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
	end,
}
