return {
  {
    "mfussenegger/nvim-dap",
    config = function ()
      local dap = require("dap")
      vim.keymap.set('n', '<leader>b', dap.toggle_breakpoint, { desc = 'Toggle Breakpoint' })
      vim.keymap.set('n', '<leader>cx', dap.continue, { desc = 'Continue' })
      vim.keymap.set('n', '<leader>cv', dap.step_into, { desc = 'Step Into' })
      vim.keymap.set('n', '<leader>cb', dap.step_over, { desc = 'Step Over' })

      require("dap.ext.vscode").load_launchjs()
    end
  },

  {
    "NicholasMata/nvim-dap-cs",
    dependencies = {
      "mfussenegger/nvim-dap"
    },
    config = function ()
      require("dap-cs").setup()
    end
  },

  {
    "rcarriga/nvim-dap-ui",
    dependencies = {
      "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio"
    },
    config = function ()
      local dapui = require("dapui")
      local dap = require("dap")
      dapui.setup()

      dap.listeners.before.attach.dapui_config = function()
        dapui.open()
      end
      dap.listeners.before.launch.dapui_config = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated.dapui_config = function()
        dapui.close()
      end
      dap.listeners.before.event_exited.dapui_config = function()
        dapui.close()
      end

      vim.keymap.set('n', '<leader>0', dapui.toggle, { desc = 'Toggle Dap View' })
    end
  }
}
