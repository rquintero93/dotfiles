return {
  {
    'milanglacier/minuet-ai.nvim',
    event = 'InsertEnter',
    config = function()
      require('minuet').setup {
        provider_options = {
          codestral = {
            model = 'codestral-latest',
            api_key = 'CODESTRAL_API_KEY',
            optional = { max_tokens = 256, stop = { '\n\n' } },
          },
        },
      }
    end,
  },
  { 'nvim-lua/plenary.nvim' },
  { 'hrsh7th/nvim-cmp' },
}
