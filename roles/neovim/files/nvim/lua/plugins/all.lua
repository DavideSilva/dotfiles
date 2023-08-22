return {
  { 'dstein64/vim-startuptime' },

  { 'catppuccin/nvim',               name = 'catppuccin', priority = 1000 },
  { 'christoomey/vim-tmux-navigator' },

  {
    'nvim-tree/nvim-tree.lua',
    dependencies = {
      'nvim-tree/nvim-web-devicons',
    },
    config = function()
      require('nvim-tree').setup({})
    end,
  },

  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      require('lualine').setup({
        options = { theme = 'catppuccin' },
      })
    end,
  },

  {
    'nvim-telescope/telescope.nvim',
    dependencies = {
      'nvim-lua/popup.nvim',
      'nvim-lua/plenary.nvim',
      { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
    },
  },

  {
    'junegunn/fzf',
    config = function(plugin)
      vim.opt.rtp:append(plugin.dir .. '/usr/local/opt/fzf')
    end,
  },
  { 'junegunn/fzf.vim' },

  { 'tpope/vim-projectionist' },

  { 'neovim/nvim-lspconfig' },
  { 'williamboman/mason.nvim' },
  { 'williamboman/mason-lspconfig.nvim' },
  {
    'glepnir/lspsaga.nvim',
    config = function()
      require('lspsaga').setup({
        code_action_prompt = {
          sign = false,
        },
      })
    end,
  },
  { 'onsails/lspkind-nvim' },

  { 'hrsh7th/nvim-cmp' },
  { 'hrsh7th/cmp-nvim-lsp' },
  { 'hrsh7th/cmp-buffer' },
  { 'hrsh7th/cmp-path' },
  { 'hrsh7th/cmp-cmdline' },

  { 'L3MON4D3/LuaSnip' },
  { 'saadparwaiz1/cmp_luasnip' },

  { 'ggandor/lightspeed.nvim', dependencies = { 'tpope/vim-repeat' } },
  { 'tpope/vim-surround',      dependencies = { 'tpope/vim-repeat' } },

  {
    'ellisonleao/glow.nvim',
    config = function()
      require('glow').setup()
    end,
  },

  { 'jose-elias-alvarez/null-ls.nvim' },

  {
    'folke/trouble.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      require('trouble').setup({ auto_close = true })
    end,
  },

  -- replace with https://github.com/nvim-neotest/neotest
  { 'vim-test/vim-test' },

  {
    'numToStr/Comment.nvim',
    config = function()
      require('Comment').setup()
    end,
  },

  {
    'folke/todo-comments.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' },
  },

  {
    'j-hui/fidget.nvim',
    dependencies = { 'neovim/nvim-lspconfig' },
    tag = 'legacy',
    config = function()
      require('fidget').setup()
    end,
  },
}
