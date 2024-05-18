local lspconfig = require "lspconfig"
local common = require("custom.lspconfig.common")

lspconfig.gopls.setup {
  on_attach = common.custom_on_attach,
  on_init = require("nvchad.configs.lspconfig").on_init,
  capabilities = require("nvchad.configs.lspconfig").capabilities,
  cmd = { "gopls" },
  filetypes = { "go", "gomod", "gowork", "gotmpl" },
}

