local lspconfig = require "lspconfig"
local common = require("configs.lspconfig.common")

lspconfig.tsserver.setup {
  on_attach = common.on_attach,
  on_init = common.on_init,
  capabilities = common.capabilities,
}

