return {

  {
    'nvimdev/lspsaga.nvim',
    event = 'LspAttach',
    config = function()
      require('lspsaga').setup {
        callhierarchy = {
          enable = false,
        },
        definition = {
          enable = false,
        },
        diagnostic = {
          enable = false,
        },
        finder = {
          enable = false,
        },
        term_toggle = {
          enable = false,
        },
        implement = {
          enable = false,
        },
        lightbulb = {
          enable = true,
          virtual_text = false,
        },
        rename = {
          enable = false,
        },
        ui = {
          code_action = '',
        },
      }
    end,
    dependencies = {
      'nvim-treesitter/nvim-treesitter', -- optional
      'nvim-tree/nvim-web-devicons', -- optional
    },
  },
}
