return {
	"numToStr/Comment.nvim",
	lazy = true,
  keys = { "<leader>/" },
	config = function()
		require("Comment").setup(
      require("configs.plugins.comments")
    )
	end,
}
