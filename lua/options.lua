require "nvchad.options"

-- add yours here!

-- local o = vim.o
-- o.cursorlineopt ='both' -- to enable cursorline!

vim.scriptencoding = "utf-8"
vim.opt.encoding = "utf-8"
vim.opt.fileencoding = "utf-8"

vim.opt.relativenumber = true

vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 0
vim.opt.splitbelow = true -- 水平拆分默认向下
vim.opt.splitright = true -- 垂直拆分默认向右

vim.opt.title = true
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.hlsearch = true
vim.opt.backup = false
vim.opt.showcmd = true
vim.opt.cmdheight = 0

--光标与滚动
vim.opt.scrolloff = 9
vim.opt.sidescroll = 9


--文件自动保存与读取
vim.o.autowrite = true
vim.o.autoread = true
vim.bo.autoread = true
