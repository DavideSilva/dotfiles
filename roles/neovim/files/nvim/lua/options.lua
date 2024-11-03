vim.o.number = true
vim.o.relativenumber = true
vim.o.tabstop = 2
vim.o.softtabstop = 2
vim.o.shiftwidth = 2
vim.o.cmdheight = 0
vim.o.splitbelow = true
vim.o.splitright = true
vim.o.signcolumn = 'yes'
vim.o.splitkeep = 'screen'
vim.o.showcmd = true
vim.o.expandtab = true
vim.o.syntax = 'off'
vim.o.mouse = 'a'
vim.o.cursorline = false
vim.o.cursorcolumn = false
vim.o.showmode = false
vim.o.autoread = true
vim.o.hidden = true
vim.o.shortmess = vim.o.shortmess .. 'c'
vim.o.inccommand = 'split'
vim.o.foldenable = false
vim.o.list = true
vim.o.background = 'dark'
vim.o.termguicolors = true
vim.o.updatetime = 250
vim.o.timeoutlen = 300
vim.o.expandtab = true
vim.opt.termguicolors = true
vim.opt.listchars = { tab = '  ', trail = '·', extends = '>', precedes = '<' }
vim.opt.foldmethod = 'expr'
vim.opt.foldexpr = 'nvim_treesitter#foldexpr()'

-- Highlight on yank
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})

-- Experimental Lua module loader that improves startup time
vim.loader.enable()
