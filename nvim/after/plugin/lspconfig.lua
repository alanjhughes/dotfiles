local mason_ok, mason_lspconfig = pcall(require, "mason-lspconfig")
if not mason_ok then
  return
end

local handlers = require("lsp.handlers")
handlers.setup()

local servers = {
  "rust_analyzer",
  "ts_ls",
  "tailwindcss",
  "jsonls",
  "cssls",
  "lua_ls",
  "html",
  "zls",
}

mason_lspconfig.setup({
  ensure_installed = servers,
  automatic_enable = false,
})

for _, server in ipairs(servers) do
  local config = {
    on_attach = handlers.on_attach,
    capabilities = handlers.capabilities,
  }

  local has_custom_opts, custom_opts = pcall(require, "lsp." .. server)
  if has_custom_opts then
    config = vim.tbl_deep_extend("force", config, custom_opts)
  end

  vim.lsp.config(server, config)
  vim.lsp.enable(server)
end
