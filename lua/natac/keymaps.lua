-- set leader key to space
vim.g.mapleader = " "
vim.g.maplocalleader = " "

local keymap = vim.keymap -- for conciseness
---------------------
-- General Keymaps
---------------------
-- open explorer
-- vim.keymap.set("n", "<leader>e", vim.cmd.Ex)
vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>", { desc = "[E]xplorer" })

-- use jk to exit insert mode
keymap.set("i", "jk", "<ESC>", { silent = true, desc = "Exit insert mode" })
keymap.set("i", "kj", "<ESC>", { silent = true, desc = "Exit insert mode" })

-- clear search highlights
keymap.set("n", "<leader><ENTER>", ":nohl<CR>", { desc = "[C]lear search highlights" })

-- delete single character without copying into register
keymap.set("n", "x", '"_x', { silent = true })

-- window management
keymap.set("n", "<leader>|", "<C-w>v", { desc = "[S]plit window [V]ertically" }) -- split window vertically
keymap.set("n", "<leader>-", "<C-w>s", { desc = "[S]plit window [H]orizontally" }) -- split window horizontally
keymap.set("n", "<leader>se", "<C-w>=", { desc = "[S]plit window [E]qual" }) -- make split windows equal width & height
keymap.set("n", "<leader>sx", ":close<CR>", { desc = "[S]plit window [X] close" }) -- close current split window

keymap.set("n", "<leader>to", ":tabnew<CR>") -- open new tab
keymap.set("n", "<leader>tx", ":tabclose<CR>") -- close current tab
keymap.set("n", "<leader>tn", ":tabn<CR>") --  go to next tab
keymap.set("n", "<leader>tp", ":tabp<CR>") --  go to previous tab

-- Navigate buffers
keymap.set("n", "<S-l>", ":bnext<CR>", { silent = true, noremap = true, desc = "Next buffer" })
keymap.set("n", "<S-h>", ":bprevious<CR>", { silent = true, noremap = true, desc = "Previous buffer" })
keymap.set("n", "<leader>bd", ":bdelete<CR>", { desc = "[B]uffer [D]elete" }) -- delete current buffer

keymap.set("n", "<leader>sv", ":source $MYVIMRC<CR>", { desc = "[S]ource [V]imrc", noremap = true }) -- source vimrc

-- copy to system clipboard to all lines in the block
vim.keymap.set("x", "<leader>p", [["_dP]])

-- smart way to move between windows
keymap.set("n", "<C-j>", "<C-W>j")
keymap.set("n", "<C-k>", "<C-W>k")
keymap.set("n", "<C-l>", "<C-W>l")
keymap.set("n", "<C-h>", "<C-W>h")

keymap.set({ "n", "v" }, "<Space>", "<Nop>", { silent = true })

-- remap for dealing with word wrap
keymap.set("n", "k", 'v:count == 0 ? "gk" : "k"', { expr = true, silent = true })
keymap.set("n", "j", 'v:count == 0 ? "gj" : "j"', { expr = true, silent = true })

keymap.set("v", "<C-j>", ":m '>+1<CR>gv=gv")
keymap.set("v", "<C-k>", ":m '<-2<CR>gv=gv")

-- next greatest remap ever : asbjornHaland
-- ability to yank to system clipboard
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd
local yank_group = augroup("HighlightYank", {})

autocmd("TextYankPost", {
	group = yank_group,
	pattern = "*",
	callback = function()
		vim.highlight.on_yank({
			higroup = "IncSearch",
			timeout = 100,
		})
	end,
})

if vim.g.vscode == 1 then
	keymap.set("n", "<leader>w", ":call VSCodeNotify('workbench.action.files.save')<CR>", { desc = "[W]rite" })
	keymap.set(
		"n",
		"<leader>e",
		":call VSCodeNotify('workbench.action.toggleSidebarVisibility')<CR>",
		{ desc = "[E]xplorer" }
	)
	keymap.set(
		"n",
		"gr",
		"<CMD>call VSCodeNotify('editor.action.goToReferences')<CR>",
		{ desc = "[G]o to [R]eferences" }
	)
	keymap.set(
		"n",
		"gd",
		"<CMD>call VSCodeNotify('editor.action.revealDefinition')<CR>",
		{ desc = "[G]o to [D]eclaration" }
	)
	keymap.set(
		"n",
		"gD",
		"<CMD>call VSCodeNotify('editor.action.peekDeclaration')<CR>",
		{ desc = "[G]o to [D]eclaration" }
	)
	keymap.set(
		"n",
		"gi",
		":call VSCodeNotify('editor.action.goToImplementation')<CR>",
		{ desc = "[G]o to [I]mplementation" }
	)
	keymap.set("n", "K", ":call VSCodeNotify('editor.action.showHover')<CR>", { desc = "[K]eyword hover" })
	keymap.set(
		"n",
		"<leader>ls",
		":call VSCodeNotify('workbench.action.gotoSymbol')<CR>",
		{ desc = "[L]ist File [S]ymbols" }
	)
	keymap.set(
		"n",
		"<leader>lS",
		":call VSCodeNotify('workbench.action.showAllSymbols')<CR>",
		{ desc = "[L]ist All [S]ymbols" }
	)
	keymap.set(
		"n",
		"<leader>f",
		":call VSCodeNotify('editor.action.formatDocument')<CR>",
		{ desc = "[F]ormat Document" }
	)
	keymap.set(
		"n",
		"<leader>oi",
		":call VSCodeNotify('editor.action.organizeImports')<CR>",
		{ desc = "[O]rganize [I]mports" }
	)
	keymap.set("n", "<leader>ac", ":call VSCodeNotify('editor.action.codeAction')<CR>", { desc = "[A]ction [C]ode" })
	keymap.set("n", "u", ":call VSCodeNotify('undo')<CR>", { desc = "[U]ndo" })
	keymap.set("n", "<leader>x", ":call VSCodeNotifyVisual('extension.createSnippet', 1)<CR>", { desc = "[X] snippet" })
	keymap.set(
		"n",
		"<leader>ps",
		":call VSCodeNotify('workbench.action.findInFiles')<CR>",
		{ desc = "[P]roject [S]earch" }
	)
	keymap.set(
		"n",
		"<leader>|",
		":call VSCodeNotify('workbench.action.splitEditor')<CR>",
		{ desc = "[S]plit [V]ertical" }
	)
	keymap.set(
		"n",
		"<leader>-",
		":call VSCodeNotify('workbench.action.splitEditorOrthogonal')<CR>",
		{ desc = "[S]plit [H]orizontal" }
	)
	keymap.set("n", "<C-r>", ":call VSCodeNotify('redo')<CR>", { desc = "[R]edo" })
	keymap.set("n", "<leader>Z", ":call VSCodeNotify('workbench.action.toggleZenMode')<CR>", { desc = "[Z]en" })
	keymap.set("n", "<leader>nf", ":call VSCodeNotify('fileutils.newFile')<CR>", { desc = "[N]ew [F]ile" })
	keymap.set("n", "<leader>rf", ":call VSCodeNotify('fileutils.renameFile')<CR>", { desc = "[R]ename [F]ile" })
	keymap.set("n", "<leader>lr", ":call VSCodeNotify('editor.action.rename')<CR>", { desc = "[L]ist [R]ename" })
	keymap.set(
		"n",
		"<leader>gT",
		":call VSCodeNotify('editor.action.peekTypeDefinition')<CR>",
		{ desc = "[G]o to [T]ype" }
	)
	keymap.set("n", "[d", ":call VSCodeNotify('editor.action.marker.prev')<CR>", { desc = "[G]o to [P]revious Issue" })
	keymap.set("n", "]d", ":call VSCodeNotify('editor.action.marker.next')<CR>", { desc = "[G]o to [N]ext Issue" })
	keymap.set(
		"n",
		"gs",
		":call VSCodeNotify('editor.action.triggerParameterHints')<CR>",
		{ desc = "[S]how Parameter Hints" }
	)
	keymap.set(
		"n",
		"<leader>;",
		":call VSCodeNotify('copilot-labs.use-brush-picker')<CR>",
		{ desc = "[;] Use Brush Picker" }
	)

	keymap.set("v", "<leader>;", ":call VSCodeNotifyVisual('copilot-labs.use-brush-picker', 1)<CR>", {
		desc = "[;] Use Brush Picker",
	})
	--   " VSCode extension
	-- xmap gc  <Plug>VSCodeCommentary
	-- nmap gc  <Plug>VSCodeCommentary
	-- omap gc  <Plug>VSCodeCommentary
	-- nmap gcc <Plug>VSCodeCommentaryLine
end
