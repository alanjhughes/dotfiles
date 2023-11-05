local status_ok, formatter = pcall(require, "formatter")
if not status_ok then
  return
end

formatter.setup({
  logging = true,
  log_level = vim.log.levels.WARN,
  filetype = {
    lua = {
      require("formatter.filetypes.lua").stylua,
    },
    typescriptreact = {
      require("formatter.filetypes.typescriptreact").prettierd,
    },
    javascriptreact = {
      require("formatter.filetypes.javascriptreact").prettierd,
    },
    javascript = {
      require("formatter.filetypes.javascript").prettierd,
    },
  },
})
