local on_attach = require("nvchad.configs.lspconfig").on_attach
local on_init = require("nvchad.configs.lspconfig").on_init
local capabilities = require("nvchad.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"
local navic = require "nvim-navic"
local navbuddy = require "nvim-navbuddy"

-- Custom on_attach function to include navic
local custom_on_attach = function(client, bufnr)
  -- Call the original on_attach function
  on_attach(client, bufnr)

  -- Attach navic if the server provides document symbols
  if client.server_capabilities.documentSymbolProvider then
    navic.attach(client, bufnr)
    navbuddy.attach(client, bufnr)
  end
end

-- typescript
lspconfig.tsserver.setup {
  on_attach = custom_on_attach,
  on_init = on_init,
  capabilities = capabilities,
}

-- python 
lspconfig.pyright.setup {
  on_attach = custom_on_attach,
  on_init = on_init,
  capabilities = capabilities,
  filetypes = { "python" },
}

-- lua
lspconfig.lua_ls.setup {
  on_attach = custom_on_attach,
  on_init = on_init,
  capabilities = capabilities,
  filetypes = { "lua" }
}

-- golang
lspconfig.gopls.setup {
  on_attach = custom_on_attach,
  on_init = on_init,
  capabilities = capabilities,
  cmd = { "gopls" },
  filetypes = { "go", "gomod", "gowork", "gotmpl" },
}

-- C / C++
lspconfig.clangd.setup {
  on_attach = function (client, bufnr)
    client.server_capabilities.signatureHelpProvider = false
    custom_on_attach(client, bufnr)
  end,
  on_init = on_init,
  capabilities = capabilities,
  filetypes = { "c", "cpp", "h" }
}

-- Set winbar to use navic
vim.o.winbar = "%{%v:lua.require'nvim-navic'.get_location()%}"

