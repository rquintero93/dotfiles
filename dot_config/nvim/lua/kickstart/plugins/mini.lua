return {
  { -- Collection of various small independent plugins/modules
    'echasnovski/mini.nvim',
    event = { 'BufReadPre', 'BufNewFile' },
    config = function()
      require('mini.ai').setup { n_lines = 500 }
      require('mini.operators').setup {}
      require('mini.bracketed').setup {}
      require('mini.bufremove').setup {}
      require('mini.icons').setup {}
      require('mini.indentscope').setup { symbol = '|' }
      require('mini.move').setup {}
      require('mini.surround').setup {}
      require('mini.comment').setup {}
    end,
    -- ... and there is more!
    --  Check out: https://github.com/echasnovski/mini.nvim
  },
}
-- vim: ts=2 sts=2 sw=2 et
