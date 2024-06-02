return {
	"feline-nvim/feline.nvim",
	lazy = true,
	event = "VeryLazy",
	config = function()
		require("feline").setup(require("configs.plugins.statusline"))
	end,
}
