return {
	{
		"hrsh7th/cmp-nvim-lsp",
		lazy = true,
		event = "InsertEnter",
	},
	{
		"L3MON4D3/LuaSnip",
		lazy = true,
    event = "InsertEnter",
		dependencies = {
			"saadparwaiz1/cmp_luasnip",
			"rafamadriz/friendly-snippets",
		},
	},
	{
		"hrsh7th/nvim-cmp",
		lazy = true,
		event = "InsertEnter",
		config = require("configs.plugins.completition"),
	},
}
