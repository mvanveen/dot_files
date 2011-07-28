let mapleader = ","

colorscheme wombat256

""set nocompatible
set showcmd
set showmatch

set number
set ruler
syntax on

" Whitespace stuff
set nowrap
set tabstop=2
set shiftwidth=2
set softtabstop=2
set backspace=indent,eol,start
set expandtab
set autoindent
set smartindent
set smarttab
map <F2> :%retab <CR>
""set list listchars=tab:\ \ ,trail:·

" Searching
set hlsearch
set incsearch
set ignorecase
set smartcase

" Tab completion
set wildmode=list:longest,list:full
set wildignore+=*.o,*.obj,.git,*.rbc

" Status bar
set laststatus=2

" NERDTree configuration
let NERDTreeIgnore=['\.rbc$', '\~$']
map <Leader>n :NERDTreeToggle<CR>

" Command-T configuration
let g:CommandTMaxHeight=20

" ZoomWin configuration
map <Leader>z :ZoomWin<CR>

" CTags
map <Leader>rt :!ctags --extra=+f -R *<CR><CR>

" Remember last location in file
""if has("autocmd")
""  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
""    \| exe "normal g'\"" | endif
""endif

""function s:setupWrapping()
""  set wrap
""  set wm=2
""  set textwidth=72
""endfunction

""function s:setupMarkup()
""  call s:setupWrapping()
""  map <buffer> <Leader>p :Mm <CR>
""endfunction

" make and python use real tabs
au FileType make                                     set noexpandtab
""au FileType python                                   set noexpandtab

" Thorfile, Rakefile and Gemfile are Ruby
""au BufRead,BufNewFile {Gemfile,Rakefile,Thorfile,config.ru}    set ft=ruby

" md, markdown, and mk are markdown and define buffer-local preview
""au BufRead,BufNewFile *.{md,markdown,mdown,mkd,mkdn} call s:setupMarkup()

""au BufRead,BufNewFile *.txt call s:setupWrapping()

" allow backspacing over everything in insert mode
""set backspace=indent,eol,start

" load the plugin and indent settings for the detected filetype
"filetype plugin indent on
filetype on
filetype plugin on 
" Opens an edit command with the path of the currently edited file filled in
" Normal mode: <Leader>e
map <Leader>e :e <C-R>=expand("%:p:h") . "/" <CR>

" Opens a tab edit command with the path of the currently edited file filled in
" Normal mode: <Leader>t
map <Leader>te :tabe <C-R>=expand("%:p:h") . "/" <CR>

" Inserts the path of the currently edited file into a command
" Command mode: Ctrl+P
cmap <C-P> <C-R>=expand("%:p:h") . "/" <CR>

" Unimpaired configuration
" Bubble single lines
nmap <C-Up> [e
nmap <C-Down> ]e
" Bubble multiple lines
vmap <C-Up> [egv
vmap <C-Down> ]egv

" Use modeline overrides
""set modeline
""set modelines=10

" Default color scheme
color dante

" Include user's local vim config
if filereadable(expand("~/.vimrc.local"))
  source ~/.vimrc.local
endif

"Directories for swp files
set backupdir=~/.vim/backup
set directory=~/.vim/backup

"
" Tabline
"
if exists("+showtabline")
  function! MyTabLine()
    let s = ''
    let t = tabpagenr()
    let i = 1

    while i <= tabpagenr('$')
      let buflist = tabpagebuflist(i)
      let winnr = tabpagewinnr(i)
      let s .= '%' . i . 'T'
      let s .= (i == t ? '%1*' : '%2*')
      let s .= (i == t ? '%#TabLineSel#' : '%#TabLine#')
      let file = bufname(buflist[winnr - 1])
      let file = fnamemodify(file, ':p:t')
      let file = (file == '') ? '[No Name]' : file
      let s .= ' ' . file . ' '
      let s .= winnr
      let s .= (getbufvar(buflist[winnr - 1], '&modified') ? '+ ' : ' ')
      let i = i + 1
    endwhile
    let s .= '%T%#TabLineFill#%='
    let s .= (tabpagenr('$') > 1 ? '%999XX' : 'X')
    return s
  endfunction
  set stal=2
  set tabline=%!MyTabLine()
endif

autocmd VimEnter * NERDTree
autocmd VimEnter * wincmd p

nmap <Leader>fb :tabnew<CR>:.!python ~/Desktop/feedMurder.py<CR>
nmap <Leader>dn :.!python -c 'import datetime; print datetime.datetime.now()'<CR>

