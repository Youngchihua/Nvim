local null_ls = require "null-ls"

local opts = {
  null_ls.setup({
    sources = {
      null_ls.builtins.formatting.gofmt,
      null_ls.builtins.formatting.goimports_reviser,
      null_ls.builtins.formatting.golines,
    },
  }),
}

return opts
