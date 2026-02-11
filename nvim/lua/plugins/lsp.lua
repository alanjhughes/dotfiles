return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      { "mason-org/mason.nvim", opts = {} },
      "mason-org/mason-lspconfig.nvim",
      {
        "WhoIsSethDaniel/mason-tool-installer.nvim",
        opts = {
          ensure_installed = {
            "stylua",
            "rustfmt",
            "eslint_d",
            "jsonlint",
            "prettierd",
          },
          run_on_start = true,
          start_delay = 3000,
        },
      },
      { "j-hui/fidget.nvim", opts = {} },
      { "folke/lazydev.nvim", ft = "lua", opts = {} },
      "b0o/schemastore.nvim",
    },
    config = function()
      -- Diagnostic config
      vim.diagnostic.config({
        virtual_text = { spacing = 5 },
        signs = {
          text = {
            [vim.diagnostic.severity.ERROR] = "",
            [vim.diagnostic.severity.WARN] = "",
            [vim.diagnostic.severity.HINT] = "",
            [vim.diagnostic.severity.INFO] = "",
          },
        },
        update_in_insert = true,
        underline = true,
        severity_sort = true,
        float = {
          focusable = false,
          style = "minimal",
          border = "rounded",
          source = true,
          header = "",
          prefix = "",
        },
      })

      -- LSP keymaps on attach
      vim.api.nvim_create_autocmd("LspAttach", {
        callback = function(event)
          local buf = event.buf
          local client = vim.lsp.get_client_by_id(event.data.client_id)

          local function map(mode, lhs, rhs, desc)
            vim.keymap.set(mode, lhs, rhs, { buffer = buf, silent = true, desc = "LSP: " .. desc })
          end

          map("n", "gd", vim.lsp.buf.definition, "Definition")
          map("n", "gD", vim.lsp.buf.declaration, "Declaration")
          map("n", "gr", vim.lsp.buf.references, "References")
          map("n", "gi", vim.lsp.buf.implementation, "Implementation")
          map("n", "<leader>D", vim.lsp.buf.type_definition, "Type definition")
          map("n", "<leader>rn", vim.lsp.buf.rename, "Rename")
          map({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, "Code action")
          map("n", "<leader>cd", vim.diagnostic.open_float, "Line diagnostics")
          map("n", "<leader>l", vim.diagnostic.open_float, "Show diagnostics")
          map("n", "<space>q", vim.diagnostic.setloclist, "Diagnostics to loclist")
          map("n", "<space>wa", vim.lsp.buf.add_workspace_folder, "Add workspace folder")
          map("n", "<space>wr", vim.lsp.buf.remove_workspace_folder, "Remove workspace folder")
          map("n", "<space>wl", function()
            print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
          end, "List workspace folders")
          map("n", "<leader>p", function()
            vim.lsp.buf.format({ async = true })
          end, "Format buffer")

          -- Document highlight
          if client and client.supports_method("textDocument/documentHighlight") then
            local group = vim.api.nvim_create_augroup("lsp_document_highlight_" .. buf, { clear = true })
            vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
              group = group,
              buffer = buf,
              callback = vim.lsp.buf.document_highlight,
            })
            vim.api.nvim_create_autocmd("CursorMoved", {
              group = group,
              buffer = buf,
              callback = vim.lsp.buf.clear_references,
            })
          end

          -- Disable formatting from LSP (conform handles it)
          if client then
            if client.supports_method("textDocument/formatting") then
              client.server_capabilities.documentFormattingProvider = false
            end
            if client.supports_method("textDocument/rangeFormatting") then
              client.server_capabilities.documentRangeFormattingProvider = false
            end
          end
        end,
      })

      -- Server configs
      local servers = {
        rust_analyzer = {},
        ts_ls = {},
        tailwindcss = {},
        cssls = {},
        html = {},
        zls = {},
        lua_ls = {
          settings = {
            Lua = {
              diagnostics = {
                globals = { "vim" },
              },
              runtime = {
                version = "LuaJIT",
                special = {
                  reload = "require",
                },
              },
              hint = {
                enable = true,
                arrayIndex = "Disable",
                await = true,
                paramName = "Disable",
                paramType = false,
                semicolon = "Disable",
                setType = true,
              },
            },
          },
        },
        jsonls = {
          settings = {
            json = {
              schemas = require("schemastore").json.schemas(),
            },
          },
        },
      }

      local mason_lspconfig = require("mason-lspconfig")
      mason_lspconfig.setup({
        ensure_installed = vim.tbl_keys(servers),
        automatic_enable = false,
      })

      for server, config in pairs(servers) do
        vim.lsp.config(server, config)
        vim.lsp.enable(server)
      end
    end,
  },
}
