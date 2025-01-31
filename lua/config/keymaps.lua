-- [[ Basic Keymaps ]]
--  See `:help vim.keymap.set()`
local keymap = vim.keymap -- for conciseness
keymap.set("i", "jk", "<ESC>", {
	silent = true,
	noremap = true,
	desc = "Exit insert mode",
})

keymap.set("n", "<leader>z", "<cmd>.lua<CR>", { desc = "Execute the current line" })
keymap.set("n", "<leader>Z", "<cmd>source %<CR>", { desc = "Execute the current file" })

keymap.set("v", "J", ":m '>+1<CR>gv=gv", {
	noremap = true,
	silent = true,
	desc = "Move visually selected line(s) down",
})
keymap.set("v", "K", ":m '<-2<CR>gv=gv", {
	noremap = true,
	silent = true,
	desc = "Move visually selected line(s) up",
})

keymap.set("n", "<Leader>w", ":write!<CR>", {
	noremap = true,
	silent = true,
	desc = "Save file",
})

keymap.set("v", "<", "<gv", { desc = "Indent left" })
keymap.set("v", ">", ">gv", { desc = "Indent right" })

keymap.set("v", "p", '"_dp', { desc = "Paste over currently selected text without yanking it" })
keymap.set("v", "P", '"_dP', { desc = "Paste over currently selected text without yanking it" })
keymap.set("n", "x", '"_x', {
	noremap = true,
	silent = true,
	desc = "Delete character without copying to register",
})

keymap.set("n", "<leader><ENTER>", ":nohl<CR>", { desc = "[C]lear search highlights" })

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

keymap.set("n", "<C-j>", "<C-W>j", { silent = true, desc = "Move to window below" })
keymap.set("n", "<C-k>", "<C-W>k", { silent = true, desc = "Move to window above" })
keymap.set("n", "<C-l>", "<C-W>l", { silent = true, desc = "Move to window right" })
keymap.set("n", "<C-h>", "<C-W>h", { silent = true, desc = "Move to window left" })

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

keymap.set("n", "+", ":resize +5<CR>", { desc = "Increase window height" })
keymap.set("n", "_", ":resize -5<CR>", { desc = "Decrease window height" })
keymap.set("n", "=", ":vertical resize +5<CR>", { desc = "Increase window width" })
keymap.set("n", "-", ":vertical resize -5<CR>", { desc = "Decrease window width" })

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
