return {
  'catppuccin/nvim',
  name = 'catppuccin',
  priority = 1000,

  config = function()
    require('catppuccin').setup {
      flavour = 'auto', -- latte, frappe, macchiato, mocha
      background = { -- :h background
        light = 'latte',
        dark = 'mocha',
      },
      transparent_background = true, -- disables setting the background color.
      show_end_of_buffer = false, -- shows the '~' characters after the end of buffers
      term_colors = true, -- sets terminal colors (e.g. `g:terminal_color_0`)
      dim_inactive = {
        enabled = true, -- dims the background color of inactive window
        shade = 'dark',
        percentage = 0.15, -- percentage of the shade to apply to the inactive window
      },
      no_italic = false, -- Force no italic
      no_bold = false, -- Force no bold
      no_underline = false, -- Force no underline
      styles = { -- Handles the styles of general hi groups (see `:h highlight-args`):
        comments = { 'italic' }, -- Change the style of comments
        conditionals = { 'italic' },
        loops = {},
        functions = {},
        keywords = {},
        strings = {},
        variables = {},
        numbers = {},
        booleans = {},
        properties = {},
        types = {},
        operators = {},
        -- miscs = {}, -- Uncomment to turn off hard-coded styles
      },
      color_overrides = {},
      custom_highlights = {},
      default_integrations = true,
      integrations = {
        cmp = true,
        gitsigns = true,
        fidget = true,
        flash = true,
        indent_blankline = {
          enabled = true,
          scope_color = 'blue',
          colored_indent_levels = false,
        },
        lsp_saga = true,
        mason = true,
        neotest = true,
        noice = true,
        notifier = true,
        notify = true,
        copilot_vim = true,
        native_lsp = {
          enabled = true,
          virtual_text = {
            errors = { 'italic' },
            hints = { 'italic' },
            warnings = { 'italic' },
            information = { 'italic' },
            ok = { 'italic' },
          },
          underlines = {
            errors = { 'underline' },
            hints = { 'underline' },
            warnings = { 'underline' },
            information = { 'underline' },
            ok = { 'underline' },
          },
          inlay_hints = {
            background = true,
          },
        },
        nvim_surround = true,
        ts_rainbow2 = true,
        ts_rainbow = true,
        rainbow_delimiters = true,
        render_markdown = true,
        snacks = {
          enabled = true,
          indent_scope_color = 'blue',
        },
        telescope = {
          enabled = true,
        },
        lsp_trouble = true,
        dadbod_ui = true,
        which_key = true,
        nvimtree = true,
        treesitter = true,
        beacon = true,
        semantic_tokens = true,
        treesitter_context = true,
        markdown = true,
        symbols_outline = true,
        fzf = true,
        dap = true,
        dap_ui = true,
        mini = {
          enabled = true,
          indentscope_color = 'blue',
        },
      },
    }

    vim.cmd.colorscheme 'catppuccin'
  end,
}
