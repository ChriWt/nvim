return {
  "linux-cultist/venv-selector.nvim",
  dependencies = {
    "neovim/nvim-lspconfig",
    "nvim-telescope/telescope.nvim",
    "mfussenegger/nvim-dap-python",
  },
  lazy = true,
  ft = "python",
  config = function()
    require("venv-selector").setup({
    	name = {
          "venv",
          ".venv"
        },
    	search_workspace = true,
    	search_venv_manager = false,
    	auto_refresh = false,
    	search = false,
    	notify_user_on_activate = true,
    })
  end,
}
