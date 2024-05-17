local dap = require "dap"
local dapui = require "dapui"

dap.listeners.after.event_initialized["dapui_config"] = function()
  dapui.open()
end

dap.listeners.before.event_terminated["dapui_config"] = function()
  dapui.close()
end

dap.listeners.before.event_exited["dapui_config"] = function()
  dapui.close()
end

-- adapter for go
dap.adapters.delve = {
  type = "server",
  port = "${port}",
  executable = {
    command = "dlv",
    args = { "dap", "-l", "127.0.0.1:${port}" },
    detached = false,
  },
}

dap.configurations.go = {
  {
    type = "delve",
    name = "Debug",
    request = "launch",
    program = "${file}",
  },
}

-- adapters for python
dap.adapters.python = function(cb, config)
  if config.request == "attach" then
    ---@diagnostic disable-next-line: undefined-field
    local port = (config.connect or config).port
    ---@diagnostic disable-next-line: undefined-field
    local host = (config.connect or config).host or "127.0.0.1"
    cb {
      type = "server",
      port = assert(port, "`connect.port` is required for a python `attach` configuration"),
      host = host,
      options = {
        source_filetype = "python",
      },
    }
  else
    cb {
      type = "executable",
      command = "C:/Users/xXDar/OneDrive/Documenti/GitProjects/Python/debugpy/venv/Scripts/pythonw",
      args = { "-m", "debugpy.adapter" },
      options = {
        source_filetype = "python",
      },
    }
  end
end

dap.configurations.python = {
  {
    type = "python",
    request = "launch",
    name = "Launch file",

    program = "${file}",
    pythonPath = function()
      local cwd = vim.fn.getcwd()
      local venv_path = cwd .. "/venv/Scripts/pythonw"
      if vim.fn.executable(venv_path) == 1 then
        return venv_path
      else
        return "C:/Users/xXDar/OneDrive/Documenti/GitProjects/Python/debugpy/venv/Scripts/pythonw"
      end
    end,
  },
}

-- JS / TS / REACT
local dap_vscode = require "dap.ext.vscode"

-- Load the launch.json configurations
dap_vscode.load_launchjs(nil, {
  ["pwa-node"] = {
    "typescript",
    "javascript",
    "typescriptreact",
    "javascriptreact",
    "vue",
  },
})

-- Define configurations for JavaScript-based languages
local js_based_languages = {
  "typescript",
  "javascript",
  "typescriptreact",
  "javascriptreact",
  "vue",
}

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

    -- Divider for the launch.json derived configs
    {
      name = "----- ↓ launch.json configs ↓ -----",
      type = "",
      request = "launch",
    },
  }
end
