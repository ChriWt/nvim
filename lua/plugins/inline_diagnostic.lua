return {
  "rachartier/tiny-inline-diagnostic.nvim",
  lazy = true,
  event = "BufReadPre",
  config = function()
    require("tiny-inline-diagnostic").setup(require("configs.plugins.inline_diagnostic"))
  end,
}
