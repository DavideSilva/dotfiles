return {
  {
    'akinsho/toggleterm.nvim',
    event = 'ColorScheme',
    config = function()
      local highlights = require('rose-pine.plugins.toggleterm')
      require('toggleterm').setup({
        highlights = highlights,
        open_mapping = [[<leader>y]],
      })
    end,
  },

  {
    'ryanmsnyder/toggleterm-manager.nvim',
    dependencies = {
      'akinsho/nvim-toggleterm.lua',
      'nvim-telescope/telescope.nvim',
      'nvim-lua/plenary.nvim',
    },
    config = true,
  },
}
