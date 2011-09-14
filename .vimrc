" Pathogen
filetype off 
call pathogen#helptags()
call pathogen#runtime_append_all_bundles()

" tab (http://py.vaults.ca/~x/python_and_vim.html)
"set tabstop=8
"set softtabstop=8
"set shiftwidth=4
set noexpandtab
set smarttab
set autoindent
set smartindent
set cindent

set nocompatible
set bs=2
set nu
set cursorline
set nomodeline
set tags=./.tags,~/.STLtags
set encoding=utf-8
set termencoding=utf-8
set fileencoding=utf-8
set fileencodings=ucs-bom,utf-8,sjis,prc,big5,latin1
syntax on

" highlight
set hlsearch
set incsearch

"highlight Comment ctermfg=darkcyan
"highlight Search term=reverse ctermbg=4 ctermfg=7
set nocp
filetype plugin on
let OmniCpp_DefaultNamespaces = ["std"]
let Tlist_Exit_OnlyWindow=1
let python_highlight_all = 1

nnoremap <F5> <ESC>:e ++enc=big5<CR>:set tenc=big5<CR>
nnoremap <F6> :GundoToggle<CR>
nnoremap <F7> :!exctags -R -f .tags --c++-kinds=+pl --c-kinds=+l --fields=+iaS --extra=+q .<CR>
nnoremap <F8> <ESC>:TlistToggle<CR>
nnoremap <F9> :tabp<CR>
nnoremap <F10> :tabn<CR>

" (down)status line
set laststatus=2
set statusline=%4*%<\ %2*[%F]
set statusline+=%4*\ %5*[enc=%{&encoding}, " encoding
set statusline+=fenc=%{&fileencoding}, " file encoding
set statusline+=tenc=%{&termencoding}, " term encoding
set statusline+=%{&fileformat}%{\"\".((exists(\"+bomb\")\ &&\ &bomb)?\",BOM\":\"\").\"\"}]%m
set statusline+=%4*%=\ %6*%y%4*\ %3*%l%4*,\ %3*%c%4*\ \<\ %2*%P%4*\ \>

" (up)tab line
set showtabline=2

"256 color scheme by yzlin
set t_Co=256
colorscheme yzlin256

" auto remove ttrailing spaces in python scripts(.py)
autocmd BufWritePre *.py normal m`:%s/\s\+$//e ``
" python smart ident
" autocmd BufRead *.py set smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class
au BufRead,BufNewFile *.py set ai et nu sw=4 ts=4 tw=79

" Neocomplete
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
