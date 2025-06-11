return {
  'anuvyklack/windows.nvim',
  dependencies = {
    'anuvyklack/middleclass',
    'anuvyklack/animation.nvim',
  },
  event = 'VeryLazy',
  config = function()
    vim.o.winwidth = 10
    vim.o.winminwidth = 10
    vim.o.equalalways = false
    require('windows').setup {
      autowidth = { --		       |windows.autowidth|
        enable = true,
        winwidth = 5, --		        |windows.winwidth|
        filetype = { --	      |windows.autowidth.filetype|
          help = 2,
        },
      },
      ignore = { --			  |windows.ignore|
        buftype = { 'quickfix' },
        filetype = { 'NvimTree', 'neo-tree', 'undotree', 'gundo', 'snacks_dashboard' },
      },
      animation = {
        enable = true,
        duration = 300,
        fps = 30,
        easing = 'in_out_sine',
      },
    }
  end,
}
