return {
  'nvim-telescope/telescope.nvim',
  dependencies = { 
    'nvim-lua/plenary.nvim',
    'nvim-telescope/telescope-fzf-native.nvim',
  },
  build = 'make',
  cmd = "Telescope",  -- Ensures it loads when using `:Telescope`
  keys = {  -- Lazy-load on keybindings
    { "<leader>ff", "<cmd>Telescope find_files<CR>", desc = "Find Files" },
    { "<leader>fg", "<cmd>Telescope live_grep<CR>", desc = "Live Grep" },
    { "<leader>fb", "<cmd>Telescope buffers<CR>", desc = "Find Buffers" },
    { "<leader>fh", "<cmd>Telescope help_tags<CR>", desc = "Find Help" },
    { "<C-p>", "<cmd>Telescope find_files<CR>", desc = "Find Files (Ctrl+P)" },
  },
  opts = {
    defaults = {
      file_ignore_patterns = { "node_modules", ".git/" },
      layout_config = { prompt_position = "top" },
      sorting_strategy = "ascending",
    },
    extensions = {
      fzf = {  -- Configure the fzf-native extension
        fuzzy = true,
        override_generic_sorter = true,
        override_file_sorter = true,
      }
    }
  },
  config = function(_, opts)
      require('telescope').setup(opts)
      require('telescope').load_extension('fzf')
  end
}
