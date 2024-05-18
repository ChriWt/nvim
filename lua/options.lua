require "nvchad.options"

-- Custom Vim options
local options = vim.o

-- Enable relative line numbers
options.relativenumber = true

-- Set PowerShell as the default shell
options.shell = "pwsh"
options.shellcmdflag = "-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[System.Text.Encoding]::UTF8;"
options.shellredir = "-RedirectStandardOutput %s -NoNewWindow -Wait"
options.shellquote = ""
options.shellxquote = ""

-- Set the winbar to navic
options.winbar = "%{%v:lua.require'nvim-navic'.get_location()%}"


-- Configure toggleterm plugin
require("toggleterm").setup {
  hide_numbers = false,
  open_mapping = [[<C-\>]],
  direction = "float",
  float_opts = {
    border = "curved"
  }
}

