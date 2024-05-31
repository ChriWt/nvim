vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")

vim.opt.relativenumber = true
vim.opt.number = true
vim.opt.showmode = false

-- removes '~' on the left
vim.opt.fillchars = { eob = " " }
