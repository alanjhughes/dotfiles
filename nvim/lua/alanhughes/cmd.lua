vim.cmd([[colorscheme nightfly]])

vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])

vim.cmd([[
  augroup ruby_filetype
    autocmd!
    autocmd BufNewfile,BufRead Podfile,*.podspec set ft=ruby
  augroup end
]])
