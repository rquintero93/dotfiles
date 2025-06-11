-- NOTE: Plugins can also be configured to run Lua code when they are loaded.
--
-- This is often very useful to both group configuration, as well as handle
-- lazy loading plugins that don't need to be loaded immediately at startup.
--
-- For example, in the following configuration, we use:
--  event = 'VimEnter'
--
-- which loads which-key before all the UI elements are loaded. Events can be
-- normal autocommands events (`:help autocmd-events`).
--
-- Then, because we use the `opts` key (recommended), the configuration runs
-- after the plugin has been loaded as `require(MODULE).setup(opts)`.

return {
  { -- Useful plugin to show you pending keybinds.
    'folke/which-key.nvim',
    event = 'VeryLazy', -- Sets the loading event to 'VimEnter'
    opts = {
      -- delay between pressing a key and opening which-key (milliseconds)
      -- this setting is independent of vim.opt.timeoutlen
      delay = 0,
      icons = {
        -- set icon mappings to true if you have a Nerd Font
        mappings = vim.g.have_nerd_font,
        -- If you are using a Nerd Font: set icons.keys to an empty table which will use the
        -- default which-key.nvim defined Nerd Font icons, otherwise define a string table
        keys = vim.g.have_nerd_font and {} or {
          Up = '<Up> ',
          Down = '<Down> ',
          Left = '<Left> ',
          Right = '<Right> ',
          C = '<C-…> ',
          M = '<M-…> ',
          D = '<D-…> ',
          S = '<S-…> ',
          CR = '<CR> ',
          Esc = '<Esc> ',
          ScrollWheelDown = '<ScrollWheelDown> ',
          ScrollWheelUp = '<ScrollWheelUp> ',
          NL = '<NL> ',
          BS = '<BS> ',
          Space = '<Space> ',
          Tab = '<Tab> ',
          F1 = '<F1>',
          F2 = '<F2>',
          F3 = '<F3>',
          F4 = '<F4>',
          F5 = '<F5>',
          F6 = '<F6>',
          F7 = '<F7>',
          F8 = '<F8>',
          F9 = '<F9>',
          F10 = '<F10>',
          F11 = '<F11>',
          F12 = '<F12>',
        },
      },

      -- Document existing key chains
      spec = {
        { '<leader>c', group = '[C]hat', mode = { 'n', 'x' } },
        { '<leader>d', group = '[D]atabase' },
        { '<leader>b', group = 'de[B]ugger' },
        { '<leader>r', group = '[R]EPL' },
        { '<leader>ri', group = '[R]EPL [I]nterrupt' },
        { '<leader>rc', group = '[R]EPL [C]lear' },
        { '<leader>rs', group = '[R]EPL [S]end' },
        { '<leader>rsf', group = '[R]EPL [S]end [F]ile' },
        { '<leader>rsl', group = '[R]EPL [S]end [L]ine' },
        { '<leader>rss', group = '[R]EPL [S]end [S]election', mode = { 'v' } },
        { '<leader>l', group = '[L]SP' },
        { '<leader>lg', group = '[L]SP [G]lance' },
        { '<leader>w', group = '[W]indows & Tabs' },
        { '<leader>ws', group = '[S]plits' },
        { '<leader>wt', group = '[T]abs ' },
        { '<leader>v', group = '[V]isidata' },
        { '<leader>g', group = '[G]it' },
        { '<leader>f', group = '[F]ind' },
        { '<leader>t', group = '[T]erminal' },
        { '<leader>T', group = '[T]rouble' },
        { '<leader>u', group = '[U]ndo tree' },
        { '<leader>j', group = '[J]upyter' },
        -- { '<leader>h', group = 'Git [H]unk', mode = { 'n', 'v' } },
      },
    },
  },
}
-- vim: ts=2 sts=2 sw=2 et
