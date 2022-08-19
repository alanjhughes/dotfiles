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

	use("rust-lang/rust.vim")
	use("simrat39/rust-tools.nvim")
	use("Saecki/crates.nvim")

	use("tpope/vim-fugitive")
	use("tpope/vim-rhubarb")
	use("tpope/vim-sleuth")
	use("tpope/vim-commentary")
	use("tpope/vim-surround")

	use("JoosepAlviste/nvim-ts-context-commentstring")

	use("jose-elias-alvarez/null-ls.nvim")
	use("rcarriga/nvim-notify")
	use("stevearc/dressing.nvim")

	use({ "akinsho/toggleterm.nvim", tag = "v2.*" })

	use("kyazdani42/nvim-web-devicons")
	use("kyazdani42/nvim-tree.lua")

	use("ryanoasis/vim-devicons")
	use("folke/trouble.nvim")
	use("folke/which-key.nvim")
	use("nvim-lua/popup.nvim")
	use("b0o/schemastore.nvim")

	use("airblade/vim-gitgutter")
	use("vim-airline/vim-airline")

	use("p00f/nvim-ts-rainbow")
	use("bluz71/vim-nightfly-guicolors")
	use("akinsho/bufferline.nvim")

	use("windwp/nvim-autopairs")
	use("windwp/nvim-ts-autotag")

	use("yuezk/vim-js")
	use("HerringtonDarkholme/yats.vim")
	use("maxmellon/vim-jsx-pretty")
	use("jose-elias-alvarez/typescript.nvim")
	use("lukas-reineke/indent-blankline.nvim")

	use("antoinemadec/FixCursorHold.nvim")

	use("nvim-lua/lsp_extensions.nvim")
	use("hrsh7th/cmp-nvim-lsp")
	use("hrsh7th/cmp-nvim-lua")
	use("hrsh7th/cmp-buffer")
	use("hrsh7th/cmp-path")
	use("hrsh7th/cmp-cmdline")
	use("hrsh7th/nvim-cmp")

	use("saadparwaiz1/cmp_luasnip")
	use("L3MON4D3/LuaSnip")
	use("rafamadriz/friendly-snippets")

	use({
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"neovim/nvim-lspconfig",
	})

	use("glepnir/lspsaga.nvim")

	use({ "mg979/vim-visual-multi", branch = "master" })
	use("onsails/lspkind-nvim")
	use("norcalli/nvim-colorizer.lua")
	use({
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
	})

	use("nvim-telescope/telescope.nvim")

	use("lewis6991/gitsigns.nvim")
	if packer_bootstrap then
		require("packer").sync()
	end
end)
