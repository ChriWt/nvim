-- local on_attach = require("nvchad.configs.lspconfig").on_attach
-- local on_init = require("nvchad.configs.lspconfig").on_init
-- local capabilities = require("nvchad.configs.lspconfig").capabilities
-- local custom_on_attach = require("custom.lspconfig.common").custom_on_attach
--
-- local lspconfig = require "lspconfig"

-- Load individual server configurations
require("custom.lspconfig.tsserver")
require("custom.lspconfig.pyright")
require("custom.lspconfig.lua_ls")
require("custom.lspconfig.gopls")
require("custom.lspconfig.clangd")

