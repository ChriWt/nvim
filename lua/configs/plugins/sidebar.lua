return {
  popup_border_style = "rounded",
  enable_git_status = true,
  enable_diagnostics = true,
  default_component_configs = {
    indent = {
      indent_marker = " ",
      last_indent_marker = " ",
    },
    modified = {
      symbol = "",
    },
    name = {
      use_git_status_colors = true,
    },
    git_status = {
      symbols = {
        -- Change type
        added     = "",
        modified  = "",
        deleted   = "",
        renamed   = "",
        -- Status type
        untracked = "",
        ignored   = "",
        unstaged  = "",
        staged    = "",
        conflict  = "",
      }
    },
    file_size = {
      ["<cr>"] = "open",
      ["<esc>"] = "cancel",
      enabled = false,
    },
    type = {
      enabled = false,
    },
    last_modified = {
      enabled = false,
    },
    created = {
      enabled = false,
    },
    symlink_target = {
      enabled = false,
    },
  },

  window = {
    mapping_options = {
      noremap = true,
      nowait = true,
    },
    mappings = require("configs.keymaps.sidebar")
  },

  filesystem = {
    filtered_items = {
      visible = true,
    },
  },
}
