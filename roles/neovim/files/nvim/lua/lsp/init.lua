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
  ensure_installed = { 'elixirls', 'lua_ls', 'rust_analyzer' },
})

vim.lsp.config('elixirls', {
  on_attach = require('lsp.handlers').on_attach,
  capabilities = require('lsp.handlers').capabilities,
})

vim.g.rustaceanvim = {
  server = {
    on_attach = require('lsp.handlers').on_attach,
    capabilities = require('lsp.handlers').capabilities,
    default_settings = {
      ['rust-analyzer'] = {
        checkOnSave = true,
      },
      cargo = {
        allFeatures = true,
        targetDir = true,
      },
    },
  },
}

vim.lsp.config('lua_ls', {
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

vim.lsp.config('solidity_ls', {
  on_attach = require('lsp.handlers').on_attach,
  capabilities = require('lsp.handlers').capabilities,
})

vim.lsp.config('ts_ls', {
  on_attach = require('lsp.handlers').on_attach,
  capabilities = require('lsp.handlers').capabilities,
})

vim.lsp.config('astro', {
  on_attach = require('lsp.handlers').on_attach,
  capabilities = require('lsp.handlers').capabilities,
})

vim.lsp.config('tailwindcss', {})

-- lspconfig.tailwindcss.setup({
--   on_attach = require('lsp.handlers').on_attach,
--   capabilities = require('lsp.handlers').capabilities,
--   settings = {
--     tailwindCSS = {
--       filetypes_include = { 'heex' },
--       includeLanguages = {
--         elixir = 'html-eex',
--         eelixir = 'html-eex',
--         heex = 'html',
--       },
--     },
--   },
-- })

vim.lsp.config('svelte', {
  on_attach = require('lsp.handlers').on_attach,
  capabilities = require('lsp.handlers').capabilities,
})

vim.lsp.config('rnix', {
  on_attach = require('lsp.handlers').on_attach,
  capabilities = require('lsp.handlers').capabilities,
})
