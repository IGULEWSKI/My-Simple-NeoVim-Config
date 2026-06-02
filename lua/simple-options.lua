--Podstawy
vim.opt.tabstop = 2 -- Visual width of a tab
vim.opt.softtabstop = 2 -- Number of spaces a tab counts for while editing
vim.opt.shiftwidth = 2 -- Size of an indent (for the << and >> commands)
vim.opt.expandtab = true -- Turn tabs into spaces (highly recommended)
vim.opt.clipboard = "unnamedplus"
vim.opt.number = true
vim.opt.relativenumber = true
--side scrolling
vim.opt.wrap = false
--Terminal
vim.keymap.set("t", "<Esc>", [[<C-\><C-n>]], { desc = "Exit terminal mode" })
vim.keymap.set("t", "<C-w>", [[<C-\><C-n><C-w>]], { desc = "Window commands in terminal" })
--For now so i can learn how to not use arrowkeys and hjkl instead
vim.keymap.set("n", "<Up>", "<Nop>", { silent = true })
vim.keymap.set("n", "<Down>", "<Nop>", { silent = true })
vim.keymap.set("n", "<Left>", "<Nop>", { silent = true })
vim.keymap.set("n", "<Right>", "<Nop>", { silent = true })
--diagnostic
vim.diagnostic.config({
	virtual_text = true,
	signs = true,
	underline = true,
	update_in_insert = false,
	severity_sort = true,
}) --auto terminal mode
vim.api.nvim_create_autocmd({ "WinEnter", "BufWinEnter", "TermOpen" }, {
	group = vim.api.nvim_create_augroup("terminal_auto_insert", { clear = true }),
	pattern = "term://*",
	callback = function()
		vim.cmd("startinsert")
	end,
})
vim.api.nvim_create_autocmd("TextYankPost", { --Highlighting on yanking
	callback = function()
		vim.highlight.on_yank({
			higroup = "Visual",
			timeout = 300,
		})
	end,
})
-- Options about / search function
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>', { desc = 'clears hughliht after search' })
