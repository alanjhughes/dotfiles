return {
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
      options = {
        icons_enabled = true,
        theme = "nightfly",
        section_separators = { left = "", right = "" },
        component_separators = { left = "", right = "" },
        disabled_filetypes = {},
      },
      sections = {
        lualine_a = { "mode" },
        lualine_b = { "branch" },
        lualine_c = {
          {
            "filename",
            file_status = true,
            path = 0,
          },
        },
        lualine_x = {
          {
            "diagnostics",
            sources = { "nvim_diagnostic" },
            symbols = { error = " ", warn = " ", info = " ", hint = " " },
          },
          "filetype",
        },
        lualine_y = { "progress" },
        lualine_z = { "location" },
      },
      inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {
          {
            "filename",
            file_status = true,
            path = 1,
          },
        },
        lualine_x = { "location" },
        lualine_y = {},
        lualine_z = {},
      },
      tabline = {},
      extensions = { "fugitive" },
      winbar = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { "filename" },
        lualine_x = {},
        lualine_y = {},
        lualine_z = {},
      },
    },
  },
  {
    "akinsho/bufferline.nvim",
    event = "VeryLazy",
    keys = {
      { "[b", "<cmd>BufferLineCyclePrev<CR>", desc = "Prev buffer" },
      { "]b", "<cmd>BufferLineCycleNext<CR>", desc = "Next buffer" },
      { "cb", "<cmd>BufferLinePickClose<CR>", desc = "Pick close buffer" },
      { "gb", "<cmd>BufferLinePick<CR>", desc = "Pick buffer" },
      { "cl", "<cmd>BufferLineCloseLeft<CR>", desc = "Close left buffers" },
      { "cr", "<cmd>BufferLineCloseRight<CR>", desc = "Close right buffers" },
      { "co", "<cmd>BufferLineCloseOthers<CR>", desc = "Close other buffers" },
      { "bd", "<cmd>bdelete<CR>", desc = "Delete buffer" },
    },
    opts = {
      options = {
        numbers = "none",
        close_command = "bd %d",
        right_mouse_command = "bd %d",
        left_mouse_command = "buffer %d",
        middle_mouse_command = nil,
        indicator = {
          icon = "▎",
          style = "icon",
        },
        buffer_close_icon = "",
        modified_icon = "●",
        close_icon = "",
        left_trunc_marker = "",
        right_trunc_marker = "",
        max_name_length = 30,
        max_prefix_length = 30,
        tab_size = 21,
      },
    },
  },
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {
      plugins = {
        marks = true,
        registers = true,
        spelling = { enabled = false, suggestions = 20 },
        presets = {
          operators = true,
          motions = true,
          text_objects = true,
          windows = true,
          nav = true,
          z = true,
          g = true,
        },
      },
      icons = {
        breadcrumb = "»",
        separator = "➜",
        group = "+",
      },
      replace = {
        scroll_down = "<c-d>",
        scroll_up = "<c-u>",
      },
      win = {
        border = "none",
        padding = { 2, 2, 2, 2 },
        wo = { winblend = 10 },
      },
      layout = {
        height = { min = 4, max = 25 },
        width = { min = 20, max = 50 },
        spacing = 3,
        align = "left",
      },
      show_help = true,
      show_keys = true,
    },
  },
  {
    "NvChad/nvim-colorizer.lua",
    event = "BufReadPost",
    opts = {
      user_default_options = {
        names = false,
      },
    },
    config = function(_, opts)
      require("colorizer").setup(opts)
    end,
  },
}
