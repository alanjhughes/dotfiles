local snip_status_ok, telescope = pcall(require, "telescope")
if not snip_status_ok then
  return
end

telescope.setup({
  defaults = {
    file_ignore_patterns = { "node_modules" },
  },
  extensions = {
    ["ui-select"] = {
      require("telescope.themes").get_dropdown(),
    },
  },
})

telescope.load_extension("fzf")
telescope.load_extension("ui-select")
