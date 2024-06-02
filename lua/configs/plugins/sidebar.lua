vim.keymap.set(
	"n",
	"<C-n>",
	":Neotree position=left toggle<CR>",
	{ desc = "Open File Navigation", noremap = true, silent = true }
)
vim.keymap.set(
	"n",
	"<leader>e",
	":Neotree position=left toggle<CR>",
	{ desc = "Open File Navigation", noremap = true, silent = true }
)

return {
	source_selector = {
		winbar = true,
		statusline = false,
	},
	close_if_last_window = true,
	popup_border_style = "rounded",
	enable_git_status = true,
	enable_diagnostics = true,
	default_component_configs = {
		indent = {
			with_markers = false,
			highlight = "NeoTreeIndentMarker",
		},
		modified = {
			symbol = "",
		},
		name = {
			use_git_status_colors = true,
		},
		git_status = {
			symbols = {
				-- Change type
				added = "",
				modified = "",
				deleted = "",
				renamed = "",
				-- Status type
				untracked = "",
				ignored = "",
				unstaged = "",
				staged = "",
				conflict = "",
			},
		},
		file_size = {
			enabled = false,
			-- required_width = 64
		},
		type = {
			enabled = false,
			-- required_width = 122,
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
		mappings = require("configs.keymaps.sidebar")[1],
	},

	filesystem = {
		filtered_items = {
			visible = true,
			never_show = {
				"node_modules",
				"venv",
				".venv",
			},
			always_show = {
				".gitignored",
			},
		},

		follow_current_file = {
			enabled = true,
		},

		group_empty_dirs = false,
	},

	git_status = {
		window = {
			mapping_options = {
				noremap = true,
				nowait = true,
			},
			mappings = require("configs.keymaps.sidebar")[2],
		},
	},
}
