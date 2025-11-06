-- lua/config/lsp.lua (Neovim 0.11+ style)
local cmp_caps = require("cmp_nvim_lsp").default_capabilities()

-- runs when an LSP attaches
local on_attach = function(_, bufnr)
  local map = function(mode, lhs, rhs, desc)
    vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, desc = desc })
  end
  map("n", "gd", vim.lsp.buf.definition, "Go to definition")
  map("n", "gr", "<cmd>Telescope lsp_references<cr>", "Find references (Telescope)")
  map("n", "gi", vim.lsp.buf.implementation, "Go to implementation")
  map("n", "K",  vim.lsp.buf.hover, "Hover docs")
  map("n", "<leader>rn", vim.lsp.buf.rename, "Rename")
  map("n", "<leader>ca", vim.lsp.buf.code_action, "Code action")
  map("n", "[d", vim.diagnostic.goto_prev, "Prev diagnostic")
  map("n", "]d", vim.diagnostic.goto_next, "Next diagnostic")
  map("n", "<leader>xx", "<cmd>Trouble diagnostics toggle<cr>", "Diagnostics list")
end

-- define/extend clangd config
vim.lsp.config("clangd", {
  cmd = {
    "clangd",
    "--background-index",
    "--clang-tidy",
    "--completion-style=detailed",
    "--header-insertion=iwyu",
    "--fallback-style=llvm",
  },
  filetypes = { "c", "cpp", "objc", "objcpp" },
  -- use whichever your project has; these help root detection
  root_markers = { "compile_commands.json", "compile_flags.txt", ".git" },
  capabilities = cmp_caps,
  on_attach = on_attach,
})

-- enable it yourself if you are NOT letting mason-lspconfig auto-enable
-- vim.lsp.enable("clangd")

vim.diagnostic.config({
  virtual_text = true,
  signs = true,
  float = { border = "rounded" },
  update_in_insert = false,
})

