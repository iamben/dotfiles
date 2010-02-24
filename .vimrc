set nocompatible
set bs=2
set nu
set cursorline
set ai
set nomodeline
set tags=./.tags,~/.STLtags
syntax on
"highlight Comment ctermfg=darkcyan
"highlight Search term=reverse ctermbg=4 ctermfg=7
set nocp
filetype plugin on
let OmniCpp_DefaultNamespaces = ["std"]
let Tlist_Exit_OnlyWindow=1
let python_highlight_all = 1

map <F7> :!exctags -R -f .tags --c++-kinds=+pl --c-kinds=+l --fields=+iaS --extra=+q .<CR>
map <F10> <ESC>:tabn<CR>
map <F9> <ESC>:tabp<CR>
map <F8> <ESC>:TlistToggle<CR>

set laststatus=2
set statusline=%4*%<\ %2*[%F]
set statusline+=%4*\ %5*[%{&encoding} " encoding
set statusline+=%{&fileformat}%{\"\".((exists(\"+bomb\")\ &&\ &bomb)?\",BOM\":\"\").\"\"}]%m
set statusline+=%4*%=\ %6*%y%4*\ %3*%l%4*,\ %3*%c%4*\ \<\ %2*%P%4*\ \>

set showtabline=2

"256 color scheme by yzlin
set t_Co=256
colorscheme yzlin256

