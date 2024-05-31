-- Formatting Tools
return {
	"nvimtools/none-ls.nvim",
	lazy = true,
	event = "BufReadPre",
	config = function()
		require("null-ls").setup(
      require("configs.plugins.linter")
    )

    require("configs.keymaps.linter")
	end,
}
