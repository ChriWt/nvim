return {
  'nvim-lualine/lualine.nvim',
  lazy = true,
  event = 'VeryLazy',
  config = function()
    require('lualine').setup(
      require("configs.plugins.statusline")
    )
  end,
}
