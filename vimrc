" Install SuperTab for tab completion:
" http://www.vim.org/scripts/script.php?script_id=1643
"
" Settings mostly from http://stackoverflow.com/questions/1218390/what-is-your-most-productive-shortcut-with-vim
"
" Also added extra commands at the bottom for easier window-split navigation.
" (Ctrl-Left, Down, Up, Right for window navigation, or Ctrl-H,J,K,L if you prefer)
" Recall that :vsp FILENAME opens a vertical split, and :sp opens a horizontal one.
" Note: You can tab-complete the filenames in your directory :)

" reset to vim-defaults
if &compatible          " only if not set before:
  set nocompatible      " use vim-defaults instead of vi-defaults (easier, more user friendly)
endif

" display settings
set background=dark     " enable for dark terminals
set nowrap              " dont wrap lines
set scrolloff=2         " 2 lines above/below cursor when scrolling
set number              " show line numbers
set showmatch           " show matching bracket (briefly jump)
set showmode            " show mode in status bar (insert/replace/...)
set showcmd             " show typed command in status bar
set ruler               " show cursor position in status bar
set title               " show file in titlebar
set wildmenu            " completion with menu
set wildignore=*.o,*.obj,*.bak,*.exe,*.py[co],*.swp,*~,*.pyc,.svn
set laststatus=2        " use 2 lines for the status bar
set matchtime=2         " show matching bracket for 0.2 seconds
set matchpairs+=<:>     " specially for html

" editor settings
set esckeys             " map missed escape sequences (enables keypad keys)
set ignorecase          " case insensitive searching
set smartcase           " but become case sensitive if you type uppercase characters
set smartindent         " smart auto indenting
set smarttab            " smart tab handling for indenting
set magic               " change the way backslashes are used in search patterns
set bs=indent,eol,start " Allow backspacing over everything in insert mode

set tabstop=4           " number of spaces a tab counts for
set shiftwidth=4        " spaces for autoindents
set expandtab           " turn a tabs into spaces

set fileformat=unix     " file mode is unix
"set fileformats=unix,dos    " only detect unix file format, displays that ^M with dos files

" system settings
set lazyredraw          " no redraws in macros
set confirm             " get a dialog when :q, :w, or :wq fails
"set nobackup            " no backup~ files.
set hidden              " remember undo after quitting
set history=700         " keep 50 lines of command history
set mouse=v             " use mouse in visual mode (not normal,insert,command,help mode

" Tell vim to remember certain things when we exit
"  '10  :  marks will be remembered for up to 10 previously edited files
"  "100 :  will save up to 100 lines for each register
"  :20  :  up to 20 lines of command-line history will be remembered
"  %    :  saves and restores the buffer list
"  n... :  where to save the viminfo files
set viminfo='20,\"500,:20,%,n~/.viminfo

" color settings (if terminal/gui supports it)
if &t_Co > 2 || has("gui_running")
  syntax on          " enable colors
  set hlsearch       " highlight search (very useful!)
  set incsearch      " search incremently (search while typing)
endif

" paste mode toggle (needed when using autoindent/smartindent)
map <F10> :set paste<CR>
map <F11> :set nopaste<CR>
imap <F10> <C-O>:set paste<CR>
imap <F11> <nop>
set pastetoggle=<F11>

" Use of the filetype plugins, auto completion and indentation support
filetype plugin indent on

" Pathogen (https://github.com/tpope/vim-pathogen)
execute pathogen#infect()

" file type specific settings
if has("autocmd")
  " For debugging
  "set verbose=9

  " if bash is sh.
  let bash_is_sh=1

  " remember cursor location
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

  " change to directory of current file automatically
  autocmd BufEnter * lcd %:p:h

  " Put these in an autocmd group, so that we can delete them easily.
  augroup mysettings
    au FileType xslt,xml,css,html,xhtml,javascript,sh,config,c,cpp,docbook set smartindent shiftwidth=4 softtabstop=4 expandtab
    au FileType tex set wrap shiftwidth=2 softtabstop=2 expandtab

    " Conform to PEP8
    au FileType python set tabstop=4 softtabstop=4 expandtab shiftwidth=4 cinwords=if,elif,else,for,while,try,except,finally,def,class
  augroup END

  augroup perl
    " reset (disable previous 'augroup perl' settings)
    au!

    au BufReadPre,BufNewFile
    \ *.pl,*.pm
    \ set formatoptions=croq smartindent shiftwidth=2 softtabstop=2 cindent cinkeys='0{,0},!^F,o,O,e' " tags=./tags,tags,~/devel/tags,~/devel/C
    " formatoption:
    "   t - wrap text using textwidth
    "   c - wrap comments using textwidth (and auto insert comment leader)
    "   r - auto insert comment leader when pressing <return> in insert mode
    "   o - auto insert comment leader when pressing 'o' or 'O'.
    "   q - allow formatting of comments with "gq"
    "   a - auto formatting for paragraphs
    "   n - auto wrap numbered lists
    "   
  augroup END

  " Always jump to the last known cursor position. 
  " Don't do it when the position is invalid or when inside
  " an event handler (happens when dropping a file on gvim). 
  autocmd BufReadPost * 
    \ if line("'\"") > 0 && line("'\"") <= line("$") | 
    \   exe "normal g`\"" | 
    \ endif 
    
  " Run vim-flake8 whenever we write a python file
  autocmd BufWritePost *.py call Flake8() 

endif " has("autocmd")

" Additional settings for window splits
nnoremap <C-J> <C-W><C-J>
nnoremap <C-Down> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-Up> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-Right> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
nnoremap <C-Left> <C-W><C-H>
set splitbelow
set splitright

" Additional settings for tabs
nnoremap <A-Left> :tabprevious<CR>
nnoremap <A-Right> :tabnext<CR>

" Set line length to highlight >80 column widths.
" highlight OverLength ctermbg=red ctermfg=white guibg=#592929
" match OverLength /\%81v.\+/

