return {
  "nvim-treesitter/nvim-treesitter",
  opts = function()
    return {
      ensure_installed = {
        --install GO parsers
        -- "go",
        -- "gomod",
        -- "gowork",
        -- "gosum",

        --install Dart parser
        "dart",
        "php",
        "python",
        "sql",
      },
      indent = {
        enable = true,
        disable = { "dart" },
      },
    }
  end,
}
