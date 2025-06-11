return {
  'folke/edgy.nvim',
  event = 'VeryLazy',
  opts = {
    bottom = {
      -- toggleterm / lazyterm at the bottom with a height of 40% of the screen
      -- {
      --   ft = 'toggleterm',
      --   title = 'Terminal',
      --   size = { height = 0.4 },
      --   -- exclude floating windows
      --   filter = function(buf, win)
      --     return vim.api.nvim_win_get_config(win).relative == ''
      --   end,
      -- },
      'Trouble',
      { ft = 'qf', title = 'QuickFix' },
      {
        ft = 'help',
        size = { height = 20 },
        -- only show help buffers
        filter = function(buf)
          return vim.bo[buf].buftype == 'help'
        end,
      },
      { title = 'DB Query Result', ft = 'dbout', size = { height = 0.4 } },
    },
    -- left = {
    --   {
    --     title = 'Database',
    --     ft = 'dbui',
    --     pinned = false,
    --     width = 0.7,
    --     open = function()
    --       vim.cmd 'DBUI'
    --     end,
    --   },
    -- },

    animate = {
      enabled = true,
      fps = 100,
      cps = 500,
    },
  },
}
