vim.g.loaded_netrw = 1
vim.g.loaded_tutor_mode_plugin = 1
vim.g.loaded_netrwPlugin = 1


local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  import = "plugins" 
}, lazy_conf)

require("configs")
