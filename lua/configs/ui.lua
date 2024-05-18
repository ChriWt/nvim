-- UI configurations

-- Set colorscheme
vim.cmd("colorscheme everforest")

-- Statusline configuration
require("lualine").setup {
  options = {
    theme = "everforest",
    section_separators = '',
    component_separators = '',
  },
}


-- Other UI settings can be added here
