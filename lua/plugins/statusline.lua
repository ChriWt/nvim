return {
	"feline-nvim/feline.nvim",
	lazy = true,
	event = "BufReadPre",
	config = function()
		require("feline").setup(require("configs.plugins.statusline"))
	end,
}
