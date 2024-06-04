return {
	"feline-nvim/feline.nvim",
	lazy = true,
	event = "BufReadPre",
	config = function()
    vim.cmd("set laststatus=3")
		require("feline").setup(require("configs.plugins.statusline"))
	end,
}
