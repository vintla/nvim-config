-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
vim.keymap.set(
  "n",
  "<leader>sx",
  require("telescope.builtin").resume,
  { noremap = true, silent = true, desc = "Resume" })
--
-- local Terminal = require('toggleterm.terminal').Terminal:new({ hidden = true, })
--
--
-- function terminal_toggle()
--   Terminal:toggle()
-- end
--
-- vim.api.nvim_set_keymap("n", "<leader>q", "<cmd>lua terminal_toggle()<CR>",
--   { noremap = true, silent = true, desc = "Open terminal" })
