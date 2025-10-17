local status_ok, schemastore = pcall(require, "schemastore")
if not status_ok then
  return {}
end

local opts = {
  settings = {
    json = {
      schemas = schemastore.json.schemas(),
    },
  },
  commands = {
    Format = {
      function()
        vim.lsp.buf.format({ async = true })
      end,
    },
  },
}

return opts
