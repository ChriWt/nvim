vim.keymap.set(
	{ "n", "v" },
	"<leader>ck",
	vim.lsp.buf.hover,
	{ desc = "Get info", noremap = true, silent = true }
)

vim.keymap.set(
	{ "n", "v" },
	"<leader>cd",
	vim.lsp.buf.definition,
	{ desc = "Go To Definition", noremap = true, silent = true }
)

vim.keymap.set(
	{ "n", "v" },
	"<leader>cr",
	vim.lsp.buf.rename,
	{ desc = "rename", noremap = true, silent = true }
)
