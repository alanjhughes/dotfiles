local M = {}

M.setup = function(handlers)
	require("typescript").setup({
		disable_commands = false,
		debug = false,
		server = {
			on_attach = handlers.on_attach,
			capabilities = handlers.capabilities,
		},
	})
end

return M
