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
  ensure_installed = { 'lua_ls', 'gopls', 'eslint', 'vtsls' },
  -- expert and vtsls replace the Mason-installed elixir-ls and ts_ls
  automatic_enable = { exclude = { 'elixirls', 'ts_ls' } },
})

-- formatters used by conform; Mason has no ensure_installed for non-LSP tools
local registry = require('mason-registry')
registry.refresh(function()
  for _, name in ipairs({ 'prettierd', 'goimports', 'gofumpt' }) do
    local ok, pkg = pcall(registry.get_package, name)
    if ok and not pkg:is_installed() then
      pkg:install()
    end
  end
end)

vim.diagnostic.config({ underline = false })

local diag_float_grp = vim.api.nvim_create_augroup('DiagnosticFloat', { clear = true })

-- keymaps for every server, including the ones mason-lspconfig auto-enables
-- (capabilities come from blink.cmp, which registers them on vim.lsp.config('*'))
vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('LspKeymaps', { clear = true }),
  callback = function(args)
    local bufnr = args.buf
    local client = vim.lsp.get_client_by_id(args.data.client_id)

    vim.api.nvim_clear_autocmds({ group = diag_float_grp, buffer = bufnr })
    vim.api.nvim_create_autocmd('CursorHold', {
      buffer = bufnr,
      callback = function()
        local opts = {
          focusable = false,
          close_events = { 'BufLeave', 'CursorMoved', 'InsertEnter', 'FocusLost' },
          border = 'rounded',
          source = 'always',
          prefix = ' ',
          scope = 'cursor',
        }
        vim.diagnostic.open_float(nil, opts)
      end,
      group = diag_float_grp,
    })

    local bufopts = { noremap = true, silent = true, buffer = bufnr }

    -- LSP Mappings
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
    vim.keymap.set('n', 'K', function()
      vim.lsp.buf.hover({ border = 'rounded' })
    end, bufopts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
    vim.keymap.set('n', '<leader>k', vim.lsp.buf.signature_help, bufopts)
    vim.keymap.set('n', '<leader>D', vim.lsp.buf.type_definition, bufopts)
    vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, bufopts)
    vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, bufopts)
    vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, bufopts)
    vim.keymap.set('n', '<leader>dp', function()
      vim.diagnostic.jump({ count = -1, float = true })
    end, bufopts)
    vim.keymap.set('n', '<leader>dn', function()
      vim.diagnostic.jump({ count = 1, float = true })
    end, bufopts)
    vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, bufopts)
    vim.keymap.set('n', '<leader>lf', '<cmd>lua vim.lsp.buf.format { async = true }<CR>', bufopts)

    vim.keymap.set('n', '<leader>g', function()
      vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ bufnr = bufnr }), { bufnr = bufnr })
    end, bufopts)

    if client and client.name == 'vtsls' then
      client.server_capabilities.documentFormattingProvider = false
    end

    if client and client.name == 'eslint' then
      vim.api.nvim_create_autocmd('BufWritePre', {
        buffer = bufnr,
        command = 'silent! LspEslintFixAll',
      })
    end
  end,
})

vim.g.rustaceanvim = {
  cmd = function()
    return { 'rust-analyzer' }
  end,
  server = {
    capabilities = require('blink.cmp').get_lsp_capabilities(),
    default_settings = {
      ['rust-analyzer'] = {
        checkOnSave = true,
        check = { command = 'clippy' },
        cargo = {
          allFeatures = true,
          targetDir = true,
        },
      },
    },
  },
}

vim.lsp.config('lua_ls', {
  settings = {
    Lua = {
      diagnostics = {
        globals = { 'vim', 'use', 'hs', 'spoon' },
      },
    },
  },
})

-- vim.lsp.config('tailwindcss', {
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

-- upstream falls back to any .git root, which starts tailwind in every repo;
-- v4 projects are still found through package.json / mix.lock
vim.lsp.config('tailwindcss', {
  root_dir = function(bufnr, on_dir)
    local util = require('lspconfig.util')
    local fname = vim.api.nvim_buf_get_name(bufnr)
    local root_files = {
      'tailwind.config.js',
      'tailwind.config.cjs',
      'tailwind.config.mjs',
      'tailwind.config.ts',
      'postcss.config.js',
      'postcss.config.cjs',
      'postcss.config.mjs',
      'postcss.config.ts',
    }
    root_files = util.insert_package_json(root_files, 'tailwindcss', fname)
    root_files = util.root_markers_with_field(root_files, { 'mix.lock', 'Gemfile.lock' }, 'tailwind', fname)
    local found = vim.fs.find(root_files, { path = fname, upward = true })[1]
    if found then
      on_dir(vim.fs.dirname(found))
    end
  end,
})

vim.lsp.config('gopls', {
  settings = {
    gopls = {
      staticcheck = true,
      usePlaceholders = true,
      hints = { parameterNames = true, assignVariableTypes = true },
    },
  },
})

vim.lsp.config('expert', {
  cmd = { 'expert' },
  root_markers = { 'mix.exs', '.git' },
  filetypes = { 'elixir', 'eelixir', 'heex' },
})

-- Enable all configured LSP servers
vim.lsp.enable({ 'expert', 'lua_ls', 'gopls', 'eslint', 'solidity_ls', 'vtsls', 'terraformls', 'astro', 'svelte', 'rnix', 'zls' })
