return {
  "neovim/nvim-lspconfig",
  init = function()
    local keys = require("lazyvim.plugins.lsp.keymaps").get()
    -- Change a keymap or add new ones here
    keys[#keys + 1] =
      { "<leader>a", '<cmd>lua require("lsp-fastaction").code_action()<CR>', desc = "Flutter code action" }
    keys[#keys + 1] = {
      "<leader>a",
      "<esc><cmd>lua require('lsp-fastaction').range_code_action()<CR>",
      desc = "Flutter range code action",
    }
  end,
}
