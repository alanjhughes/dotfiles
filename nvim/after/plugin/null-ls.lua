local null_ls_status_ok, null_ls = pcall(require, "null-ls")
if not null_ls_status_ok then
	return
end

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics
local code_actions = null_ls.builtins.code_actions

local augroup = vim.api.nvim_create_augroup("null_ls", { clear = true })

null_ls.setup({
	on_attach = function(client, bufnr)
		if client.supports_method("textDocument/formatting") then
			vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
			vim.api.nvim_create_autocmd("BufWritePre", {
				group = augroup,
				buffer = bufnr,
				-- on 0.8, you should use vim.lsp.buf.format instead
				callback = vim.lsp.buf.formatting_sync,
			})
		end
	end,
	debug = false,
	sources = {
		formatting.prettierd.with({
			env = {
				string.format(
					"PRETTIERD_DEFAULT_CONFIG=%s",
					vim.fn.expand("~/.config/nvim/utils/linter-config/.prettierrc.json")
				),
			},
		}),
		formatting.stylua,
		formatting.shfmt,
		diagnostics.eslint_d,
		code_actions.gitsigns,
		code_actions.eslint_d,
		code_actions.gitsigns,
	},
})
