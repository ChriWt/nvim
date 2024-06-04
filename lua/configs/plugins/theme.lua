return function()
	require("kanagawa").setup({
		commentStyle = { italic = true },
		statementStyle = { bold = true },
    transparent = false,
	})

  vim.cmd("setlocal nonumber norelativenumber")
	vim.cmd("colorscheme kanagawa-wave")
end
