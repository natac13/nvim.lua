return {
  "akinsho/bufferline.nvim",
  event = { "VimEnter" },
  dependencies = {
    -- "famiu/bufdelete.nvim",
    "nvim-tree/nvim-web-devicons"
  },
  opts = {
    -- highlights = require("catppuccin.groups.integrations.bufferline").get(),
    -- options = {
    --   close_command = "Bdelete! %d",     -- can be a string | function, see "Mouse actions"
    --   right_mouse_command = "Bdelete! %d", -- can be a string | function, see "Mouse actions"
    --   offsets = { { filetype = "NvimTree", text = "", padding = 1 } },
    --   separator_style = "thin",          -- | "thick" | "thin" | { 'any', 'any' },
    -- },
  }
}
