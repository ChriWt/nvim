local navic = require "nvim-navic"
local navbuddy = require "nvim-navbuddy"

local M = {}

M.on_attach = function(client, bufnr)
  -- Custom on_attach logic
  require("nvchad.configs.lspconfig").on_attach(client, bufnr)

  -- Attach navic if the server provides document symbols
  if client.server_capabilities.documentSymbolProvider then
    navic.attach(client, bufnr)
    navbuddy.attach(client, bufnr)
  end
end

M.on_init = function(client)
  -- Custom on_init logic
  require("nvchad.configs.lspconfig").on_init(client)
end

M.capabilities = vim.lsp.protocol.make_client_capabilities()
-- Add additional capabilities if needed

return M
