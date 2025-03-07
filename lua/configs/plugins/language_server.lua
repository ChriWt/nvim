return {
	ensure_installed = {
		"lua_ls",
		"pyright",
		"ts_ls",
		"svelte",
		"cssls",
		"html",
	},
	lspconf_setup = function()
		local lspconfig = require("lspconfig")
		local capabilities = require("cmp_nvim_lsp").default_capabilities()

		lspconfig.lua_ls.setup({
			on_attach = on_attach,
			capabilities = capabilities,
		})

		lspconfig.pyright.setup({
			on_attach = on_attach,
			capabilities = capabilities,
		})

		lspconfig.svelte.setup({
			on_attach = on_attach,
			capabilities = capabilities,
		})

		lspconfig.cssls.setup({
			on_attach = on_attach,
			capabilities = capabilities,
		})

		lspconfig.html.setup({
			on_attach = on_attach,
			capabilities = capabilities,
		})

		lspconfig.ts_ls.setup({
			on_attach = on_attach,
			capabilities = capabilities,
		})

		require("configs.keymaps.language_server")
	end,
}
