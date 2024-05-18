return {
  "SmiteshP/nvim-navbuddy",
  dependencies = {
    "SmiteshP/nvim-navic",
    "MunifTanjim/nui.nvim",
  },
  config = function()
    require("nvim-navbuddy").setup {
      window = {
        border = "rounded",
        size = "90%",
        sections = {
          left = {
            size = "20%",
          },
          mid = {
            size = "30%",
          },
        },
      },
      source_buffer = {
        highlight = true,
      }
    }
  end,
  opts = { lsp = { auto_attach = true } },
}

