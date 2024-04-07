return {
  "folke/trouble.nvim",
  dependencies = {
    "nvim-tree/nvim-web-devicons"
  },
  config = function()
    local trouble = require("trouble")
    trouble.setup()



    vim.keymap.set("n", "<leader>xx", "<cmd>TroubleToggle<cr>", {})
    vim.keymap.set(
      "n",
      "<leader>xw",
      "<cmd>TroubleToggle workspace_diagnostics<cr>",
      { silent = true, noremap = true, desc = "Toggle Trouble Workspace Diagnostics" }
    )
    vim.keymap.set(
      "n",
      "<leader>xd",
      "<cmd>TroubleToggle document_diagnostics<cr>",
      { silent = true, noremap = true, desc = "Toggle Trouble Document Diagnostics" }
    )
    vim.keymap.set(
      "n",
      "<leader>xl",
      "<cmd>TroubleToggle localist<cr>",
      { silent = true, noremap = true, desc = "Toggle Trouble Location List" }
    )
    vim.keymap.set(
      "n",
      "<leader>xq",
      "<cmd>TroubleToggle quickfix<cr>",
      { silent = true, noremap = true, desc = "Toggle Trouble Quickfix" }
    )
  end
}
