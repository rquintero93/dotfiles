return {
  {
    'danymat/neogen',
    event = { 'LspAttach' },
    config = function()
      require('neogen').setup {
        enabled = true,
        languages = {

          python = {

            template = { annotation_convention = 'google_docstrings' },
          },
        },
      }
    end,
    -- Uncomment next line if you want to follow only stable versions
    -- version = "*"
  },
}
