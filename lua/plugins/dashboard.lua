return {
	"nvimdev/dashboard-nvim",
	cond = function()
		-- This checks if Neovim was started without any arguments
		return vim.fn.argc() == 0
	end,
	event = "VimEnter",
	config = require("configs.plugins.dashboard"),
	dependencies = {
		{
			"nvim-tree/nvim-web-devicons",
		},
		{
			"nvim-telescope/telescope.nvim",
		},
	},
}
