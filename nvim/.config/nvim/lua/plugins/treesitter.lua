return {
  'nvim-treesitter/nvim-treesitter',
  build = ':TSUpdate', -- Automatically update Tree-sitter parsers after installation
  event = { "BufReadPre", "BufNewFile" }, -- Lazy-load Tree-sitter when opening a file
  opts = {
    ensure_installed = { 
        "lua",
        "vim",
        "vimdoc",
        "bash",
        "c",
        "cpp",
        "python",
        "javascript",
        "typescript",
        "json",
        "html",
        "css",
        "zig",
        "php",
        "sql",
        "yaml",
        "toml",
        "markdown",
        "markdown_inline"
    }, -- Add languages you use
    highlight = {
      enable = true, -- Enable syntax highlighting
      additional_vim_regex_highlighting = false, -- Disable Vim regex highlighting for better performance
    },
    indent = { enable = true }, -- Enable automatic indentation
  }
}
