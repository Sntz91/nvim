vim.opt.cursorline = true
vim.opt.cursorlineopt = "screenline"
vim.opt.relativenumber = true
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.numberwidth = 5
vim.opt.termguicolors = true
vim.opt.syntax = "enable"
vim.opt.colorcolumn = "80"

-- Search
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = false

-- Highlight yank
vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})

