return {
  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    config = function()
      require('nvim-treesitter.configs').setup({
        ensure_installed = 'all',
        indent = { enable = true },
        highlight = { enable = true },
        incremental_selection = { enable = true },
        textobjects = { enable = true },
      })
    end,
  },

  { 'nvim-treesitter/nvim-treesitter-textobjects' },
  {
    'nvim-treesitter/nvim-treesitter-context',
    config = function()
      require('treesitter-context').setup({})
    end,
  },
  { 'gcmt/wildfire.vim' },

  { 'tomlion/vim-solidity' },
  { 'vyperlang/vim-vyper' },
  { 'slim-template/vim-slim' },
  { 'slime-lang/vim-slime-syntax' },
  { 'elixir-editors/vim-elixir' },
  {
    'rust-lang/rust.vim',
    ft = 'rust',
    config = function()
      vim.g.rustfmt_autosave = 1
    end,
  },
  { 'folke/neodev.nvim' },
  { 'vmchale/just-vim' },
  {
    'kaarmu/typst.vim',
    ft = 'typst',
    lazy = false,
  }
}
