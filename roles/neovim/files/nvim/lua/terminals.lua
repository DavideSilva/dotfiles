local Terminal = require('toggleterm.terminal').Terminal
local term = Terminal:new({ hidden = true, direction = 'vertical' })

function VTerm()
  term:toggle()
end

local map = vim.api.nvim_set_keymap

map('n', '<leader>\\', '<cmd>lua VTerm()<CR>', { noremap = true, silent = true })
