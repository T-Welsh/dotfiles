return {
	{
		"williamboman/mason.nvim",
		dependencies = {
			"williamboman/mason-lspconfig.nvim", -- Bridge between Mason and LSPConfig
			"neovim/nvim-lspconfig", -- LSP configurations
		},
		opts = {
			ensure_installed = {
				"lua_ls",
				"bashls",
				"clangd",
				"ts_ls",
				"zls",
				"sqls",
				"cssls",
				"html",
				"jsonls",
				"marksman",
				"intelephense",
				"taplo",
				"yamlls",
			},
			automatic_installation = true, -- Automatically install missing servers
		},
		config = function(_, opts)
			require("mason").setup({
				auto_update = true,
			})
			require("mason-lspconfig").setup(opts)

			local lspconfig = require("lspconfig")

			-- Auto-configure all installed LSPs
			require("mason-lspconfig").setup_handlers({
				function(server_name)
					lspconfig[server_name].setup({})
				end,
			})

			-- Manually configure Bash LSP (since it's system installed via pacman)
			lspconfig.bashls.setup({})
		end,
	},

	-- Autoformatting plugin
	{
		"stevearc/conform.nvim",
		opts = {
			format_on_save = {
				timeout_ms = 500,
				lsp_fallback = true,
			},
			formatters_by_ft = {
				lua = { "stylua" },
				javascript = { "prettierd", "eslint_d" },
				typescript = { "prettierd", "eslint_d" },
				json = { "prettierd" },
				html = { "prettierd" },
				css = { "prettierd" },
				markdown = { "prettierd" },
				php = { "php-cs-fixer" },
				sh = { "shfmt" },
				sql = { "sql-formatter" },
				toml = { "taplo" },
				yaml = { "yamlfmt" },
			},
		},
	},

	-- Linting plugin
	{
		"mfussenegger/nvim-lint",
		config = function()
			require("lint").linters_by_ft = {
				lua = { "luacheck" },
				javascript = { "eslint_d" },
				typescript = { "eslint_d" },
				json = { "jsonlint" },
				html = { "tidy" },
				css = { "stylelint" },
				markdown = { "markdownlint" },
				php = { "phpstan" },
				sh = { "shellcheck" },
				sql = { "sqlfluff" },
				toml = { "taplo" },
				yaml = { "yamllint" },
			}

			-- Run linting when saving a file
			vim.api.nvim_create_autocmd({ "BufWritePost", "BufReadPost", "InsertLeave" }, {
				callback = function()
					require("lint").try_lint()
				end,
			})
		end,
	},

	-- Native LSP Code Action (Normal & Visual Mode)
	vim.keymap.set({ "n", "v" }, "<leader>ca", function()
		vim.lsp.buf.code_action()
	end, { desc = "LSP Code Action" }),
}
