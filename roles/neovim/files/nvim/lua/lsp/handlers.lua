local M = {}

M.on_attach = function(client, bufnr)
  local diag_float_grp = vim.api.nvim_create_augroup('DiagnosticFloat', { clear = true })
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

  vim.diagnostic.config({ underline = false })

  local bufopts = { noremap = true, silent = true, buffer = bufnr }

  -- LSP Mappings
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
  vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
  vim.keymap.set('n', 'K', ':Lspsaga hover_doc<CR>', bufopts)
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
  vim.keymap.set('n', '<leader>k', vim.lsp.buf.signature_help, bufopts)
  vim.keymap.set('n', '<leader>D', vim.lsp.buf.type_definition, bufopts)
  vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, bufopts)
  vim.keymap.set('n', '<leader>ca', ':Lspsaga code_action<CR>', bufopts)
  vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, bufopts)
  vim.keymap.set('n', '<leader>dp', vim.diagnostic.goto_prev, bufopts)
  vim.keymap.set('n', '<leader>dn', vim.diagnostic.goto_next, bufopts)
  vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, bufopts)
  vim.keymap.set('n', '<leader>lf', '<cmd>lua vim.lsp.buf.format { async = true }<CR>', bufopts)
  -- vim.keymap.set('n', '<C-u>', "<cmd>lua require('lspsaga.action').smart_scroll_with_saga(-1)<cr>", bufopts)
  -- vim.keymap.set('n', '<C-d>', "<cmd>lua require('lspsaga.action').smart_scroll_with_saga(1)<cr>", bufopts)

  if vim.lsp.inlay_hint then
    vim.keymap.set('n', '<leader>g', function()
      vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled(), { bufnr })
    end, bufopts)
  end

  if client.name == 'ts_ls' then
    client.server_capabilities.document_formatting = false
  end

  if client.server_capabilities.document_formatting then
    vim.api.nvim_command('autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()')
  end
end

local status_ok, cmp_nvim_lsp = pcall(require, 'cmp_nvim_lsp')
if not status_ok then
  return
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
M.capabilities = cmp_nvim_lsp.default_capabilities(capabilities)

return M
