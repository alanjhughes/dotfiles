local null_ls_status_ok, null_ls = pcall(require, "null-ls")
if not null_ls_status_ok then
  return
end

local formatting = null_ls.builtins.formatting
local code_actions = null_ls.builtins.code_actions

-- if you want to set up formatting on save, you can use this as a callback
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

-- add to your shared on_attach callback
local on_attach = function(client, bufnr)
  if client.supports_method("textDocument/formatting") then
    vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
    vim.api.nvim_create_autocmd("BufWritePre", {
      group = augroup,
      buffer = bufnr,
      callback = function()
        vim.lsp.buf.format({
          bufnr = bufnr,
          filter = function(client)
            return client.name == "null-ls"
          end,
        })
      end,
    })
  end
end

null_ls.setup({
  on_attach = on_attach,
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
    require("none-ls.diagnostics.eslint_d"),
    require("none-ls.code_actions.eslint_d"),
    formatting.stylua,
    formatting.shfmt,
    code_actions.gitsigns,
  },
  debounce = 100,
})
