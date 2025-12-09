require("nvchad.configs.lspconfig").defaults()
-- EXAMPLE
local on_attach = require("nvchad.configs.lspconfig").on_attach
local on_init = require("nvchad.configs.lspconfig").on_init
local capabilities = require("nvchad.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"
local util = require "lspconfig/util"
local servers = { "gopls", "rust_analyzer", "clangd", "pyright" }

vim.lsp.enable(servers)


vim.lsp.config("gopls", {
  on_attach = on_attach,
  capabilities = capabilities,
  -- cmd = {"gopls", "serve"},
  cmd = { "gopls" },
  filetypes = { "go", "gomod", "gowork", "gotmpl" },
  root_dir = util.root_pattern("go.work", "go.mod", ".git"),
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
}
)

vim.lsp.config("rust_analyzer", {
  capabilities = capabilities,
  on_attach = on_attach,
  root_markers = {'Cargo.toml', 'rust-project.json', '.git'},
  filetypes = { 'rust' },
  message_level = vim.lsp.protocol.MessageType.error,
  settings = {
    ['rust-analyzer'] = {
      cargo = { loadOutDirsFromCheck = true },
      procMacro = { enable = true },
    },
  },
  flags = { allow_incremental_sync = true, debounce_text_changes = 500 },
}
)


vim.lsp.config("clangd",  {
  capabilities = capabilities,
  on_attach = on_attach,
  cmd = { 'clangd' },
  filetypes = { "c", "cpp", "objc", "objcpp", "cuda" }, -- exclude "proto".
}
)
vim.lsp.config("pyright", {
  capabilities = capabilities,
  on_attach = on_attach,
  cmd = { 'pyright-langserver', '--stdio' },
  filetypes = { 'python' },
  flags = { allow_incremental_sync = true, debounce_text_changes = 500 },
  settings = {
    python = {
      venvPath = '.',
      formatting = { provider = 'black' },
      analysis = {
        autoSearchPaths = true,
        useLibraryCodeForTypes = true,
        diagnosticMode = 'workspace',
      },
    },
  },
}

)
