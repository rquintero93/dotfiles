return {
  'folke/snacks.nvim',
  priority = 1000,
  lazy = false,
  ---@type snacks.Config
  ---@class snacks.dashboard.Config
  ---@field enabled? boolean
  ---@field sections snacks.dashboard.Section
  ---@field formats table<string, snacks.dashboard.Text|fun(item:snacks.dashboard.Item, ctx:snacks.dashboard.Format.ctx):snacks.dashboard.Text>
  ---@class snacks.notifier.Config
  ---@field enabled? boolean
  ---@field win? snacks.win.Config scratch window
  ---@field template? string template for new buffers
  ---@class snacks.scratch.Config
  ---@field keep? fun(notif: snacks.notifier.Notif): boolean # global keep function
  ---@class snacks.lazygit.Config: snacks.terminal.Opts
  ---@field args? string[]
  ---@field theme? snacks.lazygit.Theme
  opts = {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
    bigfile = {},
    scroll = {
      animate = {
        duration = { step = 10, total = 100 },
        easing = 'linear',
      },
      -- faster animation when repeating scroll after delay
      animate_repeat = {
        delay = 50, -- delay in ms before using the repeat animation
        duration = { step = 5, total = 50 },
        easing = 'linear',
      },
    },
    -- lazygit = {},
    animate = {},
    image = {},
    dashboard = {
      width = 95,
      row = 2, -- dashboard position. nil for center
      col = nil, -- dashboard position. nil for center
      pane_gap = 4, -- empty columns between vertical panes
      autokeys = '1234567890abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ', -- autokey sequence
      -- These settings are used by some built-in sections
      preset = {
        -- Defaults to a picker that supports `fzf-lua`, `telescope.nvim` and `mini.pick`
        ---@type fun(cmd:string, opts:table)|nil
        pick = nil,
        -- Used by the `keys` section to show keymaps.
        -- Set your custom keymaps here.
        -- When using a function, the `items` argument are the default keymaps.
        ---@type snacks.dashboard.Item[]
        keys = {
          { icon = ' ', key = 'f', desc = 'Find File', action = ":lua Snacks.dashboard.pick('files')" },
          { icon = ' ', key = 'n', desc = 'New File', action = ':ene | startinsert' },
          { icon = ' ', key = 'g', desc = 'Find Text', action = ":lua Snacks.dashboard.pick('live_grep')" },
          { icon = ' ', key = 'r', desc = 'Recent Files', action = ":lua Snacks.dashboard.pick('oldfiles')" },
          { icon = ' ', key = 'c', desc = 'Config', action = ":lua Snacks.dashboard.pick('files', {cwd = vim.fn.stdpath('config')})" },
          { icon = '󱞊 ', key = 'e', desc = 'Explore Files', action = ':Yazi' },
          { icon = '󰒲 ', key = 'L', desc = 'Lazy', action = ':Lazy', enabled = package.loaded.lazy ~= nil },
          { icon = ' ', key = 'q', desc = 'Quit', action = ':qa' },
        },
        -- Used by the `header` section
        header = [[

XNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNXXXXXXXXXXXXXXXXXXXXXXXKKKKKKKKKKKKKKKKKKK00KKK0
WWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWXNNWMWWMWMWWWNNNWNWWWWWWWWWWWWWWWWWWWNNWWWX
WWWWWWWWWWWWWWWWWWWWWWWWWWWNNWWWXO0XOlloOkXNWWWWWNXXXK0KXWWWWWWWWWWWWWWWWWWWWWWX
WWWWWWWWWWWWWWWWWWWWWWWWWWWXKK0kcdO:,;:cldkOXXOklk0KlooxOKNWWWWWWWWWWWWWWWWWNNWX
WWWWWWWWWWWWWWWWWNXX0KOOXk0xcdxxlc,',;;;;clodol;,c;;:cdxlo0XWWWNWWWWWWWWWWWWNNWX
WWWWWWWWWWWWWWX00dXocl:co;cl:cool;;'',,,,,;:::;;,'..,odl,lx0OkkONWWWWWWWWWWNNNWX
WWWWWNNWWWNNNXOK0ll:,,,,;';,;c,:,....'.',,,,;,,''...';;:;cloodxxOKNWWWWWWWNNNNWX
WWWWNNNWNXKKX0dddc,''..'....,;,'...........''.''....''',',;clllxdk0WWWNXKNNNNNWX
WWWWWNWNKxolll:;,''....'....'...............'.''..',',.''';:;:loxdkNNWWNXXNNNNWN
WWWWNNNNKOo::;;cc;'.','...''................''.....''''.;l,,';ccdlxOkXWNXXNNNNWN
WWWXXNWWNX0dxxc.;:'...... .'........................',''';..'.,',':oxk00kNNNNNWN
WWWNNXWNXkxOllc,......... .........'....................''.....',:clxkxxO0XNNNWN
WWWWNNWWN0xc,,,;; ..''....,;,'....''.......,',,...'..............,;;::;;d0NNNNWN
WWWWNWNNXOooc,''...'........................... .................'.',;codkKNNNWN
WWWXXK0Oxo:,,;;;;::::;,'..'''''...',,...........   ................;::dkxok0NNNN
WWWN0Okdllc::::::lc::::....,::,,,;:cddollc:cc:;....... . .........';;;ll:;;lkXWN
WWW0ko:,,;;;::;,,cc:cc;,,..:c:;clcox0XXNXXKK00kc.....'..... .,.....'...',:o0KXNN
WNKko,.';c,;;;,,:::,;,....';,.cddk0XXNWWWXxoc;'......'...........,..'':,,dO0KKNN
WNK00dc:ld',::;;;,;',''''''..........;ool' ..,;'.    ..'.''.........',;clodkKKNN
WNNXOdko;;,,,',,,';',::c:;,'',,','';;'.;...,d..'.'..  .''.............',cox0O0NN
NNNNXkxc::;......',,;;,;'..,;dcldldxx,XMK ;kOkdocxd'' ................',:ldxONNN
NNXXXOOxc:'';..,'...',',. .lcdxxxolc;OWWK,.cloolll::;  .'.'...........';,;oxxXNW
NNNXK0OxOc,,:;,'''.'',''...lXX0000KXNWWWXc;XNNNNNX0x; .................',,dxdkNW
NXNXX00Ol;'.,;..,;,.,,,... ;0WWWWMMWNKNXxc'lWMWWWNX0:  ...........''..,lxkOkdxKW
NXNKXNKxo;''''',';,.',...  .kXWWWWWWXdll'  ;XNWWNKkl.  ..........;:::;cok0000KNW
XXXXXKKoolcc:;,'.'''.....   ck0NXOd;...',   .,:O0o;.   ..........,::clok0OKNNNNW
XXXXKOdoxddoc;............  .;cOl',:dxxddoc,'..ld'.   .........'..,:oox00KXXXXNW
XXXXOook0OOOx:........'....  .'cckNXk:...,ok00l:'.    ...........';:loO0KKXXXXNW
XXXX0kkXXXKkxl;c;'...''.....  ...c0XKkl:,'lxxl.      ......''.....;:cokKKXXXXXNW
XXXX0KX00XX0kOOo;;,'''.......    .',;;:;,....       ......''''...',;:ck0KXXXXXXW
XKXXXKKxo0XXKK0lc,'...'.'',''.       .            .........''',',;clc;KXXXXXXXXW
KKXXXXXOdKKKKXk;c'..','''',''''.                ......'''..',::d0k0X0KXXXXXXXXXW
KKXXXXXXXXXKK0O::,;;::;,,'''',;,,'...  ...   ..'';,,'.'''',;:0KldxxXXXXXXXXXXXXW
K0KXXXXXXXXXXKX0kdxdlc:;,,,''',;:;;,;'..'';,',cddx::;;;;:dol:ccdKXXXXXXXXXXXXXXN
K0KXXXXXXXXXXKKK00K0d;,c:lo,'',;::::,;,,:looodxOOoc:;;:dkO0oxOOK00KXXXXXXXXXKXXN
K0KKXXXXXXXXXXXXKXKKOOkK00kc;l;lOOdc;,;:lodddl:cclcc;c::ldKXKK0KXKXXXXXXXKXKKKXN
K0KKXXXKKKXXXXXXXXXXXXXKXXKXXOdKKOk:;,';:lolooc::cdKXXKXXXXXXXX0OK0KXXXKKKKKKKXN
K0KKKKKKKKKKKKKKXXXXXXXXXXXKXXOkOO0K0;''';c:cc;;lOXXXXXXXXXXXXX0XKKXKKKKKKKKKKXN
K0KKKKKKKKKKKKKKKKXXXXXXXXXXXXKKXXKXXKXkOdcOd:::0XXXXXXXXXXXXXXXXKKKKKKKKKKKKKXN
K0KKKKKKKKKKKKKXKKXXXKXXXXXXXXXXXXXXXXXXKXXX0dXXXXXXXXXXXXXXXXKKKKKKKKKKKKKKKKXN

 ██████╗  ██████╗     ███╗   ██╗██╗   ██╗██╗███╗   ███╗
 ██╔══██╗██╔═══██╗    ████╗  ██║██║   ██║██║████╗ ████║
 ██████╔╝██║   ██║    ██╔██╗ ██║██║   ██║██║██╔████╔██║
 ██╔══██╗██║▄▄ ██║    ██║╚██╗██║╚██╗ ██╔╝██║██║╚██╔╝██║
 ██║  ██║╚██████╔╝    ██║ ╚████║ ╚████╔╝ ██║██║ ╚═╝ ██║
 ╚═╝  ╚═╝ ╚══▀▀═╝     ╚═╝  ╚═══╝  ╚═══╝  ╚═╝╚═╝     ╚═╝
                            ]],
      },
      -- item field formatters
      -- formats = {
      --   icon = function(item)
      --     if item.file and item.icon == 'file' or item.icon == 'directory' then
      --       return M.icon(item.file, item.icon)
      --     end
      --     return { item.icon, width = 2, hl = 'icon' }
      --   end,
      --   footer = { '%s', align = 'center' },
      --   header = { '%s', align = 'center' },
      --   file = function(item, ctx)
      --     local fname = vim.fn.fnamemodify(item.file, ':~')
      --     fname = ctx.width and #fname > ctx.width and vim.fn.pathshorten(fname) or fname
      --     if #fname > ctx.width then
      --       local dir = vim.fn.fnamemodify(fname, ':h')
      --       local file = vim.fn.fnamemodify(fname, ':t')
      --       if dir and file then
      --         file = file:sub(-(ctx.width - #dir - 2))
      --         fname = dir .. '/…' .. file
      --       end
      --     end
      --     local dir, file = fname:match '^(.*)/(.+)$'
      --     return dir and { { dir .. '/', hl = 'dir' }, { file, hl = 'file' } } or { { fname, hl = 'file' } }
      --   end,
      -- },
      sections = {
        { section = 'header', padding = 3 },
        {
          pane = 2,
          { section = 'keys', gap = 2, padding = 3 },
          { icon = ' ', title = 'Recent Files', section = 'recent_files', gap = 1, indent = 1, padding = 1 },
          { icon = ' ', title = 'Projects', section = 'projects', gap = 1, indent = 1, padding = 1 },
          { section = 'startup', gap = 1, padding = 2 },
        },
      },
    },
    notifier = {
      timeout = 2000, -- default timeout in ms
      width = { min = 40, max = 0.4 },
      height = { min = 1, max = 0.6 },
      -- editor margin to keep free. tabline and statusline are taken into account automatically
      margin = { top = 0, right = 1, bottom = 0 },
      padding = true, -- add 1 cell of left/right padding to the notification window
      sort = { 'level', 'added' }, -- sort by level and time
      -- minimum log level to display. TRACE is the lowest
      -- all notifications are stored in history
      level = vim.log.levels.TRACE,
      icons = {
        error = ' ',
        warn = ' ',
        info = ' ',
        debug = ' ',
        trace = ' ',
      },
      keep = function(notif)
        return vim.fn.getcmdpos() > 0
      end,
      ---@type snacks.notifier.style
      style = 'fancy',
      top_down = true, -- place notifications from top to bottom
      date_format = '%R', -- time format for notifications
      -- format for footer when more lines are available
      -- `%d` is replaced with the number of lines.
      -- only works for styles with a border
      ---@type string|boolean
      more_format = ' ↓ %d lines ',
      refresh = 50, -- refresh at most every 50ms
    },
    -- statuscolumn = { enabled = true },
    scratch = {
      enabled = true,
    },
    quickfile = {},
  },
  keys = {
    {
      '<leader>z',
      function()
        Snacks.zen()
      end,
      desc = 'Toggle Zen Mode',
    },
    {
      '<leader>Z',
      function()
        Snacks.zen.zoom()
      end,
      desc = 'Toggle Zoom',
    },
    {
      '<leader>.',
      function()
        Snacks.scratch()
      end,
      desc = 'Toggle Scratch Buffer',
    },
    -- {
    --   '<leader>S',
    --   function()
    --     Snacks.scratch.select()
    --   end,
    --   desc = 'Select Scratch Buffer',
    -- },
    {
      '<leader>N',
      function()
        Snacks.notifier.show_history()
      end,
      desc = 'Notification History',
    },
    -- {
    --   '<leader>un',
    --   function()
    --     Snacks.notifier.hide()
    --   end,
    --   desc = 'Dismiss All Notifications',
    -- },
  },
}
