set nocompatible 
set hidden
set scrolloff=8
set signcolumn=yes
set tabstop=2 softtabstop=2
set expandtab
set smartindent
set shiftwidth=2
set ignorecase
set updatetime=100
set nu
set guicursor=
set nohlsearch
set nobackup
set nowritebackup
set noswapfile
set termguicolors
set mouse=a
set smartcase
set relativenumber

call plug#begin()

Plug 'rust-lang/rust.vim'
Plug 'simrat39/rust-tools.nvim'

Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-eunuch'

Plug 'tpope/vim-commentary'
Plug 'JoosepAlviste/nvim-ts-context-commentstring'

Plug 'tpope/vim-unimpaired'
Plug 'jose-elias-alvarez/null-ls.nvim'

Plug 'editorconfig/editorconfig-vim'
Plug 'akinsho/bufferline.nvim'
Plug 'akinsho/toggleterm.nvim'

Plug 'preservim/nerdtree'
Plug 'xuyuanp/nerdtree-git-plugin'

Plug 'neovim/nvim-lspconfig'

Plug 'kyazdani42/nvim-web-devicons'
Plug 'ryanoasis/vim-devicons'

Plug 'airblade/vim-gitgutter'
Plug 'vim-airline/vim-airline'

Plug 'nvim-lua/lsp_extensions.nvim'
Plug 'bluz71/vim-nightfly-guicolors'
Plug 'mattn/emmet-vim'
Plug 'windwp/nvim-autopairs'

Plug 'pangloss/vim-javascript'  
Plug 'leafgarland/typescript-vim'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'jparise/vim-graphql'

Plug 'github/copilot.vim'
Plug 'antoinemadec/FixCursorHold.nvim'

Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-nvim-lua'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'saadparwaiz1/cmp_luasnip'
Plug 'hrsh7th/nvim-cmp'

Plug 'williamboman/nvim-lsp-installer'

Plug 'L3MON4D3/LuaSnip'
Plug 'rafamadriz/friendly-snippets'
Plug 'hrsh7th/vim-vsnip'
Plug 'hrsh7th/vim-vsnip-integ'

Plug 'tamago324/nlsp-settings.nvim'

Plug 'onsails/lspkind-nvim'

Plug 'norcalli/nvim-colorizer.lua'

Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'           

Plug 'lewis6991/gitsigns.nvim'

call plug#end()

let mapleader = " "

tnoremap <Esc> <C-\><C-n>

let g:rustfmt_autosave = 1
let g:cursorhold_updatetime = 100

let g:vsnip_filetypes = {}
let g:vsnip_filetypes.javascriptreact = ['javascript']
let g:vsnip_filetypes.typescriptreact = ['typescript']

let g:airline_powerline_fonts = 1

set background=dark
colorscheme nightfly 
filetype plugin indent on
syntax enable 

lua require("plugins")
lua require("nvim-autopairs").setup()
lua require("colorizer").setup()
lua require("bufferline").setup{}
