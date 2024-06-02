vim.api.nvim_set_keymap("n", "<C-s>", ":update<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("i", "<C-s>", "<C-o>:update<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", "<C-s>", "<C-c>:update<CR>gv", { noremap = true, silent = true })

-- Key mappings to navigate windows using Ctrl-h/j/k/l
vim.api.nvim_set_keymap("n", "<C-h>", "<C-w>h", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-j>", "<C-w>j", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-k>", "<C-w>k", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-l>", "<C-w>l", { noremap = true, silent = true })

-- Increase/Decrease window size with shortcuts
vim.api.nvim_set_keymap("n", "<C-Up>", ":resize -2<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-Down>", ":resize +2<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-Left>", ":vertical resize +2<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-Right>", ":vertical resize -2<CR>", { noremap = true, silent = true })

-- Map <leader>x to close the current buffer and switch to the previous one
vim.api.nvim_set_keymap("n", "<leader>x", ":bp | bd #<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<tab>", ":bn<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<S-tab>", ":bp<CR>", { noremap = true, silent = true })

vim.keymap.set("n", "<Esc>", function()
	vim.cmd("nohlsearch")
	return vim.api.nvim_replace_termcodes("<Esc>", true, true, true)
end, { desc = "Clear Search" })
