return {
  'norcalli/nvim-colorizer.lua',
  lazy = true,
  event = "BufReadPre",
  config = function()
    local conf = require("configs.plugins.color_highlighter")
    require 'colorizer'.setup(conf[1], conf[2])
  end
}
