return {
	{
		"hrsh7th/cmp-nvim-lsp",
		lazy = true,
		event = "BufReadPre",
	},
	{
		"L3MON4D3/LuaSnip",
		lazy = true,
		event = "BufReadPre",
		dependencies = {
			"saadparwaiz1/cmp_luasnip",
			"rafamadriz/friendly-snippets",
		},
	},
	{
		"hrsh7th/nvim-cmp",
		lazy = true,
		event = "BufReadPre",
		config = require("configs.plugins.completition"),
	},
}
