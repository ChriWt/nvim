vim.api.nvim_set_keymap("n", "<C-s>", ":update<CR>", { desc = "Save", noremap = true, silent = true })
vim.api.nvim_set_keymap("i", "<C-s>", "<C-o>:update<CR>", { desc = "Save", noremap = true, silent = true })
vim.api.nvim_set_keymap("v", "<C-s>", "<C-c>:update<CR>gv", { desc = "Save", noremap = true, silent = true })

-- Key mappings to navigate windows using Ctrl-h/j/k/l
vim.api.nvim_set_keymap("n", "<C-h>", "<C-w>h", { desc = "Focus Left Window", noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-j>", "<C-w>j", { desc = "Focus Down Window", noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-k>", "<C-w>k", { desc = "Focus Upper Window", noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-l>", "<C-w>l", { desc = "Focus Right Window", noremap = true, silent = true })

-- Increase/Decrease window size with shortcuts
vim.api.nvim_set_keymap(
	"n",
	"<C-Down>",
	":resize +2<CR>",
	{ desc = "Increase Horizontal Size", noremap = true, silent = true }
)
vim.api.nvim_set_keymap(
	"n",
	"<C-Up>",
	":resize -2<CR>",
	{ desc = "Decrease Horizontal Size", noremap = true, silent = true }
)
vim.api.nvim_set_keymap(
	"n",
	"<C-Left>",
	":vertical resize +2<CR>",
	{ desc = "Increase Vertical Size", noremap = true, silent = true }
)
vim.api.nvim_set_keymap(
	"n",
	"<C-Right>",
	":vertical resize -2<CR>",
	{ desc = "Decrease Vertical Size", noremap = true, silent = true }
)

-- Map <leader>x to close the current buffer and switch to the previous one
vim.api.nvim_set_keymap("n", "<leader>x", ":bp | bd #<CR>", { desc = "Close Buffer", noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<tab>", ":bn<CR>", { desc = "Go Next Buffer", noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<S-tab>", ":bp<CR>", { desc = "Go Previous Buffer", noremap = true, silent = true })

vim.keymap.set("n", "<Esc>", function()
	vim.cmd("nohlsearch")
	return vim.api.nvim_replace_termcodes("<Esc>", true, true, true)
end, { desc = "Clear Search", noremap = true, silent = true })

-- Opens Sidebar
vim.keymap.set(
	"n",
	"<C-g>",
	":Neotree source=git_status toggle focus<CR>",
	{ desc = "Show Git Status", noremap = true, silent = true }
)
vim.keymap.set(
	"n",
	"<C-o>",
	":Neotree source=buffers toggle focus<CR>",
	{ desc = "Show Buffers", noremap = true, silent = true }
)
vim.keymap.set(
	"n",
	"<C-n>",
	":Neotree position=left toggle focus<CR>",
	{ desc = "Open File Navigation", noremap = true, silent = true }
)
vim.keymap.set(
	"n",
	"<leader>e",
	":Neotree position=left toggle focus<CR>",
	{ desc = "Open File Navigation", noremap = true, silent = true }
)

-- Map <C-Del> to execute 'de' in normal mode
vim.api.nvim_set_keymap('n', '<C-Del>', 'de', { noremap = true, silent = true })

-- Map 'y' to yank to the system clipboard in normal and visual modes
vim.api.nvim_set_keymap('n', 'y', '"+y', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', 'y', '"+y', { noremap = true, silent = true })

-- Map 'p' to pase to the system clipboard in normal and visual modes
vim.api.nvim_set_keymap('n', 'p', '"+p', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', 'p', '"+p', { noremap = true, silent = true })
