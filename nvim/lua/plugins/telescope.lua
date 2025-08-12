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
      }
    })
    local builtin = require('telescope.builtin')
    vim.keymap.set('n', '<C-p>', builtin.find_files, { desc = 'Find Files' })
    vim.keymap.set('n', 'fb', builtin.buffers, { desc = 'Buffers' })
    vim.keymap.set('n', '<C-\\>', builtin.live_grep, { desc = 'Live Grep' })
  end
}
