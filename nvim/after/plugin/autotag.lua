local status, autotag = pcall(require, "nvim-ts-autotag")
if not status then
  return
end

autotag.setup({
  opts = {
    enable = true,
    enable_rename = true,
    enable_close_on_slash = true,
  },
})
