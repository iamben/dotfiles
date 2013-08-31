" Pathogen
filetype off 
call pathogen#helptags()
call pathogen#runtime_append_all_bundles()

" tab (http://py.vaults.ca/~x/python_and_vim.html)
set tabstop=4
set softtabstop=4
set shiftwidth=4
set noexpandtab
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
set fileencodings=ucs-bom,utf-8,big5,sjis,prc,latin1
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
nnoremap <F8> <ESC>:TagbarToggle<CR>
nnoremap <F9> :tabp<CR>
nnoremap <F10> :tabn<CR>

" (down)status line
set laststatus=2
let g:Powerline_symbols = 'compatible'

" (up)tab line
set showtabline=2

"256 color scheme
set t_Co=256
colorscheme Tomorrow-Night-Bright

" auto remove ttrailing spaces in python scripts(.py)
autocmd BufWritePre *.py normal m`:%s/\s\+$//e ``
" python smart ident
" autocmd BufRead *.py set smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class
au BufRead,BufNewFile *.py set ai et nu sw=4 ts=4 tw=79
au BufRead,BufNewFile *.erl set ai et nu sw=4 ts=4 tw=79

" Neocomplete
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete

" 80 column hl
highlight OverLength ctermbg=red ctermfg=white guibg=#592929
match OverLength /\%81v.\+/

" YCM rocks! ultisnip should change its way triggering
let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"

" YCM
let g:ycm_add_preview_to_completeopt=1
let g:ycm_autoclose_preview_window_after_completion=1
let g:ycm_complete_in_comments=1
