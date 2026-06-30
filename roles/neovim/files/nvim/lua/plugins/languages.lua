return {
  -- {
  --   'github/copilot.vim',
  -- },

  {
    'nvim-treesitter/nvim-treesitter',
    branch = 'main',
    build = ':TSUpdate',
    lazy = false,
    config = function()
      require('nvim-treesitter').install({
        'astro', 'bash', 'c', 'comment', 'cpp', 'css', 'diff', 'dockerfile',
        'eex', 'elixir', 'erlang', 'git_rebase', 'gitcommit', 'gitignore',
        'go', 'gomod', 'gosum', 'graphql', 'heex', 'html', 'javascript',
        'jsdoc', 'json', 'lua', 'luadoc', 'luap', 'make', 'markdown',
        'markdown_inline', 'mermaid', 'nix', 'php', 'php_only', 'python',
        'query', 'regex', 'ruby', 'rust', 'scss', 'solidity', 'sql',
        'svelte', 'toml', 'tsx', 'typescript', 'typst', 'vim', 'vimdoc',
        'yaml',
      })

      local function start_treesitter(buf)
        local lang = vim.treesitter.language.get_lang(vim.bo[buf].filetype)
        if lang and pcall(vim.treesitter.start, buf, lang) then
          vim.bo[buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
        end
      end

      vim.api.nvim_create_autocmd('FileType', {
        callback = function(args) start_treesitter(args.buf) end,
      })

      for _, buf in ipairs(vim.api.nvim_list_bufs()) do
        if vim.api.nvim_buf_is_loaded(buf) and vim.bo[buf].filetype ~= '' then
          start_treesitter(buf)
        end
      end
    end,
  },

  {
    'nvim-treesitter/nvim-treesitter-textobjects',
    branch = 'main',
    dependencies = { 'nvim-treesitter/nvim-treesitter' },
  },
  {
    'nvim-treesitter/nvim-treesitter-context',
    config = function()
      require('treesitter-context').setup({
        enable = false,
      })
    end,
  },

  {
    'sustech-data/wildfire.nvim',
    event = 'VeryLazy',
    dependencies = { 'nvim-treesitter/nvim-treesitter' },
    config = function()
      require('wildfire').setup()
    end,
  },

  {
    'mrcjkb/rustaceanvim',
    version = '^6', -- Recommended
    lazy = false, -- This plugin is already lazy
  },

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
  {
    'kaarmu/typst.vim',
    ft = 'typst',
    lazy = false,
  },
}
