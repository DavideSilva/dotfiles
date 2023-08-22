-- disable space in normal and visual mode
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- set space as leader key
vim.g.mapleader = ' '

-- set comma as local leader key
vim.g.maplocalleader = ','

local map = vim.api.nvim_set_keymap

--Remap for dealing with word wrap
map('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
map('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- save
map('i', '<C-s>', '<Esc>:w<CR>', { silent = true, noremap = true })
map('', '<C-s>', ':w<CR>', { silent = true, noremap = true })

-- close window
map('', '<C-q>', ':close<CR>', { silent = true })
map('t', '<C-q>', '<C-\\><C-n>:close<CR>', { silent = true, noremap = true })

-- leave insert mode
map('i', 'jk', '<Esc>', { silent = true, noremap = true })
map('t', '<C-e>', '<C-\\><C-n>', { silent = true, noremap = true })

-- clear search highlights
map('n', '<leader><cr>', ':nohlsearch<CR>', { silent = true, noremap = true })

-- open tig on a tmux pane
map('n', '<leader>gh', ':silent execute "!tmux new-window tig " . expand("%:p")<CR>', { silent = true, noremap = true })

-- open current buffer on a vertical split
map('n', 'vv', '<C-w>v', { silent = true, noremap = true })

-- move selected region up/down
map('v', 'J', ":m '>+1<CR>gv=gv", { silent = true, noremap = true })
map('v', 'K', ":m '<-2<CR>gv=gv", { silent = true, noremap = true })

-- recenter page on search navigation
map('n', 'n', 'nzz', { silent = true, noremap = true })
map('n', 'N', 'Nzz', { silent = true, noremap = true })
map('n', '*', '*zz', { silent = true, noremap = true })
map('n', '#', '#zz', { silent = true, noremap = true })
