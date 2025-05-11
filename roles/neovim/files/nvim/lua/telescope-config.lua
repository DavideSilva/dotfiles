vim.keymap.set('n', '<leader><space>', require('telescope.builtin').buffers)
vim.keymap.set('n', '<leader>sf', function()
  require('telescope.builtin').find_files({ previewer = false })
end)
vim.keymap.set('n', '<leader>sb', require('telescope.builtin').current_buffer_fuzzy_find)
vim.keymap.set('n', '<leader>sh', require('telescope.builtin').help_tags)
vim.keymap.set('n', '<leader>st', require('telescope.builtin').tags)
vim.keymap.set('n', '<leader>sd', require('telescope.builtin').grep_string)
vim.keymap.set('n', '<leader>sp', require('telescope.builtin').live_grep)

vim.keymap.set('n', '<leader>sa', ":lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>")

vim.keymap.set('n', '<leader>so', function()
  require('telescope.builtin').tags({ only_current_buffer = true })
end)
vim.keymap.set('n', '<leader>?', require('telescope.builtin').oldfiles)

local lga_actions = require('telescope-live-grep-args.actions')

require('telescope').setup({
  extensions = {
    fzf = {
      case_mode = 'ignore_case',
    },
    live_grep_args = {
      mappings = {
        i = {
          ['<C-f>'] = lga_actions.quote_prompt(),
          ['<C-i>'] = lga_actions.quote_prompt({ postfix = ' --iglob ' }),
        },
      },
    },
  },
  pickers = {
    buffers = {
      ignore_current_buffer = true,
      sort_lastused = true,
    },
  },
})

require('telescope').load_extension('live_grep_args')
require('telescope').load_extension('fzf')
