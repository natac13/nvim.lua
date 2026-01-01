return {
	"nvim-neo-tree/neo-tree.nvim",
	cmd = "Neotree",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
		"MunifTanjim/nui.nvim",
	},
	keys = {
		{
			"<leader>e",
			function()
				require("neo-tree.command").execute({ toggle = true, dir = vim.loop.cwd() })
			end,
			desc = "Explorer NeoTree (cwd)",
		},
		{
			"<leader>oo",
			function()
				vim.cmd([[Neotree buffers focus float]])
			end,
			desc = "Open NeoTree buffers in floating window",
		},
		{
			"<leader>ge",
			function()
				vim.cmd([[Neotree git_status focus float]])
			end,
			desc = "Open NeoTree git status",
		},
	},
	deactivate = function()
		vim.cmd([[Neotree close]])
	end,
	opts = {
		filesystem = {
			bind_to_cwd = false,
			follow_current_file = true,
			use_libuv_file_watcher = true,
			filtered_items = {
				visible = true,
				-- hide_dotfiles = true,
				-- hide_gitignored = true,
				-- hide_hidden = true, -- only works on Windows for hidden files/directories
			},
		},
		git_status = {
			window = {
				position = "float",
				mappings = {
					["A"] = "git_add_all",
					["gu"] = "git_unstage_file",
					["ga"] = "git_add_file",
					["gr"] = "git_revert_file",
					["gc"] = "git_commit",
					["gp"] = "git_push",
					["gg"] = "git_commit_and_push",
				},
			},
		},
		window = {
			width = 30,
			mappings = {
				["<space>"] = "none",
				["l"] = "open",
				["L"] = "open_vsplit",
				["h"] = "close_node",
			},
		},
		default_component_configs = {
			indent = {
				with_expanders = true, -- if nil and file nesting is enabled, will enable expanders
				expander_collapsed = "",
				expander_expanded = "",
				expander_highlight = "NeoTreeExpander",
			},
		},
	},
	config = function(_, opts)
		-- vim.keymap.set("n", "<leader><S-e>", "<cmd>Neotree buffers focus float<CR>", { noremap = true, silent = true })
		vim.cmd([[ let g:neo_tree_remove_legacy_commands = 1 ]])

		require("neo-tree").setup(opts)

		vim.api.nvim_create_autocmd("TermClose", {
			pattern = "*lazygit",
			callback = function()
				if package.loaded["neo-tree.sources.git_status"] then
					require("neo-tree.sources.git_status").refresh()
				end
			end,
		})
	end,
}
