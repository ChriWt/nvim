vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "Get Symbol LSP Info" })
vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "Go To Definition", noremap = true, silent = true })
vim.keymap.set(
	{ "n", "v" },
	"<leader>ca",
	vim.lsp.buf.code_action,
	{ desc = "Go To Definition", noremap = true, silent = true }
)
