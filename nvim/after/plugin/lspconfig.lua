local status_ok, masonConfig = pcall(require, "mason-lspconfig")
if not status_ok then
  return
end

local masonStatus, mason = pcall(require, "mason")
if not masonStatus then
  return
end

local lsp_status_ok, lspconfig = pcall(require, "lspconfig")
if not lsp_status_ok then
  return
end

local handlers = require("lsp.handlers")
handlers.setup()

local servers = {
  "rust_analyzer",
  "tsserver",
  "jsonls",
  "solargraph",
  "html",
  "lua_ls",
}

mason.setup()
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
    require("user.rust").setup(handlers)
    goto continue
  end

  if server == "tsserver" then
    require("user.ts").setup(handlers)
    goto continue
  end

  lspconfig[server].setup(opts)
  ::continue::
end
