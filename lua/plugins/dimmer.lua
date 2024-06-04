return {
	"levouh/tint.nvim",
	lazy = true,
	event = "BufReadPre",
	config = function()
		require("tint").setup(
      require("configs.plugins.dimmer")
    )
	end,
}
