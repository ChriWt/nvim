return {
  "akinsho/toggleterm.nvim",
  version = "*",
  lazy = true,
  keys = { "<C-\\>" },
  config = function()
    require("configs.plugins.terminal")
  end
}
