local __builtin = require("telescope.builtin")

vim.keymap.set('n', '<leader>e', __builtin.find_files, { desc = "Search File" })
vim.keymap.set('n', '<leader>fi', __builtin.live_grep, { desc = "Search Inside Files"})
vim.keymap.set('n', '<leader>fo', __builtin.buffers, { desc = "Search Open Buffer" })
vim.keymap.set('n', '<leader>th', __builtin.colorscheme, { desc = "Change Theme" })
vim.keymap.set('n', '<leader>hh', __builtin.keymaps, { desc = "Keymaps Help" })
