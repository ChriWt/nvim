return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	lazy = true,
	keys = { "<C-n>", "<leader>e", "<C-g>", "<C-o>" },
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"MunifTanjim/nui.nvim",
	},
	config = function()
		require("neo-tree").setup(require("configs.plugins.sidebar"))
	end,
}
