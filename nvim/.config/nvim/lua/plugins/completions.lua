return {
	"hrsh7th/nvim-cmp", -- Auto-completion engine
	dependencies = {
		"hrsh7th/cmp-nvim-lsp", -- LSP completion
		"hrsh7th/cmp-buffer", -- Buffer completion
		"hrsh7th/cmp-path", -- Path completion
		"hrsh7th/cmp-cmdline", -- Command-line completion
		"saadparwaiz1/cmp_luasnip", -- Snippet completion
		"L3MON4D3/LuaSnip", -- Snippet engine
		"rafamadriz/friendly-snippets", -- Pre-configured snippets
	},
	config = function()
		local cmp = require("cmp")
		local luasnip = require("luasnip")

		-- Load friendly snippets
		require("luasnip.loaders.from_vscode").lazy_load()

		cmp.setup({
			snippet = {
				expand = function(args)
					luasnip.lsp_expand(args.body) -- Enable LuaSnip
				end,
			},
			mapping = cmp.mapping.preset.insert({
				["<C-Space>"] = cmp.mapping.complete(), -- Open completion menu

				["<CR>"] = cmp.mapping(function(fallback)
					if cmp.visible() and cmp.get_selected_entry() then
						local entry = cmp.get_selected_entry()
						if entry.source.name == "luasnip" then
							luasnip.expand()
						else
							cmp.confirm({ select = false })
						end
					else
						fallback()
					end
				end, { "i", "s" }),

				["<Tab>"] = cmp.mapping.select_next_item(), -- Next suggestion
				["<S-Tab>"] = cmp.mapping.select_prev_item(), -- Previous suggestion
			}),
			sources = cmp.config.sources({
				{ name = "nvim_lsp" }, -- LSP-based completions
				{ name = "luasnip" }, -- Snippet completions
				{ name = "buffer" }, -- Buffer completions
				{ name = "path" }, -- File path completions
			}),
		})

		-- Enable completion for command mode
		cmp.setup.cmdline("/", {
			mapping = cmp.mapping.preset.cmdline(),
			sources = { { name = "buffer" } },
		})

		cmp.setup.cmdline(":", {
			mapping = cmp.mapping.preset.cmdline(),
			sources = cmp.config.sources({
				{ name = "path" },
				{ name = "cmdline" },
			}),
		})
	end,
}
