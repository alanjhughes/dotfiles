local status_ok, blankline = pcall(require, "indent_blankline")
if not status_ok then
  return
end

blankline.setup({
  show_current_context = true,
})
