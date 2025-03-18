return {
    "numToStr/Comment.nvim",
    lazy = true,
	event = "BufReadPre",
    keys = { "<leader>/" },
    config = function()
        require("Comment").setup(
            require("configs.plugins.comments")
        )
    end,
}
