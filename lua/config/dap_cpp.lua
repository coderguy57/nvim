-- lua/config/dap_cpp.lua
local dap = require("dap")

-- Helper: check if a command exists
local function has(cmd) return vim.fn.executable(cmd) == 1 end

-- Prefer gdb's native DAP if available (gdb 13+ supports -i dap on Arch)
if has("gdb") then
  dap.adapters.cppdbg = {
    type = "executable",
    command = "gdb",
    args = { "-i", "dap" },
  }
end

-- Fallback to lldb-vscode (ships with lldb on Arch)
if has("lldb-vscode") then
  dap.adapters.lldb = {
    type = "executable",
    command = "lldb-vscode",
    name = "lldb",
  }
end

-- Optional: codelldb via Mason (installed path is under stdpath("data"))
-- If installed, this will be detected by mason-nvim-dap automatically,
-- but you can also wire it manually like this:
local mason = vim.fn.stdpath("data") .. "/mason"
local codelldb = mason .. "/bin/codelldb"
if vim.loop.fs_stat(codelldb) then
  dap.adapters.codelldb = {
    type = "server",
    port = "${port}",
    executable = {
      command = codelldb,
      args = { "--port", "${port}" },
    },
  }
end

-- Choose a default adapter key for C++ in your configs below:
local default_adapter = dap.adapters.cppdbg and "cppdbg"
  or (dap.adapters.codelldb and "codelldb")
  or (dap.adapters.lldb and "lldb")
  or nil

-- Generic launch/attach configs for C/C++
local pick_exec = function()
  return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
end

local pick_args = function()
  local line = vim.fn.input("Program arguments: ")
  if line == "" then return {} end
  -- naive split by whitespace:
  local args = {}
  for a in string.gmatch(line, "%S+") do table.insert(args, a) end
  return args
end

dap.configurations.cpp = {
  {
    name = "Launch file",
    type = default_adapter,
    request = "launch",
    program = pick_exec,
    cwd = "${workspaceFolder}",
    stopAtEntry = false,
    args = pick_args,
  },
  {
    name = "Attach to process",
    type = default_adapter,
    request = "attach",
    pid = require("dap.utils").pick_process,
    cwd = "${workspaceFolder}",
  },
}
dap.configurations.c = dap.configurations.cpp

