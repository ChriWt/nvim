return {
  "mfussenegger/nvim-dap",
  dependencies = {
    "folke/neodev.nvim",
    "leoluz/nvim-dap-go",
    "rcarriga/nvim-dap-ui",
    "theHamsta/nvim-dap-virtual-text",
    "nvim-neotest/nvim-nio",
    "nvim-telescope/telescope.nvim",
    "nvim-telescope/telescope-dap.nvim",
    {
      "microsoft/vscode-js-debug",
      build = "npm install --legacy-peer-deps --no-save && npx gulp vsDebugServerBundle && rm -Recurse out && mv dist out",
      version = "1.*",
    },
    {
      "mxsdev/nvim-dap-vscode-js",
      config = function()
        ---@diagnostic disable-next-line: missing-fields
        require("dap-vscode-js").setup {
          debugger_path = vim.fn.resolve(vim.fn.stdpath "data" .. "\\lazy\\vscode-js-debug"),
          adapters = {
            "chrome",
            "pwa-node",
            "pwa-chrome",
            "pwa-msedge",
            "pwa-extensionHost",
            "node-terminal",
          },
        }
      end,
    },
    {
      "Joakker/lua-json5",
      build = "./install.sh",
    },
  },
  config = function()
    local telescope = require "telescope"
    require("dapui").setup {
      controls = {
        icons = {
          play = "",
          terminate = "",
        },
      },
    }
    require("neodev").setup {
      library = { plugins = { "nvim-dap-ui" }, types = true },
    }
    require("dap-go").setup()
    telescope.load_extension "dap"
    require("nvim-dap-virtual-text").setup()
  end,
}

