vim.cmd("autocmd!")

vim.g.loaded = 1
vim.g.loaded_netrwPlugin = 1

vim.opt.clipboard:append({ "unnamedplus" })
vim.scriptencoding = "utf-8"
vim.opt.encoding = "utf-8"
vim.opt.fileencoding = "utf-8"

vim.opt.hidden = true
vim.opt.scrolloff = 10
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.shiftwidth = 2
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.nu = true
vim.opt.guicursor = ""
vim.opt.backup = false
vim.opt.termguicolors = true
vim.opt.mouse = "a"
vim.opt.relativenumber = true
vim.opt.title = true
vim.opt.updatetime = 250

vim.opt.hlsearch = false
vim.opt.incsearch = true

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
