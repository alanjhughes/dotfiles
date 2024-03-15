local status_ok, configs = pcall(require, "nvim-treesitter.configs")
if not status_ok then
  return
end

configs.setup({
  ensure_installed = {
    "typescript",
    "javascript",
    "rust",
    "json",
    "css",
    "tsx",
    "html",
    "bash",
    "lua",
    "vim",
    "prisma",
    "cpp",
    "ruby",
    "groovy",
    "xml",
  },
  autotag = {
    enable = true,
  },
  highlight = {
    enable = true,
  },
  indent = { enable = true },
})
