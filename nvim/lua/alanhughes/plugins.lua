local fn = vim.fn

local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  })
  vim.cmd([[packadd packer.nvim]])
end

local status, packer = pcall(require, "packer")
if not status then
  print("Packer is not installed")
  return
end

vim.cmd([[packadd packer.nvim]])

packer.startup(function(use)
  use("wbthomason/packer.nvim")

  use("nvim-lua/plenary.nvim")
  use("mfussenegger/nvim-dap")

  use("lewis6991/gitsigns.nvim")

  use("rust-lang/rust.vim")
  use("simrat39/rust-tools.nvim")
  use("Saecki/crates.nvim")

  use("tpope/vim-fugitive")
  use("tpope/vim-rhubarb")
  use("tpope/vim-sleuth")
  use("tpope/vim-commentary")
  use("tpope/vim-surround")

  use("JoosepAlviste/nvim-ts-context-commentstring")
  use({ "nvimtools/none-ls.nvim", requires = { "nvimtools/none-ls-extras.nvim", opt = false } })

  use("rcarriga/nvim-notify")
  use("stevearc/dressing.nvim")

  use("nvim-tree/nvim-web-devicons")
  use({
    "nvim-tree/nvim-tree.lua",
    requires = {
      "nvim-tree/nvim-web-devicons",
    },
  })

  use("ryanoasis/vim-devicons")
  use("folke/trouble.nvim")
  use("folke/which-key.nvim")
  use("b0o/schemastore.nvim")

  use("bluz71/vim-nightfly-guicolors")
  use("akinsho/bufferline.nvim")

  use("github/copilot.vim")

  use({
    "nvim-lualine/lualine.nvim",
    requires = { "nvim-tree/nvim-web-devicons", opt = true },
  })

  use("windwp/nvim-autopairs")
  use("windwp/nvim-ts-autotag")

  use("jose-elias-alvarez/typescript.nvim")

  use("nvim-lua/lsp_extensions.nvim")
  use("hrsh7th/cmp-nvim-lsp")
  use("hrsh7th/cmp-nvim-lua")
  use("hrsh7th/cmp-buffer")
  use("hrsh7th/cmp-path")
  use("hrsh7th/cmp-cmdline")
  use("hrsh7th/nvim-cmp")
  use("onsails/lspkind-nvim")

  use("saadparwaiz1/cmp_luasnip")
  use("L3MON4D3/LuaSnip")
  use("rafamadriz/friendly-snippets")

  use({
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    "neovim/nvim-lspconfig",
  })

  use({
    "nvimdev/lspsaga.nvim",
    after = "nvim-lspconfig",
    config = function()
      require("lspsaga").setup({
        lightbulb = {
          enable = false,
        },
      })
    end,
  })

  use({ "mg979/vim-visual-multi", branch = "master" })

  use("norcalli/nvim-colorizer.lua")
  use({
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
  })

  use("nvim-telescope/telescope.nvim")
  use({
    "nvim-telescope/telescope-fzf-native.nvim",
    run = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build",
  })

  if packer_bootstrap then
    require("packer").sync()
  end
end)
