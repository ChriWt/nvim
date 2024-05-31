local highlight_configure = function()
	if vim.g.treesitter_configured then
		return
	end
	vim.g.treesitter_configured = true

	local config = require("nvim-treesitter.configs")
	config.setup({
		ensure_installed = { "lua", "python", "c", "go", "cpp" },
		highlight = { enable = true },
		indent = { enable = true },
	})
end

return highlight_configure
