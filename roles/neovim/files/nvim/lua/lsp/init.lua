local status_ok, _ = pcall(require, 'lspconfig')
if not status_ok then
  return
end

require('mason').setup({
  ui = {
    icons = {
      package_installed = '✓',
    },
  },
})

require('mason-lspconfig').setup({
  ensure_installed = { 'elixirls', 'lua_ls', 'rust_analyzer', 'solargraph' },
})

local lspconfig = require('lspconfig')

lspconfig.elixirls.setup({
  on_attach = require('lsp.handlers').on_attach,
  capabilities = require('lsp.handlers').capabilities,
})

lspconfig.gopls.setup({
  on_attach = require('lsp.handlers').on_attach,
  capabilities = require('lsp.handlers').capabilities,
})

lspconfig.rust_analyzer.setup({
  on_attach = require('lsp.handlers').on_attach,
  capabilities = require('lsp.handlers').capabilities,
  filetypes = { 'rust' },
  settings = {
    ['rust-analyzer'] = {
      checkOnSave = {
        allFeatures = true,
        overrideCommand = {
          'cargo',
          'clippy',
          '--workspace',
          '--message-format=json',
          '--all-targets',
          '--all-features',
        },
      },
    },
  },
})

lspconfig.solargraph.setup({
  on_attach = require('lsp.handlers').on_attach,
  capabilities = require('lsp.handlers').capabilities,
  settings = {
    solargraph = {
      diagnostics = true,
      formatting = true,
    },
  },
})

lspconfig.lua_ls.setup({
  on_attach = require('lsp.handlers').on_attach,
  capabilities = require('lsp.handlers').capabilities,
  settings = {
    Lua = {
      diagnostics = {
        globals = { 'vim', 'use', 'hs', 'spoon' },
      },
    },
  },
})

--[[ lspconfig.solidity.setup({
  on_attach = require('lsp.handlers').on_attach,
  capabilities = require('lsp.handlers').capabilities,
}) ]]

lspconfig.tsserver.setup({
  on_attach = require('lsp.handlers').on_attach,
  capabilities = require('lsp.handlers').capabilities,
})

lspconfig.cairo_ls.setup({
  cmd = { 'scarb', 'cairo-language-server' },
  root_dir = lspconfig.util.root_pattern('Scarb.toml', 'protostar.toml'),
  on_attach = require('lsp.handlers').on_attach,
  capabilities = require('lsp.handlers').capabilities,
})

lspconfig.yamlls.setup({})

lspconfig.astro.setup({
  on_attach = require('lsp.handlers').on_attach,
  capabilities = require('lsp.handlers').capabilities,
})

lspconfig.typst_lsp.setup({
  on_attach = require('lsp.handlers').on_attach,
  capabilities = require('lsp.handlers').capabilities,
})

lspconfig.gopls.setup({
  on_attach = require('lsp.handlers').on_attach,
  capabilities = require('lsp.handlers').capabilities,
})
