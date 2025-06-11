return {
  'hat0uma/csvview.nvim',
  cmd = { 'CsvViewEnable', 'CsvViewToggle' },
  config = function()
    require('csvview').setup {
      view = {
        --- The display method of the delimiter
        --- "highlight" highlights the delimiter
        --- "border" displays the delimiter with `│`
        --- see `Features` section of the README.
        ---@type "highlight" | "border"
        display_mode = 'border',
      },
    }
  end,
}
