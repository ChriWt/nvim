local on_attach = require("configs.lspconfig.common").on_attach
local on_init = require("configs.lspconfig.common").on_init
local capabilities = require("configs.lspconfig.common").capabilities

local lspconf = require "lspconfig"
local servers = require("configs.lspconfig.servers")

-- Configure LSP servers
for _, lsp in ipairs(servers) do
  lspconf[lsp].setup {
    on_attach = on_attach,
    on_init = on_init,
    capabilities = capabilities,
  }
end

-- Load additional configurations for specific servers
require("configs.lspconfig.tsserver")

