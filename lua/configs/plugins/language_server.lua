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
    })
    lspconfig.pyright.setup({})
    require("configs.keymaps.language_server")
  end
}
