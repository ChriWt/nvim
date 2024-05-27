return {
  'nvim-telescope/telescope.nvim', tag = '0.1.6',
  lazy = true,
  event = "VimEnter",
  dependencies = { 
    {
      'nvim-lua/plenary.nvim',
      lazy = true,
      event = "VimEnter",
    },
  },
}
