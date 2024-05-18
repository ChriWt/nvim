vim.g.base46_cache = vim.fn.stdpath "data" .. "/nvchad/base46/"
vim.g.mapleader = " "

-- Bootstrap lazy.nvim and all plugins
local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
  local repo = "https://github.com/folke/lazy.nvim.git"
  vim.fn.system { "git", "clone", "--filter=blob:none", repo, "--branch=stable", lazypath }
end

vim.opt.rtp:prepend(lazypath)

local lazy_config = require "configs.lazy"

-- load plugins
require("lazy").setup({
  {
    "NvChad/NvChad",
    lazy = false,
    branch = "v2.5",
    import = "nvchad.plugins",
    config = function()
      require "options"
    end,
  },
  { import = "custom.plugins" },
}, lazy_config)

-- Load theme configurations
dofile(vim.g.base46_cache .. "defaults")
dofile(vim.g.base46_cache .. "statusline")

-- Load custom configurations
require "nvchad.autocmds"
require "custom.lspconfig"
require "configs.dap"

require("custom.plugins.highlights").setup()

-- Set the winbar to navic
vim.o.winbar = "%{%v:lua.require'nvim-navic'.get_location()%}"

-- Load key mappings after plugins are initialized
vim.schedule(function()
  require "mappings"
end)

