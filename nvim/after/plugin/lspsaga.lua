local opts = { noremap = true, silent = true }
vim.keymap.set("n", "]d", "<Cmd>Lspsaga diagnostic_jump_next<CR>", opts)
vim.keymap.set("n", "[d", "<Cmd>Lspsaga diagnostic_jump_prev<CR>", opts)
vim.keymap.set("n", "K", "<Cmd>Lspsaga hover_doc<CR>", opts)
vim.keymap.set("n", "gf", "<Cmd>Lspsaga lsp_finder<CR>", opts)
vim.keymap.set("n", "<leader>cd", "<Cmd>Lspsaga show_cursor_diagnostics<CR>", opts)
vim.keymap.set("n", "gp", "<Cmd>Lspsaga peek_definition<CR>", opts)
vim.keymap.set("n", "<leader>rn", "<Cmd>Lspsaga rename<CR>", opts)
vim.keymap.set({ "n", "t" }, "<leader>t", "<cmd>Lspsaga term_toggle<CR>", opts)

vim.keymap.set("n", "<leader>ca", "<Cmd>Lspsaga code_action<CR>", { silent = true })
vim.keymap.set("v", "<leader>ca", function()
  vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<C-U>", true, false, true))("<Cmd>Lspsaga range_code_action<CR>")
end, opts)
