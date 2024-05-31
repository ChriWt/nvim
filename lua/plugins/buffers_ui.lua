return {
	"jose-elias-alvarez/buftabline.nvim",
	lazy = true,
	event = "BufReadPre",
	config = function()
		require("buftabline").setup(require("configs.plugins.buffers_ui"))
	end,
}
