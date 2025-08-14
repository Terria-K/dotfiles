return {
  "nvim-telescope/telescope.nvim",
  tag = '0.1.8',
  dependencies = {
    'nvim-lua/plenary.nvim',
    "j-hui/fidget.nvim"
  },

  config = function ()
    require("telescope").setup({
      pickers = {
        buffers = {
          sort_lastused = true,
          ignore_current_buffer = true
        }
      },
      defaults = {
        mappings = {
          i = {
            ["<ESC>"] = require('telescope.actions').close
          }
        }
      }
    })

    local builtin = require('telescope.builtin')
    vim.keymap.set('n', '<C-p>', function ()
      builtin.find_files({
        previewer = false,
        shorten_path = true
      })
    end, { desc = 'Find Files' })
    vim.keymap.set('n', 'fb', function ()
      builtin.buffers({
        previewer = false,
        shorten_path = true
      })
    end, { desc = 'Buffers' })
    vim.keymap.set('n', '<C-\\>', builtin.live_grep, { desc = 'Live Grep' })
  end
}
