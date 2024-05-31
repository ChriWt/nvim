return {
  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.6',
    lazy = true,
    keys = { "<leader>e", "<leader>fi", "<leader>fo", "<leader>th", "<leader>hh" },
    dependencies = {
      {
        'nvim-lua/plenary.nvim',
        lazy = true,
        keys = { "<leader>e" },
      },
    },
    config = function()
      require("configs.keymaps.file_explorer")
      require('telescope').setup{
        defaults = {
          file_ignore_patterns = {
            "node_modules", "build", "venv", ".venv"
          },
        },
      }
    end
  },
  {
    'nvim-telescope/telescope-ui-select.nvim',
    lazy = true,
    keys = { "<leader>e", "<leader>fi", "<leader>fo", "<leader>th", "<leader>hh" },
    event = "BufReadPre",
    config = function()
      require("telescope").setup({
        extensions = {
          ["ui-select"] = {
            require("telescope.themes").get_dropdown {}
          }
        }
      })

      require("telescope").load_extension("ui-select")
    end
  }
}
