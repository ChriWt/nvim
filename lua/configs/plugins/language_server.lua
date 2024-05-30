return {
  ensure_installed = {
    "lua_ls",
    "pyright",
  },
  lspconf_setup = function()
    local lspconfig = require("lspconfig")
    local lazypath = vim.fn.stdpath("data") .. "\\lazy\\"
    lspconfig.lua_ls.setup({
      cmd = { lazypath .. "lua-language-server\\bin\\lua-language-server.exe" },
      settings = {
        Lua = {
          diagnostics = {
            globals = {'vim'},
          },
          workspace = {
            library = {
              [vim.fn.expand('$VIMRUNTIME/lua')] = true,
              [vim.fn.expand('$VIMRUNPIME/lua/vim/lsp')] = true,
            },
          },
        }
      }
    })
    lspconfig.pyright.setup({})
  end
}
