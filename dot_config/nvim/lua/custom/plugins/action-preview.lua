return {
  'aznhe21/actions-preview.nvim',
  event = 'LspAttach',
  config = function()
    vim.keymap.set({ 'v', 'n' }, '<leader>la', require('actions-preview').code_actions, { desc = '[L]sp [A]ction', noremap = true, silent = true })
  end,
}
