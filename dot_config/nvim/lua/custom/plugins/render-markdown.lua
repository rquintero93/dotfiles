return {
  'MeanderingProgrammer/render-markdown.nvim',
  event = { 'BufReadPre', 'BufNewFile' },
  dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.nvim' }, -- if you use the mini.nvim suite

  ---@module 'render-markdown'
  ---@type render.md.UserConfig
  opts = {},

  config = function()
    require('render-markdown').setup {
      file_types = { 'markdown', 'copilot-chat', 'codecompanion' },
    }
  end,
}
