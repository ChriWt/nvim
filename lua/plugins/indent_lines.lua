return {
  "lukas-reineke/indent-blankline.nvim",
  lazy = true,
  event = "BufReadPre",
  main = "ibl",
  config = function()
    require("ibl").setup(require("configs.plugins.indent_lines"))
  end,
}
