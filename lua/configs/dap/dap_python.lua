local dap = require "dap"

dap.adapters.python = function(cb, config)
  if config.request == "attach" then
    local port = (config.connect or config).port
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
      command = os.getenv("PYTHON_DEBUGPY") or "python",
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
    name = ">> Launch file",
    program = "${file}",
    pythonPath = function()
      local cwd = vim.fn.getcwd()
      local venv_path = cwd .. "/venv/Scripts/pythonw"
      if vim.fn.executable(venv_path) == 1 then
        return venv_path
      else
        return os.getenv("PYTHON_DEBUGPY") or "python"
      end
    end,
  },
  {
    type = "python",
    request = "attach",
    name = ">> Attach to FastAPI",
    connect = {
      host = "8098DS3-A081",
      port = 5678
    },
    justMyCode = false,
  }
}

