return {
	"nvim-treesitter/nvim-treesitter",
	lazy = true,
	build = ":TSUpdate",
	event = "BufReadPre",
	config = require("configs.plugins.highlighting"),
}
