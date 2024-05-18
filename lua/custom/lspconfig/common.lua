local navic = require "nvim-navic"  -- Ensure nvim-navic is installed
local navbuddy = require "nvim-navbuddy"

local M = {}

M.custom_on_attach = function(client, bufnr)
  -- Call the original on_attach function
  require("nvchad.configs.lspconfig").on_attach(client, bufnr)

  -- Attach navic if the server provides document symbols
  if client.server_capabilities.documentSymbolProvider then
    navic.attach(client, bufnr)
    navbuddy.attach(client, bufnr)
  end
end

return M


