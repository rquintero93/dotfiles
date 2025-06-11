return {
  'hkupty/iron.nvim',
  -- event = 'VeryLazy',
  ft = { 'python' },
  config = function()
    local iron = require 'iron.core'

    iron.setup {
      config = {
        -- Whether a repl should be discarded or not
        scratch_repl = true,
        -- Your repl definitions come here
        repl_definition = {
          -- sh = {
          --   -- Can be a table or a function that
          --   -- returns a table (see below)
          --   command = { 'zsh' },
          -- },
          python = {
            command = { 'ipython', '--no-autoindent' },
            format = require('iron.fts.common').bracketed_paste_python,
          },
        },
        -- How the repl window will be displayed
        -- See below for more information
        -- repl_open_cmd = require("iron.view").bottom(40),
        repl_open_cmd = require('iron.view').split.vertical.botright '40%',
      },
      -- Iron doesn't set keymaps by default anymore.
      -- You can set them here or manually add keymaps to the functions in iron.core
      keymaps = {
        -- send_motion = '<space>rc',
        visual_send = '<space>rss',
        send_file = '<space>rsf',
        send_line = '<space>rsl',
        -- send_mark = '<space>rm',
        -- mark_motion = '<space>mc',
        -- mark_visual = '<space>mc',
        -- remove_mark = '<space>md',
        -- cr = '<space>r<cr>',
        interrupt = '<space>ri',
        -- exit = '<space>rq',
        clear = '<space>rc',
      },
      -- If the highlight is on, you can change how it looks
      -- For the available options, check nvim_set_hl
      highlight = {
        italic = true,
      },
      ignore_blank_lines = true, -- ignore blank lines when sending visual select lines
    }

    -- iron also has a list of commands, see :h iron-commands for all available commands
    vim.keymap.set('n', '<space>rb', '<cmd>IronRepl<cr>', { desc = '[R]EPL [B]egin' })
    vim.keymap.set('n', '<space>rr', '<cmd>IronRestart<cr>', { desc = '[R]EPL [R]estart' })
    vim.keymap.set('n', '<space>rh', '<cmd>IronHide<cr>', { desc = '[R]EPL [H]ide' })
    vim.keymap.set('n', '<space>rf', '<cmd>IronFocus<cr>', { desc = '[R]EPL [F]ocus' })
  end,
}
