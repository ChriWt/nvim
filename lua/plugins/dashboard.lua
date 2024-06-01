return {
	"nvimdev/dashboard-nvim",
	cond = function()
		-- This checks if Neovim was started without any arguments
		return vim.fn.argc() == 0
	end,
	event = "VimEnter",
	config = function()
		-- patorjk.com text to ascii (Fraktur) (other cool are: caligraphy2 and ANSI Shadow)
		local header = {
			[[     ...     ...                               _            .                        ]],
			[[  .=*8888n.."%888:                            u            @88>                      ]],
			[[ X    ?8888f '8888                     u.    88Nu.   u.    %8P      ..    .     :    ]],
			[[ 88x. '8888X  8888>       .u     ...ue888b  '88888.o888c    .     .888: x888  x888.  ]],
			[['8888k 8888X  '"*8h.   ud8888.   888R Y888r  ^8888  8888  .@88u  ~`8888~'888X`?888f` ]],
			[[ "8888 X888X .xH8    :888'8888.  888R I888>   8888  8888 ''888E`   X888  888X '888>  ]],
			[[   `8" X888!:888X    d888 '88%"  888R I888>   8888  8888   888E    X888  888X '888>  ]],
			[[  =~`  X888 X888X    8888.+"     888R I888>   8888  8888   888E    X888  888X '888>  ]],
			[[   :h. X8*` !888X    8888L      u8888cJ888   .8888b.888P   888E    X888  888X '888>  ]],
			[[  X888xX"   '8888..: '8888c. .+  "*888*P"     ^Y8888*""    888&   "*88%""*88" '888!` ]],
			[[:~`888f     '*888*"   "88888%      'Y"          `Y"        R888"    `~    "    `"`   ]],
			[[    ""        `"`       "YP'                                ""                       ]],
			[[                                                                                     ]],
			[[                                                                                     ]],
		}
		require("dashboard").setup({
			theme = "hyper",
			disable_move = true,
			hide = {
				tabline = true,
				winbar = true,
			},
			config = {
				header = header,
				shortcut = {
					{
						desc = "󰊳 Update",
						group = "@property",
						action = "Lazy update",
						key = "u",
					},
					{
						icon = " ",
						icon_hl = "@variable",
						desc = "Files",
						group = "Label",
						action = "Telescope find_files",
						key = "f",
					},
					{
						desc = " Projects",
						group = "DiagnosticHint",
						action = function()
							require("telescope.builtin").find_files({
								prompt_title = "Select Project Directory",
								cwd = vim.fn.expand("$DEV_DIRECTORY"),
								find_command = { "fd", "--type", "d", "--strip-cwd-prefix", "--max-depth", "1" },
								attach_mappings = function(prompt_bufnr, map)
									local change_dir = function()
										local selection =
											require("telescope.actions.state").get_selected_entry(prompt_bufnr)
										local dir = vim.fn.fnamemodify(selection.path, ":p:h")
										vim.cmd("cd " .. dir)
										require("telescope.actions").close(prompt_bufnr)
									end
									map("i", "<CR>", change_dir)
									map("n", "<CR>", change_dir)
									return true
								end,
						})
						end,
						key = "a",
					},
					{
						desc = " dotfiles",
						group = "Number",
						action = function()
							vim.cmd("cd " .. vim.fn.expand("$LOCALAPPDATA/nvim"))
						end,
						key = "d",
					},
				},
			},
		})
	end,
	dependencies = {
		{
			"nvim-tree/nvim-web-devicons",
		},
		{
			"nvim-telescope/telescope.nvim",
		},
	},
}
