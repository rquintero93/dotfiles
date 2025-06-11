return {
  'rcarriga/nvim-dap-ui',
  dependencies = { 'nvim-neotest/nvim-nio', { 'theHamsta/nvim-dap-virtual-text', opts = {} } },
  -- stylua: ignore
  keys = {
    { "<leader>bu", function() require("dapui").toggle({ }) end, desc = "de[B]ugger [U]I" },
    -- { "<leader>de", function() require("dapui").eval() end, desc = "Eval", mode = {"n", "v"} },
  },
  opts = {},
  config = function(_, opts)
    local dap = require 'dap'
    local dapui = require 'dapui'
    dapui.setup(opts)
    dap.listeners.after.event_initialized['dapui_config'] = function()
      dapui.open {}
    end
    dap.listeners.before.event_terminated['dapui_config'] = function()
      dapui.close {}
    end
    dap.listeners.before.event_exited['dapui_config'] = function()
      dapui.close {}
    end
    dap.listeners.before.attach.dapui_config = function()
      dapui.open()
    end
    dap.listeners.before.launch.dapui_config = function()
      dapui.open()
    end
  end,
}
