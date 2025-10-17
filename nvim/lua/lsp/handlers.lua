local M = {}

M.setup = function()
  local signs = {
    { name = "DiagnosticSignError", text = "" },
    { name = "DiagnosticSignWarn", text = "" },
    { name = "DiagnosticSignHint", text = "" },
    { name = "DiagnosticSignInfo", text = "" },
  }

  for _, sign in ipairs(signs) do
    vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
  end

  local config = {
    virtual_text = {
      spacing = 5,
    },
    signs = true,
    update_in_insert = true,
    underline = true,
    severity_sort = true,
    float = {
      focusable = false,
      style = "minimal",
      border = "rounded",
      source = "always",
      header = "",
      prefix = "",
    },
  }

  vim.diagnostic.config(config)

  vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
    border = "rounded",
  })

  vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
    border = "rounded",
  })

  pcall(vim.api.nvim_create_user_command, "Format", function()
    vim.lsp.buf.format({ async = true })
  end, { desc = "Format current buffer with LSP" })
end

vim.keymap.set("n", "<leader>l", vim.diagnostic.open_float, { silent = true, desc = "Show diagnostics" })
vim.keymap.set("n", "<space>q", vim.diagnostic.setloclist, { silent = true, desc = "Diagnostics to loclist" })

local function lsp_highlight_document(client, bufnr)
  if not client.supports_method("textDocument/documentHighlight") then
    return
  end

  local group = vim.api.nvim_create_augroup("lsp_document_highlight_" .. bufnr, { clear = true })
  vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
    group = group,
    buffer = bufnr,
    callback = vim.lsp.buf.document_highlight,
  })
  vim.api.nvim_create_autocmd("CursorMoved", {
    group = group,
    buffer = bufnr,
    callback = vim.lsp.buf.clear_references,
  })
end

local function lsp_keymaps(bufnr)
  local function buf_map(mode, lhs, rhs, desc)
    vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, silent = true, desc = desc })
  end

  vim.bo[bufnr].omnifunc = "v:lua.vim.lsp.omnifunc"

  buf_map("n", "gr", vim.lsp.buf.references, "LSP: References")
  buf_map("n", "gD", vim.lsp.buf.declaration, "LSP: Declaration")
  buf_map("n", "gd", vim.lsp.buf.definition, "LSP: Definition")
  buf_map("n", "gi", vim.lsp.buf.implementation, "LSP: Implementation")
  buf_map("n", "<space>wa", vim.lsp.buf.add_workspace_folder, "LSP: Add workspace folder")
  buf_map("n", "<space>wr", vim.lsp.buf.remove_workspace_folder, "LSP: Remove workspace folder")
  buf_map("n", "<space>wl", function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, "LSP: List workspace folders")
  buf_map("n", "<leader>D", vim.lsp.buf.type_definition, "LSP: Type definition")
  buf_map("n", "<leader>p", function()
    vim.lsp.buf.format({ async = true })
  end, "LSP: Format buffer")
end

M.on_attach = function(client, bufnr)
  if client.supports_method("textDocument/formatting") then
    client.server_capabilities.documentFormattingProvider = false
  end
  if client.supports_method("textDocument/rangeFormatting") then
    client.server_capabilities.documentRangeFormattingProvider = false
  end

  lsp_keymaps(bufnr)
  lsp_highlight_document(client, bufnr)
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
local cmp_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if cmp_ok then
  capabilities = cmp_nvim_lsp.default_capabilities(capabilities)
end

M.capabilities = capabilities

return M
