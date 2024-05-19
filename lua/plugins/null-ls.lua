return {
  "nvimtools/none-ls.nvim",
  config = function()
    local nls = require("null-ls")

    nls.setup({
      sources = {
        nls.builtins.code_actions.dart_format,
        nls.builtins.diagnostics.dart_format,
      },
    })
  end,
}
