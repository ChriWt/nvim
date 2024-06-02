return {
	"levouh/tint.nvim",
	lazy = true,
	event = "VeryLazy",
	config = function()
		require("tint").setup(
      require("configs.plugins.dimmer")
    )
	end,
}
