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
keymap.set("i", "jk", "<ESC>", { silent = true })

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

keymap.set("n", "<leader>bn", ":bnext<CR>", { desc = "[B]uffer [N]ext" }) -- go to next buffer
keymap.set("n", "<leader>bp", ":bprevious<CR>", { desc = "[B]uffer [P]revious" }) -- go to previous buffer
keymap.set("n", "<leader>bd", ":bdelete<CR>", { desc = "[B]uffer [D]elete" }) -- delete current buffer

-- smart way to move between windows
keymap.set("n", "<C-j>", "<C-W>j")
keymap.set("n", "<C-k>", "<C-W>k")
keymap.set("n", "<C-l>", "<C-W>l")
keymap.set("n", "<C-h>", "<C-W>h")

keymap.set({ "n", "v" }, "<Space>", "<Nop>", { silent = true })

-- remap for dealing with word wrap
keymap.set("n", "k", 'v:count == 0 ? "gk" : "k"', { expr = true, silent = true })
keymap.set("n", "j", 'v:count == 0 ? "gj" : "j"', { expr = true, silent = true })
