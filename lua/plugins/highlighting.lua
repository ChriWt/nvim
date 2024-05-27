return {
  "nvim-treesitter/nvim-treesitter",
  lazy = true,
  build = ":TSUpdate",
  setup = function()
    local config = require("nvim-treesitter.configs")
    config.setup({
      highlight = { enable = true },
      indent = { enable = true },
    })
  end,
}

