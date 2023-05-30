local keymap = vim.keymap -- for conciseness

-- set leader key to space
vim.g.mapleader = " "
vim.g.maplocalleader = " "
keymap.set({ "n", "v" }, "<Space>", "<Nop>", { silent = true })

---------------------
-- General Keymaps
---------------------
-- open explorer
-- vim.keymap.set("n", "<leader>e", vim.cmd.Ex)

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

-- remap for dealing with word wrap
keymap.set("n", "k", 'v:count == 0 ? "gk" : "k"', { expr = true, silent = true })
keymap.set("n", "j", 'v:count == 0 ? "gj" : "j"', { expr = true, silent = true })

keymap.set("v", "<C-j>", ":m '>+1<CR>gv=gv")
keymap.set("v", "<C-k>", ":m '<-2<CR>gv=gv")

-- next greatest remap ever : asbjornHaland
-- ability to yank to system clipboard
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])
