return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
    "MunifTanjim/nui.nvim",
    -- {
    --   "3rd/image.nvim",
    --   config = true,
    -- }, -- Optional image support disabled for now
  },
  cmd = "Neotree", -- Lazy-load when running :Neotree
  keys = {
    { "<leader>e", "<cmd>Neotree toggle<CR>", desc = "Toggle Neo-tree" },
    { "<C-e>", "<cmd>Neotree toggle<CR>", desc = "Toggle Neo-tree" },
    { "<leader>o", function()
        if vim.bo.filetype == "neo-tree" then
          vim.cmd("wincmd p")  -- If in Neo-tree, go back to the editor
        else
          vim.cmd("Neotree focus")  -- If in the editor, focus Neo-tree
        end
      end, desc = "Toggle Neo-tree Focus" },
  },
  opts = {
    close_if_last_window = true, -- Close Neo-tree if it's the last window
    filesystem = {
      follow_current_file = {
        enabled = true,  -- Focus on current file when opening Neo-tree
      },
      hijack_netrw = true, -- Replace default file explorer
      filtered_items = {
        visible = true, -- Show hidden files by default
        hide_dotfiles = false,
        hide_gitignored = true,
      },
    },
    git_status = {
      enabled = true,
    },
    window = {
      width = 40,
      mappings = {
        ["l"] = "open",
        ["h"] = "close_node",
        ["<CR>"] = "open",
        ["o"] = "open",
        ["s"] = "open_split",
        ["v"] = "open_vsplit",
        ["r"] = "rename",
      },
    },
  },
}

