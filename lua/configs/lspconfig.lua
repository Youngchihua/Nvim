require("nvchad.configs.lspconfig").defaults()
-- EXAMPLE
local on_attach = require("nvchad.configs.lspconfig").on_attach
local on_init = require("nvchad.configs.lspconfig").on_init
local capabilities = require("nvchad.configs.lspconfig").capabilities

local util = require "lspconfig/util"
local servers = { "gopls", "clangd", "rust_analyzer" }

vim.lsp.enable(servers)

vim.lsp.config("gopls", {
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
)
vim.lsp.config("clangd", {
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
)
vim.lsp.config("rust_analyzer", {
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
)
