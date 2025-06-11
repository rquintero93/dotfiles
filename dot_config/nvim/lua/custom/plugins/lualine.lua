return {
  'nvim-lualine/lualine.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  event = { 'BufReadPre', 'BufNewFile' },

  config = function()
    local colors = {
      blue = '#89b4fa',
      cyan = '#74c7ec',
      black = '#1e1e2e',
      white = '#cdd6f4',
      red = '#f38ba8',
      violet = '#cba6f7',
      lavender = '#b4befe',
      grey = '#313244',
      green = '#a6e3a1',
    }

    local bubbles_theme = {
      normal = {
        a = { fg = colors.black, bg = colors.blue },
        b = { fg = colors.white, bg = colors.grey },
        c = { fg = colors.white },
      },

      insert = { a = { fg = colors.black, bg = colors.green } },
      visual = { a = { fg = colors.black, bg = colors.violet } },
      replace = { a = { fg = colors.black, bg = colors.violet } },
      command = { a = { fg = colors.black, bg = colors.red } },

      inactive = {
        a = { fg = colors.white, bg = colors.black },
        b = { fg = colors.white, bg = colors.black },
        c = { fg = colors.white },
      },
    }

    require('lualine').setup {
      options = {
        theme = bubbles_theme,
        component_separators = '',
        section_separators = { left = '', right = '' },
        disable_filetype = { winbar = {}, statusline = { 'snacks_dashboard' } },
        ignore_focus = {},
        always_divide_middle = true,
        always_show_tabline = true,
        globalstatus = true,
        refresh = {
          statusline = 100,
          tabline = 100,
          winbar = 100,
        },
      },
      sections = {
        lualine_a = {
          'mode',
          {
            'macro',
            fmt = function()
              local reg = vim.fn.reg_recording()
              if reg ~= '' then
                return 'Recording @' .. reg
              end
              return nil
            end,
            draw_empty = false,
          },
        },
        lualine_b = { 'branch', 'diff', 'diagnostics' },
        lualine_c = { 'filename' },
        lualine_x = { { require('action-hints').statusline }, 'filetype' },
        lualine_y = { 'progress' },
        lualine_z = {
          { 'location', separator = { right = '' } },
        },
      },
      inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { 'filename' },
        lualine_x = { 'location' },
        lualine_y = {},
        lualine_z = {},
      },
      tabline = {},
      winbar = {},
      inactive_winbar = {},
      extensions = { 'lazy', 'quickfix', 'toggleterm', 'trouble', 'fzf', 'mason', 'man', 'nvim-dap-ui' },
    }
  end,
}
