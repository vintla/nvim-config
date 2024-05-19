-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local set = vim.keymap.set

set("n", "<leader>sx", require("telescope.builtin").resume, { noremap = true, silent = true, desc = "Resume" })

set("n", "<leader>F", function()
  require("telescope").extensions.flutter.commands()
end, { noremap = true, silent = true, desc = "Flutter Menu" })

-- set(
--
--   "n",
--   "<leader>a",
--   '<cmd>lua require("lsp-fastaction").code_action()<CR>',
--   { noremap = true, silent = true, desc = "Flutter code action" }
-- )
-- set(
--   "v",
--   "<leader>a",
--   "<esc><cmd>lua require('lsp-fastaction').range_code_action()<CR>",
--   { noremap = true, silent = true, desc = "Flutter range code action" }
-- )
