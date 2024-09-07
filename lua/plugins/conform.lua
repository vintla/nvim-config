local util = require("conform.util")
return {
  "stevearc/conform.nvim",
  opts = {
    formatters_by_ft = {
      sql = { "sql_formatter" },
      blade = { "blade_formater" },
      php = { "php-cs-fixer" },
    },
    formatters = {
      injected = { options = { ignore_errors = true } },

      ["blade-formatter"] = {
        command = "blade-formatter",
        args = {
          "--write",
          "$FILENAME",
          "--wrap-line-length",
          9999,
          "--wrap-attributes",
          "preserve-aligned",
        },
        cwd = util.root_file({
          ".editorconfig",
          "composer.json",
          "package.json",
        }),
        stdin = false,
      },
    },
  },
}
