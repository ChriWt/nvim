return {
	"folke/which-key.nvim",
	lazy = true,
  keys = {"<leader>"},
	config = function()
		vim.o.timeout = true
		vim.o.timeoutlen = 300
		require("which-key").setup()
	end,
}
