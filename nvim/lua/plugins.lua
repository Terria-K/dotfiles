local plugins = {
  {"lewis6991/impatient.nvim"},

  {"Decodetalkers/csharpls-extended-lsp.nvim"},

  {
    "mason-org/mason.nvim",
    config = function()
      require("config.mason")
    end
  },

  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "saghen/blink.cmp",
    },
    config = function()
        require("config.lsp-config")
    end
  },
  {
    "terrortylor/nvim-comment",
    config = function()
      require("nvim_comment").setup({
        line_mapping = "<C-/>",
        operator_mapping = ",",
      })
    end
  },

  -- UI --
  {
    "nvim-lualine/lualine.nvim",
    config = function()
      require("lualine").setup(require("config.lualine"))
    end
  },

  {
    "navarasu/onedark.nvim",
    config = function()
      require("onedark").setup({
        style = "darker",
        transparent = true,
      })
    end
  },


  {
    'alexghergh/nvim-tmux-navigation',
    config = function()
      local nvim_tmux_nav = require('nvim-tmux-navigation')

      nvim_tmux_nav.setup {
          disable_when_zoomed = true -- defaults to false
      }

      vim.keymap.set('n', "<C-h>", nvim_tmux_nav.NvimTmuxNavigateLeft)
      vim.keymap.set('n', "<C-j>", nvim_tmux_nav.NvimTmuxNavigateDown)
      vim.keymap.set('n', "<C-k>", nvim_tmux_nav.NvimTmuxNavigateUp)
      vim.keymap.set('n', "<C-l>", nvim_tmux_nav.NvimTmuxNavigateRight)
      vim.keymap.set('n', "<C-\\>", nvim_tmux_nav.NvimTmuxNavigateLastActive)
      vim.keymap.set('n', "<C-Space>", nvim_tmux_nav.NvimTmuxNavigateNext)
    end
  },

  {
    "saghen/blink.cmp",
    version = "1.*",
    opts = {
      keymap = {
        preset = "super-tab",
        ["<CR>"] = { "accept", "fallback" }
      },

      completion = {
        accept = {
          dot_repeat = true,
          create_undo_point = true,
          resolve_timeout_ms = 100
        },
        list = {
          selection = {
            auto_insert = true
          }
        },
        documentation = { auto_show = false }
      },
      signature = { enabled = true },
      fuzzy = { implementation = "lua" }
    }
  },


  {"onsails/lspkind.nvim"},

  {
    "nvim-treesitter/nvim-treesitter",
    config = function()
      require("config.treesitter")
    end
  },

  {
    "nvim-treesitter/nvim-treesitter-refactor",
    after = "nvim-treesitter",
  },

  {
    "SmiteshP/nvim-navic",
    requires = "neovim/nvim-lspconfig",
    config = function()
      require("config.navic")
    end,
  },

  ["mhartington/formatter.nvim"] = {
    config = function()
      require("config.formatter")
    end,
  },
  {"kyazdani42/nvim-web-devicons", lazy = true},
  {"andweeb/presence.nvim"},
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = true
  },
  {"windwp/nvim-ts-autotag"},
  {"lukas-reineke/indent-blankline.nvim"},

  {
    "gelguy/wilder.nvim",
    config = function()
      require("config.wilder")
    end,
  },

  {
  'nvim-telescope/telescope.nvim', tag = '0.1.8',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function ()
      local builtin = require('telescope.builtin')
      vim.keymap.set('n', '<C-p>', builtin.find_files, { desc = 'Find Files' })
      vim.keymap.set('n', 'fh', builtin.buffers, { desc = 'Buffers' })
    end
  },

  {"svermeulen/vimpeccable"},

  {
    "akinsho/toggleterm.nvim",
    tag = "*",
    config = function()
      require("config.toggleterm")
    end,
  },

  {
    "mikavilpas/yazi.nvim",
    event = "VeryLazy",
    dependencies = {
      { "nvim-lua/plenary.nvim", lazy = true },
    },
    keys = {
      -- 👇 in this section, choose your own keymappings!
      {
        "ff",
        mode = { "n", "v" },
        "<cmd>Yazi<cr>",
        desc = "Open yazi at the current file",
      },
      {
        -- Open in the current working directory
        "fg",
        "<cmd>Yazi cwd<cr>",
        desc = "Open the file manager in nvim's working directory",
      },
      {
        "<c-up>",
        "<cmd>Yazi toggle<cr>",
        desc = "Resume the last yazi session",
      },
    },
    opts = {
      -- if you want to open yazi instead of netrw, see below for more info
      open_for_directories = false,
      keymaps = {
        show_help = "<f1>",
      },
    },

    init = function()
      -- mark netrw as loaded so it's not loaded at all.
      --
      -- More details: https://github.com/mikavilpas/yazi.nvim/issues/802
      vim.g.loaded_netrwPlugin = 1
    end,
  }
}


return plugins
