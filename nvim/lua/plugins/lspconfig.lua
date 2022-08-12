local status_ok, masonConfig = pcall(require, "mason-lspconfig")
if not status_ok then
	
	return
end

local lspconfig = require("lspconfig")

local handlers = require("lsp.handlers")
handlers.setup()

local servers = {
	"rust_analyzer",
	"typescript-language-server",
	"jsonls",
	"html",
	"sumneko_lua",
	"clangd",
	"bashls",
}

masonConfig.setup({
	ensure_installed = servers,
	automatic_installation = true,
})

for _, server in pairs(servers) do
	local opts = {
		on_attach = handlers.on_attach,
		capabilities = handlers.capabilities,
	}

	local has_custom_opts, server_custom_opts = pcall(require, "lsp." .. server)
	if has_custom_opts then
		opts = vim.tbl_deep_extend("force", server_custom_opts, opts)
	end

	if server == "rust_analyzer" then
		require("plugins.user.rust").setup(handlers)
		goto continue
	end

	if server == "typescript-language-server" then
		require("plugins.user.ts").setup(handlers)
		goto continue
	end

	lspconfig[server].setup(opts)
	::continue::
end
