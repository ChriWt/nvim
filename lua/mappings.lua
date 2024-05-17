require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- debug keymaps
local dap = require "dap"
map("n", "<F5>", "", {
  noremap = true,
  silent = true,
  callback = dap.continue,
  desc = "Start/Continue Debug",
})
map("n", "<F10>", "", {
  noremap = true,
  silent = true,
  callback = dap.step_over,
  desc = "Step Over",
})
map("n", "<F11>", "", {
  noremap = true,
  silent = true,
  callback = dap.step_into,
  desc = "Step Into",
})
map("n", "<F12>", "", {
  noremap = true,
  silent = true,
  callback = dap.step_out,
  desc = "Step Out",
})
map("n", "<leader>b", "", {
  noremap = true,
  silent = true,
  callback = dap.toggle_breakpoint,
  desc = "Toggle Breakpoint",
})
map("n", "<leader>B", "", {
  desc = "Toggle Condition Breakpoint",
  noremap = true,
  silent = true,
  callback = function()
    dap.set_breakpoint(vim.fn.input "Breakpoint condition: ")
  end,
})
map("n", "<leader>lp", "", {
  desc = "Log Point Message",
  noremap = true,
  silent = true,
  callback = function()
    dap.set_breakpoint(nil, nil, vim.fn.input "Log point message: ")
  end,
})
map("n", "<leader>dr", "", {
  desc = "Open Repl",
  noremap = true,
  silent = true,
  callback = dap.repl.open,
})
map("n", "<leader>dl", "", {
  desc = "Run Last Session",
  noremap = true,
  silent = true,
  callback = dap.run_last,
})

-- Telescope configurations for dap
local telescope = require "telescope"
map("n", "<leader>dc", telescope.extensions.dap.commands, {
  noremap = true,
  silent = true,
  desc = "DAP Commands",
})
map("n", "<leader>dlc", telescope.extensions.dap.configurations, {
  noremap = true,
  silent = true,
  desc = "DAP Configurations",
})
map("n", "<leader>dbl", telescope.extensions.dap.list_breakpoints, {
  noremap = true,
  silent = true,
  desc = "List Breakpoints",
})
map("n", "<leader>df", telescope.extensions.dap.frames, {
  noremap = true,
  silent = true,
  desc = "DAP Frames",
})

local js_based_languages = {
  "typescript",
  "javascript",
  "typescriptreact",
  "javascriptreact",
  "vue",
}

vim.api.nvim_set_keymap("n", "<leader>da", [[<cmd>lua DebugWithArgs()<CR>]], {
  noremap = true,
  silent = true,
  desc = "Debug with args",
})

-- Function to debug with args
function DebugWithArgs()
  if vim.fn.filereadable ".vscode/launch.json" == 1 then
    local dap_vscode = require "dap.ext.vscode"
    dap_vscode.load_launchjs(nil, {
      ["pwa-node"] = js_based_languages,
      ["chrome"] = js_based_languages,
      ["pwa-chrome"] = js_based_languages,
    })
  else
    print "launch.json not found"
  end
  require("dap").continue()
end


-- Navbuddy
map("n", "nb", "[[<cmd>lua require('nvim-navbuddy').open()<CR>]]", {
  noremap = true,
  silent = true,
  desc = "Open navbuddy"
})
