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
    "ruby",
    "prisma",
    "cpp",
  },
  autotag = {
    enable = true,
  },
  rainbow = {
    enable = true,
    extended_mode = false,
  },
  highlight = {
    enable = true,
    use_languagetree = true,
  },
  indent = { enable = true },
  context_commentstring = {
    enable = true,
  },
})
