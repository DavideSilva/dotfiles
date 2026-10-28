return {
  'mfussenegger/nvim-dap',
  keys = {
    { '<F5>', function() require('dap').continue() end },
    { '<F10>', function() require('dap').step_over() end },
    { '<F11>', function() require('dap').step_into() end },
    { '<F12>', function() require('dap').step_out() end },
    { '<leader>b', function() require('dap').toggle_breakpoint() end },
    { '<leader>dr', function() require('dap').repl.toggle() end },
  },
  config = function()
    local dap = require('dap')

    dap.adapters.mix_task = {
      type = 'executable',
      command = vim.fn.stdpath('data') .. '/mason/bin/elixir-ls-debugger',
    }

    dap.configurations.elixir = {
      {
        type = 'mix_task',
        name = 'mix test',
        request = 'launch',
        task = 'test',
        taskArgs = { '--trace' },
        startApps = true,
        projectDir = '${workspaceFolder}',
        requireFiles = { 'test/**/test_helper.exs', 'test/**/*_test.exs' },
      },
      {
        type = 'mix_task',
        name = 'phx.server',
        request = 'launch',
        task = 'phx.server',
        projectDir = '${workspaceFolder}',
      },
    }
  end,
}
