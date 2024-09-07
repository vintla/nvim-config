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
        "python",
        "sql",
        "blade",
        "php",
        "php_only",
        "html",
        "bash",
      },
      indent = {
        enable = true,
        disable = { "dart" },
      },

      highlight = {
        enable = true,

        -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
        -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
        -- Using this option may slow down your editor, and you may see some duplicate highlights.
        -- Instead of true it can also be a list of languages
        additional_vim_regex_highlighting = false,
      },
    }
  end,
  config = function(_, opts)
    ---@class parser_config
    local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
    parser_config.blade = {
      install_info = {
        url = "https://github.com/EmranMR/tree-sitter-blade",
        files = { "src/parser.c" },
        branch = "main",
      },
      filetype = "blade",
    }

    vim.filetype.add({
      pattern = {
        [".*%.blade%.php"] = "blade",
      },
    })
    require("nvim-treesitter.configs").setup(opts)
  end,
}
