require("nvchad.configs.lspconfig").defaults()
-- EXAMPLE
local on_attach = require("nvchad.configs.lspconfig").on_attach
local on_init = require("nvchad.configs.lspconfig").on_init
local capabilities = require("nvchad.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"
local util = require "lspconfig/util"
local servers = { "html", "cssls" }

-- lsps with default config
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    on_init = on_init,
    capabilities = capabilities,
  }
end

-- typescript
lspconfig.ts_ls.setup {
  on_attach = on_attach,
  on_init = on_init,
  capabilities = capabilities,
}
lspconfig.gopls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  -- cmd = {"gopls", "serve"},
  cmd = { 'gopls', '--mode=stdio' },
  filetypes = { "go", "gomod", "gowork", "gotmpl" },
  root_dir = util.root_pattern("go.work", "go.mod", ".git"),
  settings = {
    gopls = {
      usePlaceholders = true,
      analyses = {
        unusedparams = true,
      },
      staticcheck = true,
      gofumpt = true,
    },
  },
}
lspconfig.clangd.setup {
  capabilities = capabilities,
  on_attach = on_attach,
  flags = { allow_incremental_sync = true, debounce_text_changes = 500 },
  cmd = {
    'clangd',
    '--background-index',
    '--suggest-missing-includes',
    '--clang-tidy',
    '--header-insertion=iwyu',
    '--enable-config',
    '--offset-encoding=utf-16',
    '--clang-tidy-checks=-*,llvm-*,clang-analyzer-*',
    '--cross-file-rename',
  },
  filetypes = { 'c', 'cpp', 'objc', 'objcpp' },
}

lspconfig.rust_analyzer.setup {
  on_attach = on_attach,
  on_init = on_init,
  capabilities = capabilities,
  root_dir = util.root_pattern("Cargo.toml", ".git"),
  settings = {
    ["rust-analyzer"] = {
      checkOnSave = {
        enable = true,
        command = "clippy",
      },
    },
  },
}
