return {
    "nvim-telescope/telescope.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim",
        {
            "nvim-telescope/telescope-fzf-native.nvim",
            -- build = "make"
        },
        "nvim-telescope/telescope-ui-select.nvim",
    },
    cmd = "Telescope",
    keys = {
        { "<leader>ff", "<cmd>Telescope find_files<CR>",  desc = "Find Files" },
        { "<leader>fg", "<cmd>Telescope live_grep<CR>",   desc = "Live Grep" },
        { "<leader>fb", "<cmd>Telescope buffers<CR>",     desc = "Find Buffers" },
        { "<leader>fh", "<cmd>Telescope help_tags<CR>",   desc = "Find Help" },
        { "<C-p>",      "<cmd>Telescope find_files<CR>",  desc = "Find Files (Ctrl+p)" },
        { "<C-d>",      "<cmd>Telescope diagnostics<CR>", desc = "Diagnostics (Ctrl+d)" },
        { "<C-g>",      "<cmd>Telescope live_grep<CR>",   desc = "Live Grep (Ctrl+g)" },
    },
    opts = {
        defaults = {
            file_ignore_patterns = { "node_modules", ".git/" },
            layout_config = { prompt_position = "top" },
            sorting_strategy = "ascending",
        },
        pickers = {
            find_files = {
                hidden = true,
                follow = true,
            },
        },
        extensions = {
            fzf = {
                fuzzy = true,
                override_generic_sorter = true,
                override_file_sorter = true,
            },
        },
    },
    config = function(_, opts)
        local telescope = require("telescope")
        telescope.setup(opts)
        telescope.load_extension("fzf")
        telescope.load_extension("ui-select")
    end,
}
