local M = {
	"nvim-telescope/telescope.nvim",
	event = "Bufenter",
	tag = "0.1.1",
	cmd = { "Telescope" },
	dependencies = {
		{ "nvim-lua/plenary.nvim" },
	},
}

function M.config()
	local telescope = require("telescope")
	local actions = require("telescope.actions")
	local themes = require("telescope.themes")
	local builtin = require("telescope.builtin")

	telescope.setup({
		defaults = {
			-- prompt_prefix = " ",
			-- selection_caret = " ",
			-- path_display = { "smart" },
			-- file_ignore_patterns = { ".git/", "node_modules" },
			mappings = {
				i = {
					["<Down>"] = actions.move_selection_next,
					["<Up>"] = actions.move_selection_previous,
					["<C-j>"] = actions.move_selection_next,
					["<C-k>"] = actions.move_selection_previous,
					["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist, -- send selected to quickfixlist
				},
			},
			extensions = {
				["ui-select"] = {
					themes.get_dropdown({}),
				},
			},
		},
	})

	telescope.load_extension("fzf")
	telescope.load_extension("ui-select")

	-- all files in directory
	vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "[F]ind [F]iles" })
	vim.keymap.set("n", "<leader>?", builtin.oldfiles, { desc = "[?] Find Recently opened files" })
	-- only git tracked files, therefore no node_modules
	-- vim.keymap.set("n", "<C-p>", builtin.git_files, { desc = "Search Git tracked Files" })
	vim.keymap.set("n", "<C-p>", function()
		vim.fn.system("git rev-parse --is-inside-word-tree")
		if vim.v.shell_error == 0 then
			builtin.git_files()
		else
			builtin.find_files()
		end
	end, { desc = "Search Git tracked Files" })

	vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "[F]ind [B]uffers" })
	vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "[F]ind [H]elp Tags" })
	vim.keymap.set("n", "<leader>ps", builtin.live_grep, { desc = "[P]roject [S]earch" })
	-- vim.keymap.set("n", "<leader>ps", function()
	-- 	builtin.grep_string({ search = vim.fn.input("Grep > ") })
	-- end, {
	-- 	desc = "[P]roject [S]earch",
	-- })
end

return {
	M,
	{
		"nvim-telescope/telescope-fzf-native.nvim",
		build = "make",
		cond = vim.fn.executable("make") == 1,
	},
	{ "nvim-telescope/telescope-ui-select.nvim" },
}
