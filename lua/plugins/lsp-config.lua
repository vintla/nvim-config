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
  -- servers = {
  --
  --   settings = {
  --     sql = {
  --       mason = true,
  --     },
  --     completion = {
  --       callSnippet = "Replace",
  --     },
  --   },
  -- },
  -- setup = {
  --   sqls = function()
  --     require("lspconfig").sqls.setup({
  --       on_attach = function(client, bufnr)
  --         require("sqls").on_attach(client, bufnr)
  --       end,
  --       settings = {
  --         sqls = {
  --           connections = {
  --             {
  --               driver = "mysql",
  --               dataSource = "mysql://phpmyadmin:alvin_ferdian@tcp(127.0.0.1:3306)/mysql?sslmode=disable",
  --             },
  --           },
  --         },
  --       },
  --     })
  --   end,
  -- },
}
