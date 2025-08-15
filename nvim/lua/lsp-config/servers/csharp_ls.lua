local util = require("lspconfig.util")

vim.lsp.config("csharp_ls", {
  init_options = {
    AutomaticWorkspaceInit = true,
    RoslynExtensionsOptions = {
      EnableAnalyzersSupport = true,
      EnableImportCompletion = true
    }
  }
})

local function root_within_cwd(root)
  local cwd = vim.fn.getcwd()
  return root and cwd and root:sub(1, #cwd) == cwd
end


local M = {
  root_dir = function(fname)
    local root_pattern = (util.root_pattern '*.slnx'(fname) or util.root_pattern '*.sln'(fname) or util.root_pattern '*.csproj'(fname))
    if root_within_cwd(root_pattern) then
      return root_pattern
    end

    return nil
  end,
  filetypes = { 'cs' },
  init_options = {
    AutomaticWorkspaceInit = false,
    RoslynExtensionsOptions = {
      EnableAnalyzersSupport = true,
      EnableImportCompletion = true
    }
  }
}


return M
