return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    main = "nvim-treesitter.configs",
    opts = {
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
        "vimdoc",
      },
      highlight = { enable = true },
      indent = { enable = true },
    },
  },
  {
    "windwp/nvim-ts-autotag",
    event = "InsertEnter",
    opts = {
      opts = {
        enable = true,
        enable_rename = true,
        enable_close_on_slash = true,
      },
    },
  },
}
