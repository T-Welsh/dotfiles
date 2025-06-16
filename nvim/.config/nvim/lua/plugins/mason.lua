return {
    {
        "williamboman/mason.nvim",
        build = ":MasonUpdate",
        config = true,
    },
    {
        "williamboman/mason-lspconfig.nvim",
        dependencies = {
            "williamboman/mason.nvim",
            "neovim/nvim-lspconfig",
        },
        opts = {
            ensure_installed = {
                "rust_analyzer",
                "sqls",
                "taplo",
                "yamlls",
                "intelephense",
                "html",
                "cssls",
                "jsonls",
                "lua_ls",
                "bashls",
            },
            automatic_installation = true,
            handlers = {
                function(server_name)
                    require("lspconfig")[server_name].setup({})
                end,
            },
        },
        config = function(_, opts)
            require("mason-lspconfig").setup(opts)
        end,
    },
    -- Formatters with conform.nvim
    {
        "stevearc/conform.nvim",
        opts = {
            format_on_save = {
                timeout_ms = 500,
                lsp_fallback = true,
            },
            formatters_by_ft = {
                lua = { "stylua" },
                php = { "php-cs-fixer" },
                html = { "prettierd" },
                css = { "prettierd" },
                javascript = { "prettierd" },
                json = { "prettierd" },
                markdown = { "prettierd" },
                sh = { "shfmt" },
                sql = { "sql-formatter" },
                toml = { "taplo" },
                yaml = { "yamlfmt" },
            },
        },
    },

    -- Linters with nvim-lint
    {
        "mfussenegger/nvim-lint",
        config = function()
            require("lint").linters_by_ft = {
                lua = { "luacheck" },
                php = { "phpstan" },
                javascript = { "eslint_d" },
                json = { "jsonlint" },
                markdown = { "markdownlint" },
                sh = { "shellcheck" },
                css = { "stylelint" },
                yaml = { "yamllint" },
                sql = { "sqlfluff" },
            }

            vim.api.nvim_create_autocmd({ "BufWritePost", "BufReadPost", "InsertLeave" }, {
                callback = function()
                    require("lint").try_lint()
                end,
            })
        end,
    },
}
