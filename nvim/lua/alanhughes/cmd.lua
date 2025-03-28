vim.cmd([[colorscheme nightfly]])

vim.cmd([[
  augroup ruby_filetype
    autocmd!
    autocmd BufNewfile,BufRead Podfile,*.podspec set ft=ruby
  augroup end
]])
