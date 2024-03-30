local M = {}

M.on_attach = function(client, bufnr)
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
  })

  local bufopts = { noremap = true, silent = true, buffer = bufnr }

  -- LSP Mappings
  vim.keymap.set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', bufopts)
  vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR><cmd>norm zz<CR>', bufopts)
  vim.keymap.set('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', bufopts)
  vim.keymap.set('n', 'K', ':Lspsaga hover_doc<CR>', bufopts)
  vim.keymap.set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', bufopts)
  vim.keymap.set('n', '<leader>k', '<cmd>lua vim.lsp.buf.signature_help()<CR>', bufopts)
  vim.keymap.set('n', '<leader>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', bufopts)
  vim.keymap.set('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', bufopts)
  vim.keymap.set('n', '<leader>ca', ':Lspsaga code_action<CR>', bufopts)
  vim.keymap.set('n', '<leader>e', '<cmd>lua vim.diagnostic.open_float()<CR>', bufopts)
  vim.keymap.set('n', '<leader>dp', '<cmd>lua vim.diagnostic.goto_prev()<CR>', bufopts)
  vim.keymap.set('n', '<leader>dn', '<cmd>lua vim.diagnostic.goto_next()<CR>', bufopts)
  vim.keymap.set('n', '<leader>q', '<cmd>lua vim.diagnostic.setloclist()<CR>', bufopts)
  vim.keymap.set('n', '<leader>lf', '<cmd>lua vim.lsp.buf.format { async = true }<CR>', bufopts)
  -- vim.keymap.set('n', '<C-u>', "<cmd>lua require('lspsaga.action').smart_scroll_with_saga(-1)<cr>", bufopts)
  -- vim.keymap.set('n', '<C-d>', "<cmd>lua require('lspsaga.action').smart_scroll_with_saga(1)<cr>", bufopts)

  if client.name == 'tsserver' then
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
