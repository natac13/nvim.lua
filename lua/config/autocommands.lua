-- don't auto comment new line
vim.api.nvim_create_autocmd("BufEnter", { command = [[set formatoptions-=cro]] }) -- vim.api.nvim_create_autocmd({ "FileType" }, {

-- vim.api.nvim_create_autocmd({ "FileType" }, {
-- 	pattern = { "gitcommit", "markdown" },
-- 	callback = function()
-- 		vim.opt_local.wrap = true
-- 		vim.opt_local.spell = true
-- 	end,
-- })

-- vim.api.nvim_create_autocmd({ "TextYankPost" }, {
-- 	callback = function()
-- 		vim.highlight.on_yank({ higroup = "Visual", timeout = 200 })
-- 	end,
-- })

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("natac-highlight-yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})

