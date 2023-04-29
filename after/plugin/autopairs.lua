if vim.g.vscode == 1 then
	return
end

local status_ap, autopairs = pcall(require, "nvim-autopairs")
if not status_ap then
	return
end

autopairs.setup({
	check_ts = true,
	ts_config = {
		lua = { "string", "source" },
		javascript = { "string", "template_string" },
		java = false,
	},
	disable_filetype = { "TelescopePrompt", "spectre_panel" },
})

local cmp_autopairs = require("nvim-autopairs.completion.cmp")
local status_cmp, cmp = pcall(require, "cmp")
if not status_cmp then
	return
end
cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
