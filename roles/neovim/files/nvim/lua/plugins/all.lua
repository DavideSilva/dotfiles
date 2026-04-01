return {
  { 'dstein64/vim-startuptime' },

  { 'catppuccin/nvim', name = 'catppuccin', priority = 1000 },
  {
    'folke/tokyonight.nvim',
    lazy = false,
    priority = 1000,
    opts = {},
  },

  { 'rose-pine/neovim', name = 'rose-pine', priority = 1000 },

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
    event = 'ColorScheme',
    config = function()
      require('lualine').setup({
        options = {
          theme = 'rose-pine',
          show_filename_only = false,
          ignore_focus = { 'TelescopePrompt', 'NvimTree', 'TelescopeResults' },
        },
      })
    end,
  },

  {
    'nvim-telescope/telescope.nvim',
    dependencies = {
      'nvim-lua/popup.nvim',
      'nvim-lua/plenary.nvim',
      { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
      'nvim-telescope/telescope-live-grep-args.nvim',
    },
  },


  { 'tpope/vim-projectionist' },

  { 'neovim/nvim-lspconfig' },
  { 'williamboman/mason.nvim' },
  { 'williamboman/mason-lspconfig.nvim' },
  { 'chrisgrieser/nvim-lsp-endhints', event = 'LspAttach', opts = {} },
  {
    'glepnir/lspsaga.nvim',
    config = function()
      require('lspsaga').setup({
        code_action_prompt = {
          sign = false,
        },
        lightbulb = {
          virtual_text = false,
        },
      })
    end,
  },
  { 'onsails/lspkind-nvim' },


  {
    'echasnovski/mini.nvim',
    config = function()
      require('mini.surround').setup()
      require('mini.files').setup()
    end,
  },

  {
    'ellisonleao/glow.nvim',
    config = function()
      require('glow').setup()
    end,
  },

  {
    'stevearc/conform.nvim',
    opts = {
      notify_on_error = false,
      format_on_save = {
        timeout_ms = 500,
        lsp_fallback = true,
      },
      formatters_by_ft = {
        css = { 'prettierd', 'prettier', stop_after_first = true },
        go = { 'gofmt' },
        html = { 'prettierd', 'prettier', stop_after_first = true },
        javascript = { 'prettierd', 'prettier', stop_after_first = true },
        json = { 'prettierd', 'prettier', stop_after_first = true },
        lua = { 'stylua' },
        markdown = { 'prettierd', 'prettier', stop_after_first = true },
        nix = { 'nixfmt' },
        solidity = { 'forge_fmt' },
        svelte = { 'prettierd', 'prettier', stop_after_first = true },
        typescript = { 'prettierd', 'prettier', stop_after_first = true },
        typescriptreact = { 'prettierd', 'prettier', stop_after_first = true },
      },
    },
  },

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
    'folke/todo-comments.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' },
  },

  {
    'j-hui/fidget.nvim',
    dependencies = { 'neovim/nvim-lspconfig' },
    config = function()
      require('fidget').setup()
    end,
  },

  { 'jannis-baum/vivify.vim' },
}
