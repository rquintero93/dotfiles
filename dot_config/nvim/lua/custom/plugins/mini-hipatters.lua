return {
  'echasnovski/mini.hipatterns',
  -- event = { 'BufReadPre', 'BufNewFile' },
  ft = { 'python', 'markdown' },
  dependencies = { 'GCBallesteros/NotebookNavigator.nvim' },
  opts = function()
    local nn = require 'notebook-navigator'

    local opts = { highlighters = { cells = nn.minihipatterns_spec } }
    return opts
  end,
}
