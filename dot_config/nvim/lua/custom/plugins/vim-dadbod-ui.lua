return {
  'kristijanhusak/vim-dadbod-ui',
  dependencies = {
    { 'tpope/vim-dadbod', lazy = true },
    { 'kristijanhusak/vim-dadbod-completion', ft = { 'sql', 'mysql', 'plsql', 'bqsql' }, lazy = true }, -- Optional
  },
  -- event = 'VeryLazy',
  cmd = {
    'DBUI',
    'DBUIToggle',
    'DBUIAddConnection',
    'DBUIFindBuffer',
  },
  init = function()
    -- Your DBUI configuration
    vim.g.db_ui_use_nerd_fonts = 1
    -- vim.g.db_ui_default_query = 'SELECT * FROM "{table}"'
    vim.g.db_ui_save_location = '~/Documents/Global Alumni/queries/'
    vim.g.db_ui_auto_execute_table_helpers = 1
    vim.g.db_ui_show_database_icon = true
    vim.g.db_ui_use_nerd_fonts = true
    vim.g.db_ui_use_nvim_notify = false
    vim.g.db_ui_execute_on_save = false
  end,
}
