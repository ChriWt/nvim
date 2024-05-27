vim.api.nvim_set_keymap('n', '<C-s>', ':update<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', '<C-s>', '<C-o>:update<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '<C-s>', '<C-c>:update<CR>gv', { noremap = true, silent = true })
