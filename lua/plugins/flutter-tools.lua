return { {
  "akinsho/flutter-tools.nvim",
  event = "VeryLazy",
  dependencies = { "nvim-lua/plenary.nvim", "stevearc/dressing.nvim", "mfussenegger/nvim-dap" },
  config = function()
    local line = { "🭽", "▔", "🭾", "▕", "🭿", "▁", "🭼", "▏" }
    require("flutter-tools").setup({
      ui = {
        border = line,
      },
      flutter_path = "/home/alvinferdianakbar/Development/flutter/bin/flutter",
      widget_guides = {
        enabled = true,
      },
      dev_log = { enabled = true, open_cmd = "tabedit" },
      lsp = {
        color = {
          enabled = true,
          settings = {
            showTodos = false,
            renameFilesWithClasses = "always",
            updateImportsOnRename = true,
            completeFunctionCalls = true,
            lineLength = 100,
          },
          -- on_attach = require("lazyvim.plugins.lsp.init").on_attach,
          -- capabilities = require("lazyvim.plugins.lsp.init").capabilities,
        },
      },
      debugger = {
        enabled = true,
        run_via_dap = true,
        exception_breakpoints = {},
        -- register_configuration = function(_)
        --   require("dap").configuration.dart = {}
        --   require("dap.ext.vscode").load_lauchjs()
        -- end,
      },
    })
    require("telescope").load_extension("flutter")
  end,
},
  {
    "nvim-neotest/neotest",
    dependencies = {
      { "sidlatau/neotest-dart" },
    },
    opts = function(_, opts)
      vim.list_extend(opts.adapters, {
        require "neotest-dart" { command = "flutter" },
      })
    end,
  },
}
