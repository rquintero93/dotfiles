return {
  'GCBallesteros/NotebookNavigator.nvim',
  ft = { 'python', 'r', 'julia' },
  keys = {
    {
      ']h',
      function()
        require('notebook-navigator').move_cell 'd'
      end,
    },
    {
      '[h',
      function()
        require('notebook-navigator').move_cell 'u'
      end,
    },
    { '<leader>jr', "<cmd>lua require('notebook-navigator').run_cell()<cr>", { desc = '[J]upyter [R]un cell' } },
    { '<leader>jj', "<cmd>lua require('notebook-navigator').run_and_move()<cr>", { desc = '[J]upyter run and [J]ump' } },
  },
  dependencies = {
    'echasnovski/mini.comment',
    'hkupty/iron.nvim', -- repl provider
    'nvimtools/hydra.nvim',
  },
  -- event = { 'BufReadPre', 'BufNewFile' },
  config = function()
    local nn = require 'notebook-navigator'
    nn.setup { activate_hydra_keys = '<leader>jn' }
  end,
}
