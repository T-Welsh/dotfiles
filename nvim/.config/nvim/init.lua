vim.cmd("set expandtab")
vim.cmd("set tabstop=4")
vim.cmd("set softtabstop=4")
vim.cmd("set shiftwidth=4")

-- Set line numbers
vim.opt.number = true -- Show absolute line number on current line
vim.api.nvim_create_autocmd("InsertEnter", {
	callback = function()
		vim.opt.relativenumber = false -- Absolute numbers in insert mode
	end,
})

vim.api.nvim_create_autocmd("InsertLeave", {
	callback = function()
		vim.opt.relativenumber = true -- Relative numbers in normal mode
	end,
})

-- Floating diagnostics on current line
vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float, { desc = "Line Diagnostics" })

-- Enable clipboard for mouse cut/paste.
-- Enable clipboard support via win32yank

require("config.lazy")
