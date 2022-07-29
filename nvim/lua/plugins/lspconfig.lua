local status_ok, lsp_installer = pcall(require, "nvim-lsp-installer")
if not status_ok then
	return
end

local lspconfig = require("lspconfig")

local handlers = require("lsp.handlers")
handlers.setup()

local function setup_rust()
	require("rust-tools").setup({
		tools = {
			autoSetHints = true,
			hover_with_actions = true,
			inlay_hints = {
				show_parameter_hints = false,
				parameter_hints_prefix = "",
				other_hints_prefix = "",
			},
		},

		server = {
			on_attach = handlers.on_attach,
			capabilities = handlers.capabilities,
			settings = {
				["rust-analyzer"] = {
					checkOnSave = {
						command = "clippy",
					},
				},
			},
		},
	})
end

local function setup_ts()
	require("typescript").setup({
		disable_commands = false,
		debug = false,
		server = {
			on_attach = handlers.on_attach,
			capabilities = handlers.capabilities
		}
	})
end

local servers = { "rust_analyzer", "tsserver", "jsonls", "pyright", "html", "remark_ls", "eslint", "sumneko_lua", "clangd", "sourcekit", "bashls" }

lsp_installer.setup({
	ensure_installed = servers,
	automatic_installation = true,
	ui = {
		icons = {
			server_installed = "✓",
			server_pending = "➜",
			server_uninstalled = "✗",
		},
	},
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
		setup_rust()
		goto continue
	end

	if server == 'tsserver' then
		setup_ts()
		goto continue
	end

	lspconfig[server].setup(opts)
	::continue::
end
