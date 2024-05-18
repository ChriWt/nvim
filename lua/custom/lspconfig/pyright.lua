local lspconfig = require "lspconfig"
local common = require("custom.lspconfig.common")

lspconfig.pyright.setup {
  on_attach = common.custom_on_attach,
  on_init = require("nvchad.configs.lspconfig").on_init,
  capabilities = require("nvchad.configs.lspconfig").capabilities,
  filetypes = { "python" },
}
