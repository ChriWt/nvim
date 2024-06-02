return {
	"linux-cultist/venv-selector.nvim",
	dependencies = {
		"neovim/nvim-lspconfig",
		"mfussenegger/nvim-dap-python",
		{
			"nvim-telescope/telescope.nvim",
			config = require("configs.plugins.pyvenv").telescope_conf,
		},
	},
	lazy = true,
	ft = "python",
	config = require("configs.plugins.pyvenv").venv_selector_conf,
}
