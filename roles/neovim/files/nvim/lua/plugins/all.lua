return {
  { 'dstein64/vim-startuptime' },

  { 'rose-pine/neovim', name = 'rose-pine', priority = 1000 },

  { 'christoomey/vim-tmux-navigator' },

  {
    'nvim-tree/nvim-tree.lua',
    dependencies = {
      'nvim-tree/nvim-web-devicons',
    },
  },

  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    event = 'ColorScheme',
    config = function()
      require('lualine').setup({
        options = {
          theme = 'rose-pine',
          ignore_focus = { 'TelescopePrompt', 'NvimTree', 'TelescopeResults' },
        },
      })
    end,
  },

  {
    'nvim-telescope/telescope.nvim',
    dependencies = {
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
    'lewis6991/gitsigns.nvim',
    opts = {
      on_attach = function(bufnr)
        local gs = require('gitsigns')
        local function map(lhs, rhs, mode)
          vim.keymap.set(mode or 'n', lhs, rhs, { buffer = bufnr, silent = true })
        end

        map(']c', function() gs.nav_hunk('next') end)
        map('[c', function() gs.nav_hunk('prev') end)
        map('<leader>hs', gs.stage_hunk)
        map('<leader>hr', gs.reset_hunk)
        map('<leader>hp', gs.preview_hunk)
        map('<leader>hb', function() gs.blame_line({ full = true }) end)
        map('ih', gs.select_hunk, { 'o', 'x' })
      end,
    },
  },

  {
    'echasnovski/mini.nvim',
    config = function()
      require('mini.surround').setup()
      require('mini.files').setup()
    end,
  },

  {
    'MeanderingProgrammer/render-markdown.nvim',
    dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' },
    ft = { 'markdown' },
    opts = {},
  },

  {
    'stevearc/conform.nvim',
    opts = {
      notify_on_error = false,
      format_on_save = {
        timeout_ms = 500,
        lsp_format = 'fallback',
      },
      formatters_by_ft = {
        css = { 'prettierd', 'prettier', stop_after_first = true },
        go = { 'goimports', 'gofumpt' },
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
    opts = {},
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
