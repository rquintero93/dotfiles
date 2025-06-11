return {
  'folke/trouble.nvim',
  opts = {}, -- for default options, refer to the configuration section for custom setup.
  cmd = 'Trouble',
  keys = {
    {
      '<leader>Tt',
      '<cmd>Trouble diagnostics toggle<cr>',
      desc = '[T]rouble [T]oggle',
    },
    {
      '<leader>TT',
      '<cmd>Trouble diagnostics toggle filter.buf=0<cr>',
      desc = '[T]rouble [T]oggle (buffer)',
    },
    {
      '<leader>Ts',
      '<cmd>Trouble symbols toggle focus=false<cr>',
      desc = '[T]rouble [S]ymbols',
    },
    {
      '<leader>Tl',
      '<cmd>Trouble lsp toggle focus=false win.position=right<cr>',
      desc = '[T]rouble [L]SP',
    },
    {
      '<leader>TL',
      '<cmd>Trouble loclist toggle<cr>',
      desc = '[T]rouble [L]oclist',
    },
    {
      '<leader>TQ',
      '<cmd>Trouble qflist toggle<cr>',
      desc = '[T]rouble [Q]uickfix',
    },
  },
}
