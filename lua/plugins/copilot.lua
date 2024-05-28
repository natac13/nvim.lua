return {
	{
		"zbirenbaum/copilot.lua",
		cmd = "Copilot",
		build = ":Copilot auth",
		event = "InsertEnter",
		config = function()
			vim.keymap.set("i", "<Tab>", function()
				if require("copilot.suggestion").is_visible() then
					require("copilot.suggestion").accept()
				else
					vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Tab>", true, false, true), "n", false)
				end
			end, {
				silent = true,
			})

			require("copilot").setup({
				panel = {
					enabled = true,
					auto_refresh = true,
					keymap = {
						jump_next = "<c-j>",
						jump_prev = "<c-k>",
						accept = "<c-y>",
						refresh = "r",
						open = "<M-CR>", -- MacOS option + enter
					},
					layout = {
						position = "bottom", -- | top | left | right
						ratio = 0.4,
					},
				},
				suggestion = {
					enabled = true,
					auto_trigger = true,
					debounce = 75,
					keymap = {
						accept = false,
						accept_word = false,
						accept_line = false,
						next = "<c-j>",
						prev = "<c-k>",
						dismiss = "<C-e>",
					},
				},
			})
		end,
	},

	-- {
	--     "zbirenbaum/copilot-cmp",
	--     -- after = { "copilot.lua" },
	--     config = function()
	--         require("copilot_cmp").setup()
	--     end,
	-- }
	-- {
	--   "github/copilot.vim",
	-- },
}
