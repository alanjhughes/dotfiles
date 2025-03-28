local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  "nvim-lua/plenary.nvim",
  "mfussenegger/nvim-dap",

  "lewis6991/gitsigns.nvim",

  "rust-lang/rust.vim",
  "Saecki/crates.nvim",

  "tpope/vim-fugitive",
  "tpope/vim-rhubarb",
  "tpope/vim-sleuth",
  "tpope/vim-commentary",
  "tpope/vim-surround",

  { -- Autoformat
    "stevearc/conform.nvim",
    event = { "BufWritePre" },
    cmd = { "ConformInfo" },
    keys = {
      {
        "<leader>f",
        function()
          require("conform").format({ async = true, lsp_format = "fallback" })
        end,
        mode = "",
        desc = "[F]ormat buffer",
      },
    },
    opts = {
      notify_on_error = false,
      format_on_save = function(bufnr)
        -- Disable "format_on_save lsp_fallback" for languages that don't
        -- have a well standardized coding style. You can add additional
        -- languages here or re-enable it for the disabled ones.
        local disable_filetypes = { c = true, cpp = true }
        if disable_filetypes[vim.bo[bufnr].filetype] then
          return nil
        else
          return {
            timeout_ms = 500,
            lsp_format = "fallback",
          }
        end
      end,
      formatters_by_ft = {
        lua = { "stylua" },
        rust = { "rustfmt", lsp_format = "fallback" },
        javascript = { "prettierd", "prettier", stop_after_first = true },
        typescript = { "prettierd", "prettier", stop_after_first = true },
        typescriptreact = { "prettierd", "prettier", stop_after_first = true },
        json = { "prettierd", "prettier", stop_after_first = true },
      },
    },
  },

  "rcarriga/nvim-notify",

  "nvim-tree/nvim-web-devicons",
  {
    "nvim-tree/nvim-tree.lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
  },

  "folke/trouble.nvim",
  "folke/which-key.nvim",
  "b0o/schemastore.nvim",

  "bluz71/vim-nightfly-guicolors",
  "akinsho/bufferline.nvim",

  "github/copilot.vim",

  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
  },

  "windwp/nvim-autopairs",
  "windwp/nvim-ts-autotag",

  {
    "neovim/nvim-lspconfig",
    dependencies = {
      { "williamboman/mason.nvim", opts = {} },
      "williamboman/mason-lspconfig.nvim",
      "WhoIsSethDaniel/mason-tool-installer.nvim",
      { "j-hui/fidget.nvim", opts = {} },
    },
  },

  "nvim-lua/lsp_extensions.nvim",
  "hrsh7th/cmp-nvim-lsp",
  "hrsh7th/cmp-nvim-lua",
  "hrsh7th/cmp-buffer",
  "hrsh7th/cmp-path",
  "hrsh7th/cmp-cmdline",
  "hrsh7th/nvim-cmp",
  "onsails/lspkind-nvim",

  "saadparwaiz1/cmp_luasnip",
  "L3MON4D3/LuaSnip",
  "rafamadriz/friendly-snippets",

  {
    "nvimdev/lspsaga.nvim",
    dependencies = "nvim-lspconfig",
    config = function()
      require("lspsaga").setup({
        lightbulb = {
          enable = false,
        },
      })
    end,
  },

  { "mg979/vim-visual-multi", branch = "master" },

  "norcalli/nvim-colorizer.lua",
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    main = "nvim-treesitter.configs",
  },

  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.8",
    dependencies = {
      {
        "nvim-lua/plenary.nvim",
        {
          "nvim-telescope/telescope-fzf-native.nvim",

          -- `build` is used to run some command when the plugin is installed/updated.
          -- This is only run then, not every time Neovim starts up.
          build = "make",

          -- `cond` is a condition used to determine whether this plugin should be
          -- installed and loaded.
          cond = function()
            return vim.fn.executable("make") == 1
          end,
        },
      },
    },
  },
  { "nvim-telescope/telescope-ui-select.nvim" },
}, {
  install = { missing = true },
  ui = {
    border = "rounded",
  },
})
