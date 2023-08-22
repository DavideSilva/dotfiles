-- vim-test bindings
local map = vim.api.nvim_set_keymap

vim.g['test#strategy'] = 'neovim'

vim.g['test#custom_runners'] = { typescript = { 'hardhat' } }
vim.g['test#typescript#runner'] = 'hardhat'

map('n', '<leader>rr', ':TestNearest<CR>', { silent = true, noremap = true })
map('n', '<leader>rs', ':TestSuite<CR>', { silent = true, noremap = true })
map('n', '<leader>rv', ':TestVisit<CR>', { silent = true, noremap = true })
map('n', '<leader>rf', ':TestFile<CR>', { silent = true, noremap = true })
map('n', '<leader>rl', ':TestLast<CR>', { silent = true, noremap = true })
