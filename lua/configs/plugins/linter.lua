local null_ls = require("null-ls")

return {
	sources = {
		null_ls.builtins.formatting.stylua, -- formatting for lua

    null_ls.builtins.formatting.isort,  -- import sorting python
    null_ls.builtins.formatting.black,  -- formatting for python
	},
}
