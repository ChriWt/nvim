return {
	telescope_config = function()
		require("configs.keymaps.file_explorer")
		require("telescope").setup({
			defaults = {
				file_ignore_patterns = {
					"node_modules",
					"build",
					"venv",
					".venv",
				},
			},
		})
	end,
	telescope_ui_config = function()
		require("telescope").setup({
			extensions = {
				["ui-select"] = {
					require("telescope.themes").get_dropdown({}),
				},
			},
		})

		require("telescope").load_extension("ui-select")
	end,
}
