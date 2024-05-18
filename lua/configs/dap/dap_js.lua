local dap = require "dap"
local dap_vscode = require "dap.ext.vscode"

local js_based_languages = {
  "typescript",
  "javascript",
  "typescriptreact",
  "javascriptreact",
  "vue",
}

dap_vscode.load_launchjs(nil, {
  ["pwa-node"] = js_based_languages,
})

local function DebugWithlaunchJson()
  if vim.fn.filereadable ".vscode/launch.json" == 1 then
    dap_vscode.load_launchjs(nil, {
      ["pwa-node"] = js_based_languages,
      ["chrome"] = js_based_languages,
      ["pwa-chrome"] = js_based_languages,
    })
  else
    print "launch.json not found"
  end
  dap.continue()
end

for _, language in ipairs(js_based_languages) do
  dap.configurations[language] = {
    {
      type = "pwa-node",
      request = "launch",
      name = ">> Launch file",
      program = "${file}",
      cwd = vim.fn.getcwd(),
      sourceMaps = true,
    },
    {
      type = "pwa-node",
      request = "attach",
      name = ">> Attach Program",
      processId = require("dap.utils").pick_process,
      cwd = vim.fn.getcwd(),
      skipFiles = { "<node_internals>/**" },
    },
    {
      type = "pwa-chrome",
      request = "launch",
      name = ">> Debug in Chrome",
      url = function()
        local co = coroutine.running()
        return coroutine.create(function()
          vim.ui.input({
            prompt = "Enter URL: ",
            default = "http://localhost:3000",
          }, function(url)
            if url == nil or url == "" then
              return
            else
              coroutine.resume(co, url)
            end
          end)
        end)
      end,
      webRoot = vim.fn.getcwd(),
      protocol = "inspector",
      sourceMaps = true,
      userDataDir = false,
    },
    {
      name = ">> Search launch.json file",
      type = "",
      request = "launch",
      program = function()
        DebugWithlaunchJson()
      end,
    },
    {
      name = "----- ↓ launch.json configs ↓ -----",
      type = "",
      request = "launch",
    },
  }
end
