return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	lazy = true,
  cmd = { "Neotree" },
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"MunifTanjim/nui.nvim",
	},
	config = function()
		require("neo-tree").setup(require("configs.plugins.sidebar"))
	end,
}
