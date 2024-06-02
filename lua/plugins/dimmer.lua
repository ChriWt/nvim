return {
	"levouh/tint.nvim",
	lazy = true,
	event = "VimEnter",
	config = function()
		require("tint").setup(
      require("configs.plugins.dimmer")
    )
	end,
}
