vim.api.nvim_set_keymap('n', '<C-s>', ':update<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', '<C-s>', '<C-o>:update<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '<C-s>', '<C-c>:update<CR>gv', { noremap = true, silent = true })

vim.keymap.set('n', '<C-g>', ':Neotree source=git_status toggle<CR>', { desc = "Show Git Status", noremap = true, silent = true })
vim.keymap.set('n', '<C-b>', ':Neotree source=buffers toggle<CR>', { desc = "Show Buffers", noremap = true, silent = true })
vim.keymap.set('n', '<C-ds>', ':Neotree source=document_symbols toggle<CR>', { desc = "Show File Structure", noremap = true, silent = true })
vim.keymap.set('n', '<C-h>', ':Neotree action=focus<CR>', { desc = "Focus File Structure", noremap = true, silent = true })
