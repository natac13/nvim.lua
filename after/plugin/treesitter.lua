local status, treesitter = pcall(require, "nvim-treesitter-configs")
if not status then
	return
end

treesitter.setup({
	-- A list of parser names, or "all"
	ensure_installed = { "help", "javascript", "tsx", "typescript", "c_sharp", "c", "lua", "rust" },
	-- Install parsers synchronously (only applied to `ensure_installed`)
	sync_install = false,
	-- Automatically install missing parsers when entering buffer
	-- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
	auto_install = true,
	highlight = {
		-- `false` will disable the whole extension
		enable = true,
		-- Setting this to true will run `:h syntax` and tree-sitter at the same time.
		-- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
		-- Using this option may slow down your editor, and you may see some duplicate highlights.
		-- Instead of true it can also be a list of languages
		additional_vim_regex_highlighting = false,
	},
	autopairs = {
		enable = true,
	},
})

-- vim.opt.foldmethod = "expr"
-- vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
-- vim.opt.nofoldenable = true -- disable folding
---WORKAROUND
-- vim.api.nvim_create_autocmd({ "BufEnter", "BufAdd", "BufNew", "BufNewFile", "BufWinEnter" }, {
-- 	group = vim.api.nvim_create_augroup("TS_FOLD_WORKAROUND", {}),
-- 	callback = function()
-- 		vim.opt.foldmethod = "expr"
-- 		vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
-- 	end,
-- })
---ENDWORKAROUND
