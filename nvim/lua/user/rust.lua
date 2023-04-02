M = {}

M.setup = function(handlers)
  require("rust-tools").setup({
    tools = {
      inlay_hints = {
        auto = false,
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
          check = {
            command = "clippy",
          },
          procMacro = {
            enable = true,
          },
        },
      },
    },

    dap = {
      adapter = {
        type = "executable",
        command = "lldb-vscode",
        name = "rt_lldb",
      },
    },
  })
end

return M
