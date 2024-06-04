return {
	ensure_installed = {
		"lua_ls",
		"pyright",
		"tsserver",
	},
	lspconf_setup = function()
		local lspconfig = require("lspconfig")
		local lazypath = vim.fn.stdpath("data") .. "\\lazy\\"
		local capabilities = require("cmp_nvim_lsp").default_capabilities()

		lspconfig.lua_ls.setup({
			capabilities = capabilities,
			cmd = { lazypath .. "lua-language-server\\bin\\lua-language-server.exe" },
		})

		lspconfig.pyright.setup({
			capabilities = capabilities,
		})

		lspconfig.tsserver.setup({
			capabilities = capabilities,
		})

		require("configs.keymaps.language_server")
	end,
}
