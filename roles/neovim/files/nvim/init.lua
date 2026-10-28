-- cache Lua modules; must run before any require
vim.loader.enable()

require('options')
require('keybindings')
require('plugin-manager')
require('colorscheme')
require('nvim-tree-config')
require('telescope-config')
-- require('completion')
require('lsp')
require('tests')
require('terminals')
