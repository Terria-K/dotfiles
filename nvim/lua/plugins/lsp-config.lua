return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "SmiteshP/nvim-navic",
    "hrsh7th/nvim-cmp"
  },
  config = function()
    Rivim.lsp = {}
    local navic = require("nvim-navic")
    local user = require("user." .. User)
    local lspconfig = require("lspconfig")

    Rivim.lsp.config = user.lsp.config
    Rivim.lsp.servers = user.lsp.servers

    local capabilities = require("cmp_nvim_lsp").default_capabilities();
    Rivim.lsp.capabilities = capabilities

    Rivim.lsp.lsp_flags = {
        debounce_text_changes = 150,
    }

    Rivim.lsp.setup = function(server)
      local opts = Rivim.lsp.server_settings(server)
      lspconfig[server].setup(opts)

      if server == "csharp_ls" then
        require("csharpls_extended").buf_read_cmd_bind()
      end
    end

    Rivim.lsp.on_attach = function(client, bufnr)
        vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

        local bufopts = { noremap = true, silent = true, buffer = bufnr }

        vim.keymap.set("n", "<space>D", vim.lsp.buf.type_definition, bufopts)
        vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts)
        vim.keymap.set("n", "gr", vim.lsp.buf.references, bufopts)
        vim.keymap.set("n", "gi", vim.lsp.buf.implementation, bufopts)
        vim.keymap.set("n", "gD", vim.lsp.buf.declaration, bufopts)
        vim.keymap.set("n", "K", vim.lsp.buf.hover, bufopts)
        vim.keymap.set("n", "<space>lr", vim.lsp.buf.rename, bufopts)
        vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, bufopts)
        vim.keymap.set("n", "<space>ca", vim.lsp.buf.code_action, bufopts)
        vim.keymap.set("n", "<space>f", function()
        vim.lsp.buf.format({ async = true })
        end, bufopts)
        if client.server_capabilities.documentSymbolProvider then
              navic.attach(client, bufnr)
        end
    end

    Rivim.lsp.server_settings = function(server)
        local ok, server_opts = pcall(require, "lsp-config.servers." .. server)
        local server_opt = ok and server_opts or {}
        if Rivim.lsp.config[server] then
            server_opt = Rivim.lsp.config[server]
        end

        server_opt.on_attach = Rivim.lsp.on_attach
        server_opt.capabilities = Rivim.lsp.capabilities
        server_opt.flags = Rivim.lsp.lsp_flags
        return server_opt
    end

    vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" })
    vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = "rounded" })

    local opts = { noremap = true, silent = true }
    vim.keymap.set("n", "dg", vim.diagnostic.open_float, opts)
    vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
    vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
    vim.keymap.set("n", "<space>q", vim.diagnostic.setloclist, opts)

    local config = {
      virtual_text = false,
      signs = {
        text = {
          [vim.diagnostic.severity.ERROR] = "",
          [vim.diagnostic.severity.WARN] = "",
          [vim.diagnostic.severity.INFO] = "",
          [vim.diagnostic.severity.HINT] = "󰌵",
        },
        numhl = {
          [vim.diagnostic.severity.ERROR] = "",
          [vim.diagnostic.severity.WARN] = "",
          [vim.diagnostic.severity.INFO] = "",
          [vim.diagnostic.severity.HINT] = "",
        }
      },
      update_in_insert = true,
      underline = true,
      severity_sort = true,
      float = {
        focusable = false,
        style = "minimal",
        border = "rounded",
        source = "always",
        header = "",
        prefix = "",
      },
    }

    vim.diagnostic.config(config)

    for server = 1, #Rivim.lsp.servers do
      Rivim.lsp.setup(Rivim.lsp.servers[server])
    end
  end
}
