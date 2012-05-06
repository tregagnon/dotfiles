" Vim graphical configuration.

set guifont=Menlo:h12                " Font family and font size.
set guioptions-=T                    " Hide toolbar.
set guioptions-=r                    " Don't show right scrollbar
set background=dark
set lines=44 columns=140             " Window dimensions.

if has("gui_macvim")                 " MacVim
  let macvim_hig_shift_movement = 1  " Emulates native Shift selection
  set antialias                      " Smooth fonts.
endif

"set transp=20
