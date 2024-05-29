return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  lazy = true,
  keys = { "<C-n>", "<C-g>", "<C-b>" },
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
  },
  config = function()
    require("neo-tree").setup(
      require("configs.plugins.sidebar")
    )

    vim.keymap.set('n', '<C-n>', ':Neotree position=left toggle<CR>', { desc = "Open File Navigation" })
  end
}
