require("nvchad.configs.lspconfig").defaults()
-- EXAMPLE
local on_attach = require("nvchad.configs.lspconfig").on_attach
local on_init = require("nvchad.configs.lspconfig").on_init
local capabilities = require("nvchad.configs.lspconfig").capabilities


-- typescript
vim.lsp.config('gopls', {
  on_attach = on_attach,
  capabilities = capabilities,
  -- cmd = {"gopls", "serve"},
  cmd = { "gopls" },
  filetypes = { "go", "gomod", "gowork", "gotmpl" },
  --root_dir = util.root_pattern("go.work", "go.mod", ".git"),
  root_markers = { 'go.work', 'go.mod', '.git', 'go.sum' },
  settings = {
       gopls = {
      -- more settings: https://github.com/golang/tools/blob/master/gopls/doc/settings.md
      -- flags = {allow_incremental_sync = true, debounce_text_changes = 500},
      -- not supported
      analyses = { unusedparams = true, unreachable = false },
      codelenses = {
        generate = true, -- show the `go generate` lens.
        gc_details = true, --  // Show a code lens toggling the display of gc's choices.
        test = true,
        tidy = true,
      },
      usePlaceholders = true,
      completeUnimported = true,
      staticcheck = true,
      diagnosticsDelay = '500ms',
      gofumpt = false, -- true, -- turn on for new repos, gofmpt is good but also create code turmoils
      semanticTokens = false,
    },
  },
})
vim.lsp.enable('gopls')
