if vim.g.vscode == 1 then
	return
end

local status, bufferline = pcall(require, "bufferline")
if not status then
	return
end

bufferline.setup()
