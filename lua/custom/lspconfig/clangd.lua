local lspconfig = require "lspconfig"
local common = require("custom.lspconfig.common")

lspconfig.clangd.setup {
  on_attach = function(client, bufnr)
    client.server_capabilities.signatureHelpProvider = false
    common.custom_on_attach(client, bufnr)
  end,
  on_init = require("nvchad.configs.lspconfig").on_init,
  capabilities = require("nvchad.configs.lspconfig").capabilities,
  filetypes = { "c", "cpp", "h" }
}

