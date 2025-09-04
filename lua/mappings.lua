require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set
local opts = { noremap = true, silent = true }
map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

--全选
map("n", "<C-a>", "gg<S-v>G")
-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")

map("n", "<C-j>", function()
  vim.diagnostic.goto_next()
end, opts)
