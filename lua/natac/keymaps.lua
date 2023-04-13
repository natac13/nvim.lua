-- set leader key to space
vim.g.mapleader = " "
vim.g.maplocalleader = " "

local keymap = vim.keymap -- for conciseness

---------------------
-- General Keymaps
---------------------
-- open explorer
-- vim.keymap.set("n", "<leader>e", vim.cmd.Ex)
vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>")

-- use jk to exit insert mode
keymap.set("i", "jk", "<ESC>")

-- clear search highlights
keymap.set("n", "<leader><ENTER>", ":nohl<CR>")

-- delete single character without copying into register
keymap.set("n", "x", '"_x')

-- window management
keymap.set("n", "<leader>|", "<C-w>v") -- split window vertically
keymap.set("n", "<leader>-", "<C-w>s") -- split window horizontally
keymap.set("n", "<leader>se", "<C-w>=") -- make split windows equal width & height
keymap.set("n", "<leader>sx", ":close<CR>") -- close current split window

keymap.set("n", "<leader>to", ":tabnew<CR>") -- open new tab
keymap.set("n", "<leader>tx", ":tabclose<CR>") -- close current tab
keymap.set("n", "<leader>tn", ":tabn<CR>") --  go to next tab
keymap.set("n", "<leader>tp", ":tabp<CR>") --  go to previous tab


-- smart way to move between windows
keymap.set("n", "<C-j>", "<C-W>j")
keymap.set("n", "<C-k>", "<C-W>k")
keymap.set("n", "<C-l>", "<C-W>l")
keymap.set("n", "<C-h>", "<C-W>h")

keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })


-- remap for dealing with word wrap
keymap.set("n", 'k', 'v:count == 0 ? "gk" : "k"', {expr = true, silent = true})
keymap.set("n", 'j', 'v:count == 0 ? "gj" : "j"', {expr = true, silent = true})

