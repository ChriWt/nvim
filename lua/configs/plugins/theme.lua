return function()
	require("kanagawa").setup({
		commentStyle = { italic = true },
		statementStyle = { bold = true },
    theme = "wave",
    transparent = false,
	})

	vim.cmd("colorscheme kanagawa")
end
