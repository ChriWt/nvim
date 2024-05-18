require "nvchad.options"

-- add yours here!

local options = vim.o

options.relativenumber = true
options.shell = "pwsh"
options.shellcmdflag = "-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[System.Text.Encoding]::UTF8;"
options.shellredir = "-RedirectStandardOutput %s -NoNewWindow -Wait"
options.shellquote = ""
options.shellxquote = ""

require("toggleterm").setup {
  hide_numbers = false,
  open_mapping = [[<C-\>]],
  direction = "float",
  float_opts = {
    border = "curved"
  }
}
