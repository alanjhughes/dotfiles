M = {}

M.setup = function(handlers)
	require("rust-tools").setup({
		tools = {
			autoSetHints = false,
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

return M
