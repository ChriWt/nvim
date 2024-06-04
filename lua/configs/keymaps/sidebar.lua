return {
	{
		["P"] = { "toggle_preview", config = { use_float = true, use_image_nvim = true } },
		["F"] = "focus_preview",
		["s"] = "open_vsplit",
		["S"] = "open_split",
		["R"] = "refresh",
		["I"] = "show_file_details",
		["<tab>"] = "open",

		-- Manipulate file
		["y"] = "copy_to_clipboard",
		["x"] = "cut_to_clipboard",
		["p"] = "paste_from_clipboard",

		-- order
		["o"] = { "show_help", nowait = false, config = { title = "Order by", prefix_key = "o" } },
	},
	{
		-- git commands
		["A"] = "git_add_all",
		["gu"] = "git_unstage_file",
		["ga"] = "git_add_file",
		["gr"] = "git_revert_file",
		["gc"] = "git_commit",
		["gp"] = "git_push",
		["gg"] = "git_commit_and_push",
		["o"] = { "show_help", nowait = false, config = { title = "Order by", prefix_key = "o" } },
	},
}
