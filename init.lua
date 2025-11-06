-- ~/.config/nvim/init.lua
-- Arch btw edition

-- 1. Bootstrap lazy.nvim if it's not installed yet
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- 2. Some sane defaults (you can tweak later)
vim.g.mapleader = " "        -- space = leader
vim.o.number = true          -- line numbers
vim.o.relativenumber = true  -- relative line numbers
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = false      -- keep real tabs for C++
vim.o.termguicolors = true
vim.o.signcolumn = "yes"
vim.o.updatetime = 200
vim.o.cursorline = true

-- 3. Load plugins via lazy.nvim
require("lazy").setup("plugins")

-- 4. Load core config (LSP, keymaps, etc)
require("config.lsp")
require("config.keymaps")
require("config.dap_cpp")
