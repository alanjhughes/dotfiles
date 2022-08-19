local status, saga = pcall(require, "lspsaga")
if not status then
	return
end

saga.init_lsp_saga({
	server_filetype_map = {
		typescript = "typescript",
	},
})

local opts = { noremap = true, silent = true }
vim.keymap.set("n", "]d", "<Cmd>Lspsaga diagnostic_jump_next<CR>", opts)
vim.keymap.set("n", "[d", "<Cmd>Lspsaga diagnostic_jump_prev<CR>", opts)
vim.keymap.set("n", "K", "<Cmd>Lspsaga hover_doc<CR>", opts)
vim.keymap.set("n", "<leader>gf", "<Cmd>Lspsaga lsp_finder<CR>", opts)
vim.keymap.set("i", "<C-s>", "<Cmd>Lspsaga signature_help<CR>", opts)
vim.keymap.set("n", "<C-s>", "<Cmd>Lspsaga signature_help<CR>", opts)
vim.keymap.set("n", "gp", "<Cmd>Lspsaga preview_definition<CR>", opts)
vim.keymap.set("n", "<leader>rn", "<Cmd>Lspsaga rename<CR>", opts)

vim.keymap.set("n", "<leader>ca", "<Cmd>Lspsaga code_action<CR>", { silent = true })
vim.keymap.set("v", "<leader>ca", function()
	vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<C-U>", true, false, true))("<Cmd>Lspsaga range_code_action<CR>")
end, opts)
