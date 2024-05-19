return {
  {
    "akinsho/flutter-tools.nvim",
    event = "VeryLazy",
    dependencies = { "nvim-lua/plenary.nvim", "stevearc/dressing.nvim", "mfussenegger/nvim-dap" },
    config = function()
      local line = { "🭽", "▔", "🭾", "▕", "🭿", "▁", "🭼", "▏" }
      require("flutter-tools").setup({
        ui = {
          border = line,
          notification_style = "plugin",
        },
        outline = {
          open_cmd = "30vnew",
          auto_open = false,
        },
        closing_tags = {
          highlight = "Comment",
          prefix = "// ",
          enabled = true,
        },
        widget_guides = {
          enabled = true,
        },
        debugger = {
          enabled = true,
          run_via_dap = true,
          exception_breakpoints = {},
          register_configurations = function(_)
            require("dap").adapters.dart = {
              type = "executable",
              command = vim.fn.stdpath("data") .. "/mason/bin/dart-debug-adapter",
              args = { "dart" },
            }

            require("dap").adapters.flutter = {
              type = "executable",
              command = vim.fn.stdpath("data") .. "/mason/bin/dart-debug-adapter",
              args = { "flutter" },
            }
            --
            require("dap").configurations.dart = {
              {
                type = "dart",
                request = "launch",
                name = "Launch dart",
                dartSdkPath = "/home/alvinferdianakbar/Development/flutter/bin/cache/dart-sdk/bin/dart",
                flutterSdkPath = "/home/alvinferdianakbar/Development/flutter/bin/flutter",
                program = "${workspaceFolder}/lib/main.dart",
                cwd = "${workspaceFolder}",
              },
              {
                type = "flutter",
                request = "launch",
                name = "Launch flutter",
                dartSdkPath = "/home/alvinferdianakbar/Development/flutter/bin/cache/dart-sdk/bin/dart",
                flutterSdkPath = "/home/alvinferdianakbar/Development/flutter/bin/flutter",
                program = "${workspaceFolder}/lib/main.dart",
                cwd = "${workspaceFolder}",
              },
            }

            --
            -- require("dap.ext.vscode").load_launchjs()
          end,
        },
        dev_log = {
          enabled = false,
          open_cmd = "tabedit",
        },
        lsp = {

          -- on_attach = require("lazyvim.plugins.lsp.init").on_attach,
          color = {
            enabled = true,
            background = false,
            background_color = { r = 220, g = 223, b = 228 },
            foreground = false,
            virtual_text = true,
            virtual_text_str = "■",
          },
          settings = {
            showTodos = true,
            completeFunctionCalls = true,
            renameFilesWithClasses = "prompt",
            enableSnippets = true,
            enableSdkFormatter = true,
            analysisExcludedFolders = {
              ".dart_tool",
            },
          },
          -- capabilities = require("lazyvim.plugins.lsp.init").capabilities,
        },
      })
    end,
    --       ui = {
    --         border = line,
    --       },
    --       flutter_path = "/home/alvinferdianakbar/Development/flutter/bin/flutter",
    --       widget_guides = {
    --         enabled = true,
    --       },
    --       dev_log = { enabled = false, open_cmd = "tabedit" },
    --       lsp = {
    --         color = {
    --           enabled = true,
    --           settings = {
    --             showTodos = false,
    --             renameFilesWithClasses = "always",
    --             updateImportsOnRename = true,
    --             completeFunctionCalls = true,
    --             lineLength = 100,
    --           },
    --           -- on_attach = require("lazyvim.plugins.lsp.init").on_attach,
    --           -- capabilities = require("lazyvim.plugins.lsp.init").capabilities,
    --         },
    --       },
    --       debugger = {
    --         enabled = true,
    --         run_via_dap = true,
    --         exception_breakpoints = {},
    --         -- register_configuration = function(_)
    --         --   require("dap").configuration.dart = {}
    --         --   require("dap.ext.vscode").load_lauchjs()
    --         -- end,
    --       },
    --     })
    --     require("telescope").load_extension("flutter")
    --   end,
    -- },
    -- {
    --   "nvim-neotest/neotest",
    --   dependencies = {
    --     { "sidlatau/neotest-dart" },
    --   },
    --   opts = function(_, opts)
    --     vim.list_extend(opts.adapters, {
    --       require("neotest-dart")({ command = "flutter" }),
    --     })
    --   end,
  },
}
