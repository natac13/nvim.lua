-- [[ Basic Keymaps ]]
--  See `:help vim.keymap.set()`

local keymap = vim.keymap -- for conciseness

-- use jk to exit insert mode
keymap.set("i", "jk", "<ESC>", {
	silent = true,
	noremap = true,
	desc = "Exit insert mode",
})

-- Move selected line / block of text in visual mode
keymap.set("v", "J", ":m '>+1<CR>gv=gv", {
	noremap = true,
	silent = true,
	desc = "Move selected lines down",
})
keymap.set("v", "K", ":m '<-2<CR>gv=gv", {
	noremap = true,
	silent = true,
	desc = "Move selected lines up",
})

-- Fast saving
keymap.set("n", "<Leader>w", ":write!<CR>", {
	noremap = true,
	silent = true,
	desc = "Save file",
})
-- keymap.set("n", "<Leader>q", ":q!<CR>", {
-- 	noremap = true,
-- 	silent = true,
-- 	desc = "Quit file",
-- })

-- better indenting
keymap.set("v", "<", "<gv")
keymap.set("v", ">", ">gv")

-- paste over currently selected text without yanking it
keymap.set("v", "p", '"_dp')
keymap.set("v", "P", '"_dP')

-- delete single character without copying into register
keymap.set("n", "x", '"_x', {
	noremap = true,
	silent = true,
	desc = "Delete character without copying",
})

-- clear search highlights
keymap.set("n", "<leader><ENTER>", ":nohl<CR>", { desc = "[C]lear search highlights" })

-- Navigate buffers
keymap.set("n", "<S-l>", ":bnext<CR>", {
	silent = true,
	noremap = true,
	desc = "Next buffer",
})
keymap.set("n", "<S-h>", ":bprevious<CR>", {
	silent = true,
	noremap = true,
	desc = "Previous buffer",
})

-- smart way to move between windows
keymap.set("n", "<C-j>", "<C-W>j", { silent = true })
keymap.set("n", "<C-k>", "<C-W>k", { silent = true })
keymap.set("n", "<C-l>", "<C-W>l", { silent = true })
keymap.set("n", "<C-h>", "<C-W>h", { silent = true })

-- remap for dealing with word wrap
keymap.set("n", "k", 'v:count == 0 ? "gk" : "k"', { expr = true, silent = true })
keymap.set("n", "j", 'v:count == 0 ? "gj" : "j"', { expr = true, silent = true })

-- window management
keymap.set("n", "<leader>|", "<C-w>v", {
	desc = "[V]ertical split window",
	noremap = true,
	silent = true,
})
keymap.set("n", "<leader>-", "<C-w>s", {
	desc = "[S]plit window [H]orizontally",
	noremap = true,
	silent = true,
})
keymap.set("n", "<leader>se", "<C-w>=", {
	desc = "[S]plit window [E]qualize",
	noremap = true,
	silent = true,
})
keymap.set("n", "<leader>sx", ":close<CR>", {
	desc = "[S]plit window [C]lose",
	noremap = true,
	silent = true,
})

-- Panes resizing
keymap.set("n", "+", ":resize +5<CR>")
keymap.set("n", "_", ":resize -5<CR>")
keymap.set("n", "=", ":vertical resize +5<CR>")
keymap.set("n", "-", ":vertical resize -5<CR>")

-- disable default <Space> keymap
keymap.set({ "n", "v" }, "<Space>", "<Nop>", {
	noremap = true,
	silent = true,
	desc = "Disable default <Space> keymap",
})

-- move between quickfix lists items
-- can create a quickfix list with <C-q> after a gr
keymap.set("n", "<C-n>", "<cmd>cnext<CR>zz")
keymap.set("n", "<C-p>", "<cmd>cprev<CR>zz")

-- keymap.set("n", "<leader>to", ":tabnew<CR>")                                       -- open new tab
-- keymap.set("n", "<leader>tx", ":tabclose<CR>")                                     -- close current tab
-- keymap.set("n", "<leader>tn", ":tabn<CR>")                                         --  go to next tab
-- keymap.set("n", "<leader>tp", ":tabp<CR>")                                         --  go to previous tab

-- keymap.set("n", "<leader>sv", ":source $MYVIMRC<CR>", { desc = "[S]ource [V]imrc", noremap = true }) -- source vimrc

-- -- copy to system clipboard to all lines in the block
-- vim.keymap.set("x", "<leader>p", [["_dP]])

-- -- next greatest remap ever : asbjornHaland
-- -- ability to yank to system clipboard
-- vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
-- vim.keymap.set("n", "<leader>Y", [["+Y]])
