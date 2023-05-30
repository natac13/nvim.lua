-- vim.api.nvim_create_autocmd({ "FileType" }, {
--   pattern = { "qf", "help", "man", "lspinfo", "spectre_panel" },
--   callback = function()
--     vim.cmd [[
--       nnoremap <silent> <buffer> q :close<CR>
--       set nobuflisted
--     ]]
--   end,
-- })

vim.api.nvim_create_autocmd({ "FileType" }, {
	pattern = { "gitcommit", "markdown" },
	callback = function()
		vim.opt_local.wrap = true
		vim.opt_local.spell = true
	end,
})
-- Automatically close tab/vim when nvim-tree is the last window in the tab
-- vim.cmd "autocmd BufEnter * ++nested if winnr('$') == 1 && bufname() == 'NvimTree_' . tabpagenr() | quit | endif"

-- vim.api.nvim_create_autocmd({ "VimResized" }, {
--   callback = function()
--     vim.cmd "tabdo wincmd ="
--   end,
-- })

vim.api.nvim_create_autocmd({ "TextYankPost" }, {
	callback = function()
		vim.highlight.on_yank({ higroup = "Visual", timeout = 200 })
	end,
})

vim.api.nvim_create_autocmd("LspAttach", {
	desc = "Fix startup error by disabling semantic tokens for omnisharp",
	group = vim.api.nvim_create_augroup("OmnisharpHook", {}),
	callback = function(ev)
		local client = vim.lsp.get_client_by_id(ev.data.client_id)
		if client.name == "omnisharp" then
			client.server_capabilities.semanticTokensProvider = nil
		end
	end,
})

-- -- Run gofmt + goimport on save
--
-- local format_sync_grp = vim.api.nvim_create_augroup("GoImport", {})
-- vim.api.nvim_create_autocmd("BufWritePre", {
-- 	pattern = "*.go",
-- 	callback = function()
-- 		require("go.format").goimport()
-- 	end,
-- 	group = format_sync_grp,
-- })
