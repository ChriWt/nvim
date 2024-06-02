local one_monokai = {
	fg = "#abb2bf",
	bg = "#1e2024",
	green = "#98c379",
	yellow = "#e5c07b",
	purple = "#c678dd",
	orange = "#d19a66",
	peanut = "#f6d5a4",
	red = "#e06c75",
	aqua = "#61afef",
	darkblue = "#282c34",
	dark_red = "#f75f5f",
}

local vi_mode_colors = {
	NORMAL = "green",
	OP = "green",
	INSERT = "yellow",
	VISUAL = "purple",
	LINES = "orange",
	BLOCK = "dark_red",
	REPLACE = "red",
	COMMAND = "aqua",
}

local mode_alias = {
	n = "NORMAL",
	no = "NORMAL",
	i = "INSERT",
	v = "VISUAL",
	V = "V-LINE",
	[""] = "V-BLOCK",
	c = "COMMAND",
	cv = "COMMAND",
	ce = "COMMAND",
	R = "REPLACE",
	Rv = "REPLACE",
	s = "SELECT",
	S = "SELECT",
	[""] = "SELECT",
	t = "TERMINAL",
}

local buffers_cache = {}

local function get_buffer_icon()
	local filename = vim.fn.expand("%:t")

	if buffers_cache[filename] ~= nil then
		return buffers_cache[filename]
	end

	local file_icon, _ = require("nvim-web-devicons").get_icon_color(filename)

	if filename == "." then
		file_icon = ""
		filename = ""
	end

	if file_icon == nil then
		file_icon = " "
	end

	buffers_cache[filename] = {
		icon = file_icon,
		filename = filename,
	}
	return buffers_cache[filename]
end

local function get_filename()
	return get_buffer_icon().filename .. " "
end

local function get_icon()
	return " " .. get_buffer_icon().icon .. " "
end

local function padded_position()
	local cursor = vim.api.nvim_win_get_cursor(0) -- Get current cursor position (line and column)
	local line = cursor[1]
	local col = cursor[2]

	-- Determine the maximum length of line and column numbers for padding purposes
	local max_line_digits = 4
	local max_col_digits = 2

	-- Create formatted strings with padding applied
	local line_str = string.format("%" .. max_line_digits .. "d", line)
	local col_str = string.format("%-" .. max_col_digits .. "d", col)

	return line_str .. ":" .. col_str
end

local function update_file_icon_hl()
	local bufname = vim.fn.expand("%:t")
	local _, color = require("nvim-web-devicons").get_icon_color(bufname)
	local hl_group = "FileIconCustomHL"
	vim.api.nvim_set_hl(0, hl_group, { fg = color, bg = one_monokai.darkblue })
	return hl_group
end

vim.api.nvim_create_autocmd("BufEnter", {
	pattern = "*",
	callback = function()
		if vim.bo.filetype == "neo-tree" then
			return
		end
		update_file_icon_hl()
	end,
})

local fileinfo = {
	icon = {
		str = get_icon,
		hl = update_file_icon_hl(),
		always_visible = true,
	},
	provider = get_filename,
	hl = function()
		return { fg = "fg", bg = "darkblue", style = "bold" }
	end,
	left_sep = "slant_left_2",
	right_sep = "slant_right",
}

local vi_mode_utils = require("feline.providers.vi_mode")

local c = {
	vim_mode = {
		provider = function()
			return " " .. mode_alias[vim.fn.mode()] .. ""
		end,
		icon = "",
		hl = function()
			return {
				name = vi_mode_utils.get_mode_highlight_name(),
				fg = one_monokai.bg,
				bg = vi_mode_utils.get_mode_color(),
				style = "bold",
			}
		end,
		padding = true,
		left_sep = "block",
		right_sep = "slant_right",
	},
	gitBranch = {
		provider = "git_branch",
		icon = " ",
		hl = {
			fg = "peanut",
			bg = "bg",
			style = "bold",
		},
		left_sep = "block",
		right_sep = "block",
		enabled = function()
			return vim.b.gitsigns_status_dict ~= nil
		end,
	},
	gitDiffAdded = {
		provider = "git_diff_added",
		hl = {
			fg = "green",
			bg = "darkblue",
		},
		left_sep = "block",
		right_sep = "block",
	},
	gitDiffRemoved = {
		provider = "git_diff_removed",
		hl = {
			fg = "red",
			bg = "darkblue",
		},
		left_sep = "block",
		right_sep = "block",
	},
	gitDiffChanged = {
		provider = "git_diff_changed",
		icon = " ",
		hl = {
			fg = "fg",
			bg = "darkblue",
		},
		left_sep = "block",
		right_sep = "block",
	},
	left_separator = {
		hl = {
			fg = "darkblue",
		},
		provider = "",
	},
	right_separator = {
		hl = {
			fg = "green",
		},
		provider = "",
	},
	space_separator = {
		provider = " ",
		hl = {
			bg = "bg",
		},
	},
	fileinfo = fileinfo,
	diagnostic_errors = {
		provider = "diagnostic_errors",
		hl = {
			fg = "red",
		},
	},
	diagnostic_warnings = {
		provider = "diagnostic_warnings",
		hl = {
			fg = "yellow",
		},
	},
	diagnostic_hints = {
		provider = "diagnostic_hints",
		hl = {
			fg = "aqua",
		},
	},
	diagnostic_info = {
		provider = "diagnostic_info",
	},
	lsp_client_names = {
		provider = "lsp_client_names",
		hl = {
			fg = "purple",
			bg = "darkblue",
			style = "bold",
		},
		left_sep = "slant_left_2",
		right_sep = "block",
	},
	file_type = {
		provider = {
			name = "file_type",
			opts = {
				filetype_icon = true,
				case = "titlecase",
			},
		},
		hl = {
			fg = "red",
			bg = "darkblue",
			style = "bold",
		},
		left_sep = "block",
		right_sep = "block",
	},
	file_encoding = {
		provider = "file_encoding",
		hl = {
			fg = "orange",
			bg = "darkblue",
			style = "italic",
		},
		left_sep = "block",
		right_sep = "block",
	},
	position = {
		provider = padded_position,
		hl = {
			fg = "green",
			bg = "darkblue",
			style = "bold",
		},
		left_sep = "slant_left_2",
		right_sep = "slant_right",
	},
	line_percentage = {
		provider = "line_percentage",
		hl = {
			fg = "bg",
			bg = "green",
			style = "bold",
		},
		icon = "  ",
		left_sep = "slant_left_2",
		right_sep = "block",
	},
	scroll_bar = {
		provider = "scroll_bar",
		hl = {
			fg = "yellow",
			style = "bold",
		},
	},
}

local left = {
	c.vim_mode,
	c.gitBranch,
	c.left_separator,
	c.fileinfo,
}

local middle = {}

local right = {
	c.diagnostic_errors,
	c.diagnostic_warnings,
	c.diagnostic_info,
	c.diagnostic_hints,
	c.space_separator,
	c.left_separator,
	c.position,
	c.right_separator,
	c.line_percentage,
}

local components = {
	active = {},
	inactive = {},
}

return {
	components = components,
	theme = one_monokai,
	vi_mode_colors = vi_mode_colors,
	conditional_components = {
		{
			condition = function()
				return vim.bo.filetype ~= "neo-tree" or vim.api.nvim_win_get_number(0) > 1
			end,
			active = {
				left,
				middle,
				right,
			},
			inactive = {
				left,
				middle,
				right,
			},
		},
	},
}
