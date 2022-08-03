set nocompatible 
set hidden
set scrolloff=8
set signcolumn=yes
set tabstop=2 softtabstop=2
set expandtab
set smartindent
set shiftwidth=2
set ignorecase smartcase
set updatetime=100
set nu
set guicursor=
set nohlsearch
set nobackup
set nowritebackup
set noswapfile
set mouse=a
set relativenumber

call plug#begin()

Plug 'nvim-lua/plenary.nvim'

Plug 'rust-lang/rust.vim'
Plug 'simrat39/rust-tools.nvim'

Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'      
Plug 'tpope/vim-sleuth'      
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'

Plug 'JoosepAlviste/nvim-ts-context-commentstring'

Plug 'jose-elias-alvarez/null-ls.nvim'
Plug 'rcarriga/nvim-notify'
Plug 'stevearc/dressing.nvim' 
Plug 'Saecki/crates.nvim'

Plug 'akinsho/toggleterm.nvim', {'tag' : 'v2.*'}

Plug 'neovim/nvim-lspconfig'

Plug 'kyazdani42/nvim-web-devicons'
Plug 'kyazdani42/nvim-tree.lua'

Plug 'ryanoasis/vim-devicons'
Plug 'folke/trouble.nvim'
Plug 'folke/which-key.nvim'
Plug 'nvim-lua/popup.nvim'
Plug 'b0o/schemastore.nvim'

Plug 'airblade/vim-gitgutter'
Plug 'vim-airline/vim-airline'

Plug 'p00f/nvim-ts-rainbow'
Plug 'bluz71/vim-nightfly-guicolors'
Plug 'morhetz/gruvbox'
Plug 'akinsho/bufferline.nvim'
 
Plug 'windwp/nvim-autopairs'
Plug 'windwp/nvim-ts-autotag'

Plug 'yuezk/vim-js'
Plug 'HerringtonDarkholme/yats.vim'
Plug 'maxmellon/vim-jsx-pretty' 
Plug 'jose-elias-alvarez/typescript.nvim'
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'

Plug 'github/copilot.vim'
Plug 'antoinemadec/FixCursorHold.nvim'

Plug 'nvim-lua/lsp_extensions.nvim'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-nvim-lua'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/nvim-cmp'

Plug 'saadparwaiz1/cmp_luasnip'
Plug 'L3MON4D3/LuaSnip'
Plug 'rafamadriz/friendly-snippets'

Plug 'williamboman/nvim-lsp-installer'

Plug 'onsails/lspkind-nvim'
Plug 'norcalli/nvim-colorizer.lua'
 
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-treesitter/nvim-treesitter-textobjects'  

Plug 'nvim-telescope/telescope.nvim'

Plug 'lewis6991/gitsigns.nvim'

call plug#end()

let mapleader = " "

tnoremap <Esc> <C-\><C-n>

let g:cursorhold_updatetime = 100
let g:rustfmt_autosave = 1
let g:airline_powerline_fonts = 1
let g:vim_jsx_pretty_highlight_close_tag = 1

if (has('nvim'))

  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif

if (has("termguicolors")) 
  set termguicolors
endif

autocmd BufNewFile,BufRead *.tsx,*.jsx set filetype=typescriptreact

colorscheme gruvbox 
filetype plugin indent on
syntax enable 

lua require("plugins")
