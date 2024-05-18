local lspconfig = require "lspconfig"
local common = require("custom.lspconfig.common")

lspconfig.lua_ls.setup {
  on_attach = common.custom_on_attach,
  on_init = require("nvchad.configs.lspconfig").on_init,
  capabilities = require("nvchad.configs.lspconfig").capabilities,
  filetypes = { "lua" }
}
