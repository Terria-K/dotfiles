local plugin = {
  "nvim-lualine/lualine.nvim",
  dependencies = {
    {
      'vimpostor/vim-tpipeline',
      lazy = true
    },
    "folke/trouble.nvim"
  },
  config = function()
    require("lualine").setup(Setup())
      if os.getenv('TMUX') then
        vim.defer_fn(function() vim.o.laststatus=0 end, 0)
      end
  end
}

function Setup()
   local colors = {
    bg       = '#202328',
    fg       = '#bbc2cf',
    yellow   = '#ECBE7B',
    cyan     = '#008080',
    darkblue = '#081633',
    green    = '#98be65',
    orange   = '#FF8800',
    violet   = '#a9a1e1',
    magenta  = '#c678dd',
    blue     = '#51afef',
    red      = '#ec5f67',
  }

  local conditions = {
    buffer_not_empty = function()
      return vim.fn.empty(vim.fn.expand("%:t")) ~= 1
    end,
    hide_in_width = function()
      return vim.fn.winwidth(0) > 80
    end,
    check_git_workspace = function()
      local filepath = vim.fn.expand("%:p:h")
      local gitdir = vim.fn.finddir(".git", filepath .. ";")
      return gitdir and #gitdir > 0 and #gitdir < #filepath
    end,
  }

  local config = {
    options = {
      component_separators = "|",
      theme = {
        normal = { c = { fg = colors.fg, bg = colors.bg } },
        inactive = { c = { fg = colors.fg, bg = colors.bg } },
      },
    },
    sections = {
      lualine_a = {},
      lualine_b = {},
      lualine_y = {},
      lualine_z = {},
      lualine_c = {},
      lualine_x = {},
    },
    inactive_sections = {
      lualine_a = {},
      lualine_b = {},
      lualine_y = {},
      lualine_z = {},
      lualine_c = {},
      lualine_x = {},
    },
  }

  local function ins_left(component)
    table.insert(config.sections.lualine_c, component)
  end

  local function ins_right(component)
    table.insert(config.sections.lualine_x, component)
  end


  ins_left({
    function()
      return "▊"
    end,
    color = { fg = colors.blue },
    padding = { left = 0, right = 1 },
  })

  local name = User

  ins_left({
    function()
      return name
    end,
    color = function()
      local mode_color = {
        n = colors.blue,
        i = colors.green,
        v = colors.blue,
        [""] = colors.blue,
        V = colors.blue,
        c = colors.magenta,
        no = colors.red,
        s = colors.orange,
        S = colors.orange,
        ic = colors.yellow,
        R = colors.violet,
        Rv = colors.violet,
        cv = colors.red,
        ce = colors.red,
        r = colors.cyan,
        rm = colors.cyan,
        ["r?"] = colors.cyan,
        ["!"] = colors.red,
        t = colors.red,
      }
      return { fg = mode_color[vim.fn.mode()] }
    end,
    padding = { right = 1 },
  })

  ins_left({
    "filename",
    cond = conditions.buffer_not_empty,
    color = { fg = colors.magenta, gui = "bold" },
  })

  ins_left({ "location" })

  ins_left({function ()
    return " "
  end})

  ins_right({
    "diagnostics",
    sources = { "nvim_diagnostic" },
    symbols = { error = " ", warn = " ", info = " " },
    diagnostics_color = {
      color_error = { fg = colors.red },
      color_warn = { fg = colors.yellow },
      color_info = { fg = colors.cyan },
    },
  })

  ins_right({
    function()
      local lsp = vim.lsp.util.status()[1]
      return lsp
          and string.format(
            " %%<%s %s %s (%s%%%%) ",
            ((lsp.percentage or 0) >= 70 and { "", "", "", "", "", "", "", "" } or {
              "⣾",
              "⣽",
              "⣻",
              "⢿",
              "⡿",
              "⣟",
              "⣯",
              "⣷",
            })[math.floor(vim.loop.hrtime() / 12e7) % 8 + 1],
            lsp.title or "",
            lsp.message or "",
            lsp.percentage or 0
          )
        or ""
    end,
    color = { fg = "#ffffff", gui = "bold" },
  })

  ins_right({
    function()
      local msg = "off"
      local buf_ft = vim.api.nvim_buf_get_option(0, "filetype")
      local clients = vim.lsp.get_clients()
      if next(clients) == nil then
        return msg
      end
      for _, client in ipairs(clients) do
        local filetypes = client.config.filetypes
        if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
          return client.name
        end
      end
      return msg
    end,
    icon = " ",
    color = { fg = "#ffffff", gui = "bold" },
  })

  ins_right({
    "branch",
    icon = "",
    color = { fg = colors.violet, gui = "bold" },
  })

  ins_right({
    "diff",
    symbols = { added = " ", modified = " ", removed = " " },
    diff_color = {
      added = { fg = colors.green },
      modified = { fg = colors.orange },
      removed = { fg = colors.red },
    },
    cond = conditions.hide_in_width,
  })

  return config
end

return plugin


