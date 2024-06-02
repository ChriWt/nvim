return {
	telescope_conf = function()
		require("configs.keymaps.file_explorer")
		require("telescope").setup({
			defaults = {
				file_ignore_patterns = {},
			},
		})
	end,
	venv_selector_conf = function()
		require("venv-selector").setup({
			name = {
				"venv",
				".venv",
			},
			search_workspace = true,
			search_venv_manager = false,
			auto_refresh = false,
			search = true,
			notify_user_on_activate = true,
		})
	end,
}
