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
          openai_fim_compatible = {
            api_key = 'TERM',
            name = 'Ollama',
            end_point = 'http://localhost:11434/v1/completions',
            model = 'qwen2.5-coder:7b',
            optional = {
              max_tokens = 56,
              top_p = 0.9,
            },
          },
        },
      }
    end,
  },
  { 'nvim-lua/plenary.nvim' },
  { 'hrsh7th/nvim-cmp' },
}
