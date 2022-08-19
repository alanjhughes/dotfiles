vim.cmd("autocmd!")

vim.opt.clipboard:append({ "unnamedplus" })
vim.scriptencoding = "utf-8"
vim.opt.encoding = "utf-8"
vim.opt.fileencoding = "utf-8"

vim.o.hidden = true
vim.o.scrolloff = 10
vim.o.tabstop = 2
vim.o.softtabstop = 2
vim.o.expandtab = true
vim.o.smartindent = true
vim.o.shiftwidth = 2
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.nu = true
vim.o.guicursor = ""
vim.o.backup = false
vim.o.termguicolors = true
vim.o.mouse = "a"
vim.o.relativenumber = true
vim.o.title = true
vim.o.updatetime = 250

vim.opt.backupskip = { "/tmp/*", "/private/tmp/*" }
vim.wo.signcolumn = "yes"
vim.wo.number = true

vim.g.mapleader = " "
vim.g.maplocalleader = " "

local highlight_group = vim.api.nvim_create_augroup("YankHighlight", { clear = true })
vim.api.nvim_create_autocmd("TextYankPost", {
	callback = function()
		vim.highlight.on_yank()
	end,
	group = highlight_group,
	pattern = "*",
})

vim.g.rustfmt_autosave = 1
vim.g.vim_jsx_pretty_highlight_close_tag = 1
vim.g.airline_powerline_fonts = 1

vim.opt.titlestring = [[%f %h%m%r%w %{v:progname}]]
