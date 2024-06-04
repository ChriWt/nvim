local configs = require("configs.plugins.file_explorer")

return {
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.6",
		lazy = true,
		keys = { "<leader>ff", "<leader>fi", "<leader>fo", "<leader>th", "<leader>hh" },
		dependencies = {
			{
				"nvim-lua/plenary.nvim",
				lazy = true,
				keys = { "<leader>ff" },
			},
		},
		config = configs.telescope_config,
	},
	{
		"nvim-telescope/telescope-ui-select.nvim",
		lazy = true,
		keys = { "<leader>ff", "<leader>fi", "<leader>fo", "<leader>th", "<leader>hh" },
		event = "BufReadPre",
		config = configs.telescope_ui_config,
	},
}
