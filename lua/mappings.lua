require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set
local opts = { noremap = true, silent = true }
map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

--windows 分屏快捷键
map("n", "sv", ":vsp<CR>", opts)
map("n", "sh", ":sp<CR>", opts)
map("n", "sc", "<C-w>c", opts)
map("n", "so", "<C-w>o", opts)

--简化窗口跳转快捷键
map("n", "<C-h>", "<C-w><C-h>", { desc = "Switch left window" })
map("n", "<C-j>", "<C-w><C-j>", { desc = "Switch lower window" })
map("n", "<C-k>", "<C-w><C-k>", { desc = "Switch upper window" })
map("n", "<C-l>", "<C-w><C-l>", { desc = "Switch right window" })
--全选
map("n", "<C-a>", "gg<S-v>G")
-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")

--go
map("n", "fe", ":GoIfErr<CR>", { desc = "Add if err" })
map("n", "fs", ":GoFillStruct<CR>", { desc = "Auto fill struct" })
map("n", "<leader>ta", ":GoAddTag<CR>", { desc = "Add tag" })
map("n", "<leader>tr", ":GoRmTag<CR>", { desc = "Remove tag" })

map("n", "tt", ":below 10sp | term<cr>a", opts)

map("n", "<leader><C-j>", function()
  vim.diagnostic.goto_next()
end, opts)
