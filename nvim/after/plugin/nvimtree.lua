local status_ok, nvim_tree = pcall(require, "nvim-tree")
if not status_ok then
  return
end

local icons = require("user.icons")

local function on_attach(bufnr)
  local api = require("nvim-tree.api")
  api.config.mappings.default_on_attach(bufnr)

  local function opts(desc)
    return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
  end

  vim.keymap.set("n", "v", api.node.open.vertical, opts("Open VSplit"))
  vim.keymap.set("n", "h", api.node.navigate.parent_close, opts("Close Directory"))
end

nvim_tree.setup({
  on_attach = on_attach,
  update_cwd = true,
  renderer = {
    root_folder_modifier = ":t",
    indent_markers = {
      enable = false,
      icons = {
        corner = "└ ",
        edge = "│ ",
        none = "  ",
      },
    },
    icons = {
      webdev_colors = true,
      git_placement = "before",
      padding = " ",
      symlink_arrow = " ➛ ",
      show = {
        file = true,
        folder = true,
        folder_arrow = true,
        git = true,
      },
      glyphs = {
        default = "",
        symlink = "",
        folder = {
          arrow_open = icons.ui.ChevronShortDown,
          arrow_closed = icons.ui.ChevronShortRight,
          default = "",
          open = "",
          empty = "",
          empty_open = "",
          symlink = "",
          symlink_open = "",
        },
        git = {
          unstaged = "",
          staged = "S",
          unmerged = "",
          renamed = "➜",
          untracked = "U",
          deleted = "",
          ignored = "◌",
        },
      },
    },
  },
  diagnostics = {
    enable = true,
    icons = {
      hint = icons.diagnostics.Hint,
      info = icons.diagnostics.Information,
      warning = icons.diagnostics.Warning,
      error = icons.diagnostics.Error,
    },
  },
  update_focused_file = {
    enable = true,
    update_cwd = true,
    ignore_list = {},
  },
  git = {
    enable = true,
    ignore = false,
    timeout = 500,
  },
  actions = {
    change_dir = {
      restrict_above_cwd = true,
    },
  },
  view = {
    width = 40,
    side = "left",
    number = false,
    relativenumber = false,
  },
})
