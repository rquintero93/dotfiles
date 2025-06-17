return {
  {
    'milanglacier/minuet-ai.nvim',
    event = 'InsertEnter',
    config = function()
      require('minuet').setup {
        provider = 'openai_fim_compatible',
        provider_options = {
          openai_fim_compatible = {
            api_key = 'TERM',
            name = 'Ollama',
            end_point = 'http://localhost:11434/v1/completions',
            model = 'qwen2.5-coder:latest',
            optional = {
              max_tokens = 256,
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
