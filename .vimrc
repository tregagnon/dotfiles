" Vim config file

" Use Vim settings, rather than Vi settings 
" This must be first, because it changes other options as a side effect.
set nocompatible

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
	syntax on
	set hlsearch
	colorscheme molokai
endif

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
  set mouse=a
endif

set encoding=utf-8

set laststatus=2                  " Show the status line all the time

set backspace=indent,eol,start    " Intuitive backspacing.

set hidden                        " Handle multiple buffers better.

set wildmenu                      " Enhanced command line completion.
set wildmode=list:longest         " Complete files like a shell.

set writebackup                   " Make a backup just the time of overwriting the file 
set nobackup                      " Don't keep the backup after writing the file
set directory=$HOME/.vim/tmp//,.  " Keep swap files in one location

set visualbell                    " No beeping.

set ignorecase                    " Case-insensitive searching.
set smartcase                     " But case-sensitive if expression contains a capital letter.

set history=50                    " keep 50 lines of command line history

set wrap                          " Long lines will automatically wrap
set scrolloff=3                   " Show 3 lines of context around the cursor.

set ruler                         " show the cursor position all the time
set showcmd                       " display incomplete commands
set showmode                      " Display the mode you're in.
set incsearch                     " do incremental searching
set showmatch
"set number                       " add lines number
set relativenumber                " add lines number relative to the line with the cursor
set cursorline                    " highlight the line with the cursor

" Show invisible characters (tabstops, EOL, ...)
" Use the same symbols as TextMate for tabstops and EOLs
set list
set listchars=tab:▸\ ,eol:¬

" Settings for indentation
set tabstop=2                     " Global tab width.
set shiftwidth=2                  " And again, related.
set softtabstop=2

" Useful status information at bottom of screen
"set statusline=[%n]\ %<%.99f\ %h%w%m%r%y\ %{exists('*CapsLockStatusline')?CapsLockStatusline():''}%=%-16(\ %l,%c-%v\ %)%P

let mapleader=","
" Tab mappings.
map <leader>tt :tabnew<cr>
map <leader>te :tabedit
map <leader>tc :tabclose<cr>
map <leader>to :tabonly<cr>
map <leader>tn :tabnext<cr>
map <leader>tp :tabprevious<cr>
map <leader>tf :tabfirst<cr>
map <leader>tl :tablast<cr>
map <leader>tm :tabmove

" Don't use Ex mode, use Q for formatting
map Q gq

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

" Make Vim use Perl/Python compatible Regex formatting
nnoremap / /\v
vnoremap / /\v

" Make it easier to clean highlighting after a search
nnoremap <leader><space> :noh<cr>

" Disable arrow keys to force to use hjkl
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>

" make j and k move by 'display line' instead of 'file line'
nnoremap j gj
nnoremap k gk

" Init for Pathogen plugin that simplifies plugin installation
call pathogen#infect()

" Shortcut for expanding expressions with the zencoding bundle
let g:user_zen_leader_key = '<C-e>'

" Only do this part when compiled with support for autocommands.
if has("autocmd")
  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  filetype plugin indent on

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78

  " Make SCSS and LESS recognized as CSS
  autocmd BufNewFile,BufRead *.scss             set ft=scss.css
  autocmd BufNewFile,BufRead *.less             set ft=less.css

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  " Also don't do it when the mark is in the first line, that is the default
  " position when opening a file.
  autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif
  augroup END
else
  set autoindent		" always set autoindenting on
endif " has("autocmd")

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
	command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis
		\ | wincmd p | diffthis
endif


""""" Switch between relative line number and absolute line number
function! NumberToggle()
  if(&relativenumber == 1)
    set number
  else
    set relativenumber
  endif
endfunc

" Set shortcut for line number toggle (Ctrl+n)
nnoremap <leader>n :call NumberToggle()<cr>

" Switch to absolute line number when Vim is out of focus
" Switch to relative line number when Vim is focused
:au FocusLost * :set number
:au FocusGained * :set relativenumber

" Switch to absolute line number when Vim is in Insert mode
" Switch back to relative line number when Vim quits Insert mode
autocmd InsertEnter * :set number
autocmd InsertLeave * :set relativenumber



"""""""""""""""""""" STATUSBAR (from Paul Rouget)
"
"hi StatColor guibg=#95e454 guifg=black ctermbg=lightgreen ctermfg=black
"hi Modified guibg=orange guifg=black ctermbg=lightred ctermfg=black
"hi PatchColor ctermfg=255 ctermbg=161 guifg=black guibg=#FF0066
"
"function! MyStatusLine(mode)
"	let statusline=""
"
"	if a:mode == 'Enter'
"		let statusline.="%#StatColor#"
"	endif
"	let statusline.="\(%n\)\ %f\ "
"	if a:mode == 'Enter'
"		let statusline.="%*"
"	endif
"	let statusline.="%#Modified#%m"
"	if a:mode == 'Leave'
"		let statusline.="%*%r"
"	elseif a:mode == 'Enter'
"		let statusline.="%r%*"
"	endif
"	let statusline .= "\ (%l/%L,\ %c)\ %P%=%h%w\ %y\ [%{&encoding}:%{&fileformat}]\ \ "
"	return statusline
"endfunction
"
"au WinEnter * setlocal statusline=%!MyStatusLine('Enter')
"au WinLeave * setlocal statusline=%!MyStatusLine('Leave')
"set statusline=%!MyStatusLine('Enter')
"
"function! InsertStatuslineColor(mode)
"	if a:mode == 'i'
"		hi StatColor guibg=orange ctermbg=lightred
"	elseif a:mode == 'r'
"		hi StatColor guibg=#e454ba ctermbg=magenta
"	elseif a:mode == 'v'
"		hi StatColor guibg=#e454ba ctermbg=magenta
"	else
"		hi StatColor guibg=red ctermbg=red
"	endif
"endfunction
"
"au InsertEnter * call InsertStatuslineColor(v:insertmode)
"au InsertLeave * hi StatColor guibg=#95e454 guifg=black ctermbg=lightgreen ctermfg=black

