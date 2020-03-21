" Use pathogen as a submodule https://github.com/tpope/vim-pathogen#faq
runtime bundle/vim-pathogen/autoload/pathogen.vim

set nocompatible
filetype off


execute pathogen#infect()


" Configure markdown corners for vim-table-mode
let g:table_mode_corner='|'


" Stuff from the default vimrc for ease
" copied here to remove redundant settings.


" An example for a vimrc file.
"
" Maintainer:	Bram Moolenaar <Bram@vim.org>
" Last change:	2011 Apr 15
"
" To use it, copy it to
"     for Unix and OS/2:  ~/.vimrc
"	      for Amiga:  s:.vimrc
"  for MS-DOS and Win32:  $VIM\_vimrc
"	    for OpenVMS:  sys$login:.vimrc

" When started as "evim", evim.vim will already have done these settings.
if v:progname =~? "evim"
  finish
endif

if has("vms")
  set nobackup		" do not keep a backup file, use versions instead
else
  set backup		" keep a backup file
endif
set history=50		" keep 50 lines of command line history

" For Win32 GUI: remove 't' flag from 'guioptions': no tearoff menu entries
" let &guioptions = substitute(&guioptions, "t", "", "g")

" Don't use Ex mode, use Q for formatting
map Q gq

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
  set mouse=a
endif

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif

" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

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
  command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis
		  \ | wincmd p | diffthis
endif

" end contents from default vimrc_example



set diffexpr=MyDiff()
function MyDiff()
  let opt = '-a --binary '
  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
  let arg1 = v:fname_in
  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
  let arg2 = v:fname_new
  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
  let arg3 = v:fname_out
  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
  let eq = ''
  if $VIMRUNTIME =~ ' '
    if &sh =~ '\<cmd'
      let cmd = '""' . $VIMRUNTIME . '\diff"'
      let eq = '"'
    else
      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
    endif
  else
    let cmd = $VIMRUNTIME . '\diff'
  endif
  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3 . eq
endfunction

" My stuff
filetype plugin indent on

" vim-markdown configuration
let g:markdown_fenced_languages = ['html', 'python', 'matlab', 'c']

"Spaces, tabs, etc
set autoindent
set expandtab " tabs are spaces
set smarttab
set shiftwidth=4
set softtabstop=4
" note line clipping is typically unset, except for comments by vim's
" ftplugins.  This is fine.
set textwidth=72 "clip lines to 72 chars
" conform to text width only in comments unless otherwise set.
set fo-=t fo+=croql
set backspace=indent,eol,start "allows backspacing over indents

"UI
set number "line numbers
set ruler "current position
set showcmd "show command in bottom bar
set list " make tabs explicitly visible
set scrolloff=3 "keep 3 lines around the cursor
set wildmenu "visual autocomplete for command menu
set colorcolumn=72 "highlight 72nd column

set foldmethod=marker " Unless otherwise set


"The solarize code messes up terminal vim in windows, but not
"in linux.  Thus for windows only, solarized code moves to gvimrc
" solarize colorscheme
if !has("win32")
    syntax enable
    " On linux, using light solarized theme in terminal, need to set
    " bg=dark to keep light schem.
    set background=dark
    colorscheme solarized
endif

""" Vimwiki register
""let wiki = {}
""let wiki.path = '~/vimwiki'
""let g:vimwiki_list = [ wiki ]
""
"Buffer traversal
noremap <silent> [b :bprevious<CR>
noremap <silent> ]b :bnext<CR>
noremap <silent> [B :bfirst<CR>
noremap <silent> ]B :blast<CR>

"Misc
set splitbelow
set splitright
nnoremap <C-u> viwU<Esc> " uppercase word in one press

" No backp files in same directory...
set backupdir=~/.vimbackup

" hex dump current buffer, or revert
nnoremap <F8> :call HexMe()<CR>

"HexMe
let $in_hex=0
function HexMe()
    set binary
    set noeol
    if $in_hex>0
        :%!xxd -r
        let $in_hex=0
    else
        :%!xxd
        let $in_hex=1
    endif
endfunction



" yyyy-mm-dd date stamp
inoremap <Leader>dd <C-R>=strftime("%Y-%m-%d")<CR>
" yyyy-mm-dd, hh:mm:ss time stamp
inoremap <Leader>dt <C-R>=strftime("%Y-%m-%d, %H:%M:%S ")<CR>
inoremap <Leader>kmem <C-v>u2014
inoremap <Leader>kmen <C-v>u2013
