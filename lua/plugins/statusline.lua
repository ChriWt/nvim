return {
	"feline-nvim/feline.nvim",
	lazy = true,
	event = "VimEnter",
	config = function()
		require("feline").setup(require("configs.plugins.statusline"))
	end,
}
