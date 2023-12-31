local map = vim.api.nvim_set_keymap
map('n', '<leader>nn', ':NvimTreeToggle<CR>', { silent = true, noremap = true })
map('n', '<leader>nf', ':NvimTreeFindFile<CR>', { silent = true, noremap = true })

require('nvim-tree').setup({
  hijack_directories = {
    auto_open = true,
  },
  disable_netrw = true,
  git = { ignore = true },
  view = {
    side = 'right',
    adaptive_size = true,
    centralize_selection = true,
  },
  filters = {
    dotfiles = true,
  },
  renderer = {
    indent_markers = {
      enable = true,
    },
  },
})
