return {
  "nvim-telescope/telescope.nvim",
  tag = '0.1.8',
  dependencies = {
    'nvim-lua/plenary.nvim',
    "j-hui/fidget.nvim"
  },
  config = function ()
    local builtin = require('telescope.builtin')
    vim.keymap.set('n', '<C-p>', builtin.find_files, { desc = 'Find Files' })
    vim.keymap.set('n', 'fh', builtin.buffers, { desc = 'Buffers' })
    vim.keymap.set('n', '<C-\\>', builtin.live_grep, { desc = 'Live Grep' })
  end
}
