vim.cmd([[
  syntax off
  filetype off
  filetype plugin indent off
]])

require("preloads")

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

require("lazy").setup({
  import = "plugins"
}, require("preloads.plugins.lazyConf"))

require("configs")
require("configs.keymaps")

vim.cmd([[
  syntax on
  filetype on
  filetype plugin indent on
]])
