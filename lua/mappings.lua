require "nvchad.mappings"

-- General keybindings
local map = vim.keymap.set

map("n", ";", ":", { desc = "Enter command mode" })
map("i", "jk", "<ESC>", { desc = "Exit insert mode" })

-- Debug keybindings
local dap = require "dap"

local dap_mappings = {
  { "n", "<F5>", dap.continue, { desc = "Start/Continue Debug" } },
  { "n", "<F10>", dap.step_over, { desc = "Step Over" } },
  { "n", "<F11>", dap.step_into, { desc = "Step Into" } },
  { "n", "<F12>", dap.step_out, { desc = "Step Out" } },
  { "n", "<leader>b", dap.toggle_breakpoint, { desc = "Toggle Breakpoint" } },
  { "n", "<leader>B", function() dap.set_breakpoint(vim.fn.input "Breakpoint condition: ") end, { desc = "Toggle Condition Breakpoint" } },
  { "n", "<leader>lp", function() dap.set_breakpoint(nil, nil, vim.fn.input "Log point message: ") end, { desc = "Log Point Message" } },
  { "n", "<leader>dr", dap.repl.open, { desc = "Open REPL" } },
  { "n", "<leader>dl", dap.run_last, { desc = "Run Last Session" } },
}

for _, mapping in ipairs(dap_mappings) do
  map(mapping[1], mapping[2], "", { noremap = true, silent = true, callback = mapping[3], desc = mapping[4].desc })
end

-- Telescope configurations for DAP
local telescope = require "telescope"

local telescope_mappings = {
  { "n", "<leader>dc", telescope.extensions.dap.commands, { desc = "DAP Commands" } },
  { "n", "<leader>dlc", telescope.extensions.dap.configurations, { desc = "DAP Configurations" } },
  { "n", "<leader>dbl", telescope.extensions.dap.list_breakpoints, { desc = "List Breakpoints" } },
  { "n", "<leader>df", telescope.extensions.dap.frames, { desc = "DAP Frames" } },
}

for _, mapping in ipairs(telescope_mappings) do
  map(mapping[1], mapping[2], "", { noremap = true, silent = true, callback = mapping[3], desc = mapping[4].desc })
end

-- Debug with args function
local js_based_languages = { "typescript", "javascript", "typescriptreact", "javascriptreact", "vue" }

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
  dap.continue()
end

map("n", "<leader>da", "<cmd>lua DebugWithArgs()<CR>", { noremap = true, silent = true, desc = "Debug with args" })

-- DAP UI
map("n", "<leader>do", "<cmd>lua require('dapui').open()<CR>", { noremap = true, silent = true, desc = "Open DAP UI" })
map("n", "<leader>dc", "<cmd>lua require('dapui').close()<CR>", { noremap = true, silent = true, desc = "Close DAP UI" })

-- Navbuddy
map("n", "<leader>nb", "<cmd>lua require('nvim-navbuddy').open()<CR>", { noremap = true, silent = true, desc = "Open Navbuddy" })

