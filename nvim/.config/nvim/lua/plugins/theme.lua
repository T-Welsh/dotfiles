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
					blue = "#2186ec", -- neon_blue
					lavender = "#2f9ded", -- electric_lavender
					sapphire = "#12c3e2", -- cyber_sapphire
					sky = "#19cde6", -- neon_cyan
					teal = "#12c3e2", -- techno_teal
					green = "#1ebb2b", -- hologram_Green
					yellow = "#fdf834", -- laser_Yellow
					peach = "#f85a21", -- burnt_orange
					maroon = "#f841a0", -- hot_pink
					red = "#f85a21", -- warning_Red
					mauve = "#f6188f", -- vapourwave_Mauve
					pink = "#f841a0", -- retro_Pink
					flamingo = "#f97137", -- sunset_orange
					rosewater = "#fdf454", -- glow_yellow
				},
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
			},
			-- Add Custom Highlights for Telescope Selection
			custom_highlights = function(colors)
				return {
					-- CMP (completions)
					-- Completion menu background and text color
					Pmenu = { bg = colors.crust, fg = colors.text },
					PmenuSel = { bg = colors.surface1, fg = colors.text, bold = true }, -- Selected item
					-- Explicitly set completion window colors
					CmpNormal = { bg = colors.crust, fg = colors.text },
					CmpBorder = { bg = colors.overlay1, fg = colors.text },
					CmpSelection = { bg = colors.surface1, fg = colors.text, bold = true },

					-- Telescope
					TelescopeSelection = { bg = colors.overlay1, fg = colors.text, bold = true }, -- Change selection color
				}
			end,
		},
		init = function()
			vim.cmd("colorscheme catppuccin")
		end,
	},
}
