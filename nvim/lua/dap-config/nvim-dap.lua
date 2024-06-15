local dap = require("dap")
local path = require("path")

dap.adapters.lldb = {
  type = "server",
  port = "0",
  host = "127.0.0.1",
  exectuable = {
    command = path.codelldb_path,
    args = { "--liblldb", path.lldb_lib_path, "--port", "0" },
  },
}

-- dap.configurations.rust = {
--     name = "Launch",
--     type = "lldb",
--     request = "launch",
-- }
