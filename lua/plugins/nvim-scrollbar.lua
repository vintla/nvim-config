return {
  "petertriho/nvim-scrollbar",
  event = "VeryLazy",
  enabled = true,
  config = function()
    local scrollbar = require("scrollbar")
    local configs = require("gruvbox-baby.config")
    local colors = require("gruvbox-baby.colors")
    local c = colors.config(configs)
    scrollbar.setup({
      handle = { color = c.blue_gray },
      excluded_filetypes = { "prompt", "TelescopePrompt", "noice", "notify" },
      marks = {
        Search = { color = c.soft_yellow },
        Error = { color = c.error_red },
        Warn = { color = c.orange },
        Info = { color = c.bright_yellow },
        Hint = { color = c.light_blue },
        Misc = { color = c.magenta },
      },
    })
  end,
}
