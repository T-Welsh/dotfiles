return {
    {
      "catppuccin/nvim",
      name = "catppuccin",
      priority = 1000, -- Ensures it loads before other UI elements
      opts = {
        flavour = "mocha", -- Options: latte, frappe, macchiato, mocha
        color_overrides = {
            mocha = {
            base = "#000000", -- Default background (Change to your preference)
            mantle = "#000000", -- Darker background
            crust = "#000000", -- Even darker background
            text = "#dad9c7", -- Main text color
            subtext1 = "#c8c5b2", -- Subtext color
            subtext0 = "#b3b1a6", -- Dimmed subtext
            surface0 = "#2186ec", -- UI elements
            surface1 = "#12c3e2", -- Slightly brighter UI elements
            surface2 = "#19cde6", -- Even brighter UI elements
            overlay0 = "#f6188f", -- Borders, secondary UI
            overlay1 = "#f841a0", -- Active borders
            overlay2 = "#f97137", -- Bright accents
            blue = "#2186ec", -- Blue (Change if needed)
            lavender = "#2f9ded", -- Lavender (Change if needed)
            sapphire = "#12c3e2", -- Cyan-Blue (Change if needed)
            sky = "#19cde6", -- Light Cyan
            teal = "#12c3e2", -- Teal
            green = "#1ebb2b", -- Green
            yellow = "#fdf834", -- Yellow
            peach = "#f85a21", -- Peach
            maroon = "#f841a0", -- Maroon
            red = "#f85a21", -- Red
            mauve = "#f6188f", -- Mauve
            pink = "#f841a0", -- Pink
            flamingo = "#f97137", -- Flamingo
            rosewater = "#fdf454", -- Rosewater
            }
        },
        integrations = {
          treesitter = true,
          native_lsp = { enabled = true },
          telescope = true,
          gitsigns = true,
          cmp = true,
          notify = true,
          nvimtree = true,
          markdown = true,
        }
      },
      init = function()
        vim.cmd("colorscheme catppuccin")
      end,
    }

}
