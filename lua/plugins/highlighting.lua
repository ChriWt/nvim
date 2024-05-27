return {
  "nvim-treesitter/nvim-treesitter",
  lazy = true,
  build = ":TSUpdate",
  event = "BufReadPre",
  config = require("configs.plugins.highlighting")
--  config = function()
--    if vim.g.treesitter_configured then return end
--    vim.g.treesitter_configured = true

--    local config = require("nvim-treesitter.configs")
--    config.setup({
--      ensure_installed = { "lua", "python", "c" },
--      highlight = { enable = true },
--      indent = { enable = true },
--    })
--  end,
}
