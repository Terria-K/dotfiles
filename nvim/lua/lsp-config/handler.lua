Rivim.lsp = {}
local navic = require("nvim-navic")
local user = require("user." .. User)
local lspconfig = require("lspconfig")

Rivim.lsp.config = user.lsp.config
Rivim.lsp.servers = user.lsp.servers

local capabilities = require("cmp_nvim_lsp").default_capabilities()
Rivim.lsp.capabilities = capabilities

Rivim.lsp.lsp_flags = {
  debounce_text_changes = 150,
}

Rivim.lsp.setup = function(server)
  local opts = Rivim.lsp.server_settings(server)
  lspconfig[server].setup(opts)
end

Rivim.lsp.on_attach = function(client, bufnr)
  vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

  local bufopts = { noremap = true, silent = true, buffer = bufnr }
  vim.keymap.set("n", "gD", vim.lsp.buf.declaration, bufopts)
  vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts)
  vim.keymap.set("n", "K", vim.lsp.buf.hover, bufopts)
  vim.keymap.set("n", "gi", vim.lsp.buf.implementation, bufopts)
  vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, bufopts)
  vim.keymap.set("n", "<space>D", vim.lsp.buf.type_definition, bufopts)
  vim.keymap.set("n", "<space>ca", vim.lsp.buf.code_action, bufopts)
  vim.keymap.set("n", "gr", vim.lsp.buf.references, bufopts)
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
