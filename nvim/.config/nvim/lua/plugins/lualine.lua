return {
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    opts = {
      options = {
        theme = "powerline_dark", -- You can replace this with a custom theme later
        -- section_separators = { left = "", right = "" },
        -- component_separators = { left = "", right = "" },
        icons_enabled = true,
      }
    }
  }
}

