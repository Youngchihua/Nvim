require "nvchad.autocmds"

local autocmd = vim.api.nvim_create_autocmd
autocmd("BufWritePre", {
  pattern = "*lua,*.go,*.sh,*.c",
  callback = function()
    vim.lsp.buf.format { async = false }
  end,
})
