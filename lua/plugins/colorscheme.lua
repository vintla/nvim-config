return {
  { "catppuccin/nvim" },
  { "ellisonleao/gruvbox.nvim" },
  { "savq/melange-nvim" },
  {
    "luisiacc/gruvbox-baby",
    priority = 1000,
    lazy = true,
    config = function()
      local colors = require("gruvbox-baby.colors").config()
      vim.g.gruvbox_baby_highlights = {
        StatusLine = { fg = colors.fg, bg = colors.bg },
        WinBarNC = { fg = colors.fg, bg = colors.bg },
        WinBar = { fg = colors.fg, bg = colors.bg },
        BufferLineFill = { bg = colors.bg },
        BufferLineFillNC = { bg = colors.bg },
        BufferLineUnfocusedFill = { bg = colors.bg },
        TabLine = { bg = colors.bg, fg = colors.fg },
        NvimTreeNormal = { bg = colors.bg, fg = colors.fg },
        NvimTreeNormalNC = { bg = colors.bg, fg = colors.fg },
        NvimTreeWinSeparator = { fg = colors.fg },
        Pmenu = { fg = colors.fg, bg = colors.bg },
        WhichKeyFloat = { fg = colors.fg, bg = colors.bg },
        WhichKeyBorder = { fg = colors.fg, bg = colors.bg },
        NormalFloat = { fg = colors.fg, bg = colors.bg },
        NormalNC = { fg = colors.fg, bg = colors.bg },
        FloatBorder = { fg = colors.fg, bg = colors.bg },
        LspInfoBorder = { fg = colors.fg, bg = colors.bg },
      }
      vim.g.gruvbox_baby_transparent_mode = true
    end,
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "gruvbox-baby",
    },
  },
}
