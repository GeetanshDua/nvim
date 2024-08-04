:set number
:set backspace=2
:set autoindent
:set tabstop=4
:set shiftwidth=4
:set smarttab
:set softtabstop=4
:set mouse=a
:set guifont=@Fixedsys:h20

:set novisualbell
syntax on

" Set up F5 to compile and run C/C++ programs on Windows
nnoremap <F5> :w<CR>:!gcc % -o %<.exe && %<.exe<CR>
vnoremap <F5> :w<CR>:!gcc % -o %<.exe && %<.exe<CR>

