vim.cmd('au BufRead,BufNewFile *.ex,*.exs set filetype=elixir')
vim.cmd('au BufRead,BufNewFile *.eex,*.heex,*.leex,*.sface,*.lexs set filetype=eelixir')
vim.cmd('au BufRead,BufNewFile *.slimleex set filetype=slime')
vim.cmd('au BufRead,BufNewFile mix.lock set filetype=elixir')

vim.cmd.colorscheme('catppuccin')
