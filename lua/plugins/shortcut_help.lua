return {
	"folke/which-key.nvim",
	lazy = true,
	event = "VeryLazy",
  priority = 10000,
	config = function()
		vim.o.timeout = true
		vim.o.timeoutlen = 300
		require("which-key").setup()
	end,
}
