return {
	{
		"zbirenbaum/copilot.lua",
		cmd = "Copilot",
		build = ":Copilot auth",
		event = "InsertEnter",
		config = function()
			-- vim.keymap.set("i", "<Tab>", function()
			-- 	if require("copilot.suggestion").is_visible() then
			-- 		require("copilot.suggestion").accept()
			-- 	else
			-- 		vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Tab>", true, false, true), "n", false)
			-- 	end
			-- end, {
			-- 	silent = true,
			-- })

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
						accept = "<c-y>",
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
	{
		"CopilotC-Nvim/CopilotChat.nvim",
		dependencies = {
			-- { "github/copilot.vim" }, -- or zbirenbaum/copilot.lua
			{ "zbirenbaum/copilot.lua" },
			{ "nvim-lua/plenary.nvim", branch = "master" }, -- for curl, log and async functions
		},
		build = "make tiktoken", -- Only on MacOS or Linux
		opts = {
			debug = true,
			-- See Configuration section for options
			mappings = {
				complete = {
					insert = "<TAB>",
				},
				submit_prompt = {
					normal = "<CR>",
					insert = "<C-s>",
				},
				accept_diff = {
					normal = "<C-d>",
					insert = "<C-d>",
				},
			},
		},
		config = function(_, opts)
			local chat = require("CopilotChat")
			chat.setup(opts)

			vim.keymap.set("n", "<leader>ccq", function()
				local input = vim.fn.input("Quick Chat: ")
				if input ~= "" then
					chat.ask(input, { selection = require("CopilotChat.select").buffer })
				end
			end, {
				desc = "CopilotChat - Quick chat",
			})

			vim.keymap.set("n", "<leader>ccp", function()
				local actions = require("CopilotChat.actions")
				require("CopilotChat.integrations.telescope").pick(actions.prompt_actions())
			end, {
				desc = "CopilotChat - Prompt",
			})
		end,
	},
}
