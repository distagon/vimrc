set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
" ---------------------------------------------------------------------
" The bundles you install will be listed here
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" fancy status line
Bundle 'bling/vim-airline'
  let g:airline_theme = 'light'
  set laststatus=2
  let g:airline_detect_modified=1
  let g:airline_detect_paste=1
  let g:airline_detect_iminsert=1
  let g:airline_inactive_collapse=1
if has("gui_running")	" GUI color and font settings
  let g:airline_powerline_fonts=1
  let g:Powerline_symbols = 'fancy'
else
  let g:airline_left_sep=''
  let g:airline_right_sep=''
endif
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" csv file
"Bundle 'chrisbra/csv.vim'
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" like Sublime Text's awesome multiple selection feature
Bundle 'terryma/vim-multiple-cursors'
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 
Bundle 'sjl/gundo.vim'
" <F3>: Gundo
nnoremap <F3> :<C-u>GundoToggle<CR>
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" autocompletion library
Bundle 'davidhalter/jedi-vim'
let g:jedi#completions_command = "<C-K>"
Bundle 'msanders/snipmate.vim'
"Bundle 'Shougo/neocomplete'
"Bundle 'Shougo/neosnippet'
"Bundle 'Shougo/neosnippet-snippets'
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" syntax checking
Bundle 'scrooloose/syntastic'
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 
Bundle 'Shougo/neomru.vim'
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 
Bundle 'Shougo/unite.vim'
let g:unite_prompt='» '
let g:unite_enable_start_insert=1
let g:unite_source_history_yank_enable =1
let g:unite_source_file_mru_limit = 200
"call unite#filters#matcher_default#use(['matcher_fuzzy'])
"call unite#filters#sorter_default#use(['sorter_rank'])
nnoremap <silent> ,uy :<C-u>Unite history/yank<CR>
nnoremap <silent> ,ub :<C-u>Unite buffer<CR>
nnoremap <silent> ,uf :<C-u>UniteWithBufferDir -buffer-name=files file<CR>
nnoremap <silent> ,ur :<C-u>Unite -buffer-name=register register<CR>
nnoremap <silent> ,uu :<C-u>Unite file_mru buffer<CR>
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" theme
Bundle 'reedes/vim-colors-pencil'
Bundle 'tomasr/molokai'
Bundle 'junegunn/seoul256.vim'
let g:seoul256_background = 233

" ---------------------------------------------------------------------
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList          - list configured plugins
" :PluginInstall(!)    - install (update) plugins
" :PluginSearch(!) foo - search (or refresh cache first) for foo
" :PluginClean(!)      - confirm (or auto-approve) removal of unused plugins
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

"--------------------------------------------------------------------------- 
"" General Settings
"--------------------------------------------------------------------------- 
set bs=2		" allow backspacing over everything in insert mode
set history=50		" keep 50 lines of command line history
set ruler		" show the cursor position all the time
set autoread		" auto read when file is changed from outside
set hlsearch
set ignorecase
set smartcase
set cursorline
set showmatch		" Cursor shows matching ) and }
"set autoindent		" auto indentation
set incsearch		" incremental search
set nobackup		" no *~ backup files
" size of a hard tabstop
set tabstop=4
" size of an "indent"
set shiftwidth=4
" a combination of spaces and tabs are used to simulate tab stops at a width
" other than the (hard)tabstop
set softtabstop=4
" make "tab" insert indents instead of tabs at the beginning of a line
set smarttab
" always uses spaces instead of tab characters
set expandtab
syntax on


" disable sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

filetype indent on    " Enable filetype-specific indenting
filetype plugin on    " Enable filetype-specific plugins


" auto reload vimrc when editing it
autocmd! bufwritepost .vimrc source ~/.vimrc

set fillchars+=stl:\ ,stlnc:\

" ignore these files while expanding wild chars
set wildignore=*.o,*.class,*.pyc



"--------------------------------------------------------------------------- 
"" Python
"--------------------------------------------------------------------------- 
" Highlight excess line length
augroup vimrc_autocmds
    autocmd!
    " highlight characters past column 120
    autocmd FileType python highlight Excess ctermbg=DarkGrey guibg=Black
    autocmd FileType python match Excess /\%120v.*/
    autocmd FileType python set nowrap
    augroup END


"--------------------------------------------------------------------------- 
"" GUI/terminal setting
"--------------------------------------------------------------------------- 
if has("gui_running")	" GUI color and font settings
  "" turn on MacVim toolbar
  "set guioptions=T
  set background=dark 
  set t_Co=256          " 256 color mode
  set cursorline        " highlight current line
  colo molokai
  highlight CursorLine          guibg=#003853 ctermbg=24  gui=none cterm=none
else
" terminal color settings
  colors pencil
  set background=dark 
endif


"--------------------------------------------------------------------------- 
"" USEFUL SHORTCUTS
"--------------------------------------------------------------------------- 
" Map leader and localleader key to comma
let mapleader = ","
let g:mapleader = ","
let maplocalleader = ","
let g:maplocalleader = ","

" move around tabs. conflict with the original screen top/bottom
" comment them out if you want the original H/L
" go to prev tab 
map <S-H> gT
" go to next tab
map <S-L> gt

" new tab
map <C-t><C-t> :tabnew<CR>
" close tab
map <C-t><C-w> :tabclose<CR> 


"--------------------------------------------------------------------------- 
" ENCODING SETTINGS
"--------------------------------------------------------------------------- 
set encoding=utf-8                                  
set termencoding=utf-8
set fileencoding=utf-8
set fileencodings=ucs-bom,utf-8,big5,gb2312,latin1

fun! ViewUTF8()
	set encoding=utf-8                                  
	set termencoding=big5
endfun

fun! UTF8()
	set encoding=utf-8                                  
	set termencoding=big5
	set fileencoding=utf-8
	set fileencodings=ucs-bom,big5,utf-8,latin1
endfun

fun! Big5()
	set encoding=big5
	set fileencoding=big5
endfun

