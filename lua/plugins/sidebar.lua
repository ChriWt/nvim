return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  lazy = true,
  keys = {"<C-n>"},
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
  },
  config = function()
    vim.keymap.set('n', '<C-n>', ':Neotree<CR>', { desc = "Open File Navigation" })

    require("neo-tree").setup(
      require("configs.plugins.sidebar")
    )
  end
}
