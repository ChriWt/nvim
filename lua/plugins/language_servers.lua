return  {
  {
    "williamboman/mason.nvim",
    lazy = true,
    cmd = "Mason",
    event = "BufReadPre",
    config = function()
      require("mason").setup()
    end
  },
  {
    "williamboman/mason-lspconfig.nvim",
    lazy = true,
    cmd = "Mason",
    event = "BufReadPre",
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = require("configs.plugins.language_server").ensure_installed
      })
    end
  },
  {
    "neovim/nvim-lspconfig",
    lazy = true,
    cmd = "Mason",
    event = "BufReadPre",
    config = require("configs.plugins.language_server").lspconf_setup
  }
}
