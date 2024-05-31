vim.keymap.set(
	"n",
	"<C-g>",
	":Neotree source=git_status toggle<CR>",
	{ desc = "Show Git Status", noremap = true, silent = true }
)
vim.keymap.set(
	"n",
	"<C-b>",
	":Neotree source=buffers toggle<CR>",
	{ desc = "Show Buffers", noremap = true, silent = true }
)
vim.keymap.set(
	"n",
	"<C-ds>",
	":Neotree source=document_symbols toggle<CR>",
	{ desc = "Show File Structure", noremap = true, silent = true }
)

return {
	{
		["P"] = { "toggle_preview", config = { use_float = true, use_image_nvim = true } },
		["F"] = "focus_preview",
		["s"] = "open_vsplit",
		["S"] = "open_split",
		["R"] = "refresh",
		["I"] = "show_file_details",
		["H"] = "toggle_hidden",
		["<tab>"] = "open",

		-- Manipulate file
		["y"] = "copy_to_clipboard",
		["x"] = "cut_to_clipboard",
		["p"] = "paste_from_clipboard",
		["<C-g>"] = ":Neotree source=git_status toggle<CR>",
		["<C-b>"] = ":Neotree source=buffers toggle<CR>",

		-- search
		["/"] = "fuzzy_finder",
		["D"] = "fuzzy_finder_directory",

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
