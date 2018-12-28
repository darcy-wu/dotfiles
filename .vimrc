" My vimrc file.
"
" Maintainer:	WuKui
" Last change:	Fri Jan 28 16:50:53     2011
"

" Use Vim settings, rather than Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

"if has("vms")
"  set nobackup		" do not keep a backup file, use versions instead
"else
"  set backup		" keep a backup file
"endif
set nobackup
set history=50		" keep 50 lines of command line history
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
set incsearch		" do incremental searching

" Don't use Ex mode, use Q for formatting
map Q gq

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

" In many terminal emulators the mouse works just fine, thus enable it.
"if has('mouse')
"  set mouse=a
"endif
"
"if has("terminfo")
"  set t_Co=8
"  set t_AB=<Esc>[48;5;%dm
"  set t_AF=<Esc>[38;5;%dm
"else
"  set t_Co=8
"  set t_AB=[48;5;%dm
"  set t_AF=[38;5;%dm
"endif

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif

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

""""""""""""""""""""""""""""""""""""""""""""""""""
" colorscheme settings
""""""""""""""""""""""""""""""""""""""""""""""""""
"colorscheme 256-jungle
""""""""""""""""""""""""""""""""""""""""""""""""""
" color list
""""""""""""""""""""""""""""""""""""""""""""""""""
" - Black
" - DarkBlue
" - DarkGreen
" - DarkCyan
" - DarkRed
" - DarkMagenta
" - Brown,DarkYellow
" - LightGray,LightGrey,Gray,Grey
" - DarkGray,DarkGrey
" - Blue,LightBlue
" - Green,LightGreen
" - Cyan,LightCyan
" - Red,LightRed
" - Magenta,LightMagenta
" - Yellow,LightYellow
" - White
""""""""""""""""""""""""""""""""""""""""""""""""""
"hi CursorLine cterm=NONE ctermbg=darkred ctermfg=white guibg=darkred guifg=white
"hi CursorLine cterm=NONE ctermbg=darkred

"set cursorline
colorscheme mycolor
"hi Search cterm=NONE ctermfg=black ctermbg=yellow
hi gp_0 cterm=bold ctermbg=darkred ctermfg=white
hi gp_1 cterm=bold ctermbg=darkblue ctermfg=white
hi gp_2 cterm=bold ctermbg=darkcyan ctermfg=white
hi gp_3 cterm=bold ctermbg=darkgreen ctermfg=white
hi gp_4 cterm=bold ctermbg=darkmagenta ctermfg=white
"hi gp_5 cterm=bold ctermbg=darkyellow ctermfg=white
"set cursorline
"hi CursorLine   cterm=NONE ctermbg=darkgray ctermfg=NONE
"set cursorcolumn
"hi CursorColumn cterm=NONE ctermbg=16 ctermfg=NONE

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis
		  \ | wincmd p | diffthis
endif

set nu
set tabstop=4
set shiftwidth=4
set scrolloff=3
set expandtab
set ai
set si
set noignorecase
set noignorecase 
set smartcase 

""""""""""""""""""""""""""""""""""""""""""""""""""
" key mapping settings
""""""""""""""""""""""""""""""""""""""""""""""""""
imap jj <esc>
nnoremap <silent> <F3> @q

""""""""""""""""""""""""""""""""""""""""""""""""""
" grep settings
""""""""""""""""""""""""""""""""""""""""""""""""""
"nnoremap <silent> <F1> <ESC><CR>

""""""""""""""""""""""""""""""""""""""""""""""""""
" A settings
""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <silent> <F4> :A<CR>

""dynamic cursor color for xterm \033=>\e  007=>\a (BEL)
"if &term =~ "xterm"
"    ":silent !echo -ne "\e]12;IndianRed2\007"
"    let &t_SI = "\e]12;RoyalBlue1\007"
"    let &t_EI = "\e]12;IndianRed2\007"
"    "autocmd VimLeave * :!echo -ne "\e]12;green\007"
"elseif &term =~ "screen"    " screen in urxvt or xterm
"    ":silent !echo -ne "\eP\e]12;IndianRed2\007\e\\"
"    let &t_SI = "\eP\e]12;RoyalBlue1\007\e\\"
"    let &t_EI = "\eP\e]12;IndianRed2\007\e\\"
"    "autocmd VimLeave * :!echo -ne "\eP\e]12;green\007\e\\"
"endif 

""""""""""""""""""""""""""""""""""""""""""""""""""
" complete settings
""""""""""""""""""""""""""""""""""""""""""""""""""
"set wildmenu 
"set wildmode=list:longest,full 
""set completeopt=longest,menu,preview 
set completeopt=preview 
"autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType python set omnifunc=
let g:SuperTabDefaultCompletionType="context"
let g:SuperTabRetainCompletionType=2

"set guifont=Courier:h14:cANSI

"autocmd InsertEnter * set cur 
"autocmd InsertLeave * set nocur 

function Clean_sv()
    normal G
    :g/^\/\//d
    :g/^\s*$/d
    :%s/\/\/.*$//
endfunction

function InsertHeadDef(firstLine, lastLine)
    if a:firstLine <1 || a:lastLine> line('$')
        echoerr 'InsertHeadDef : Range overflow !(FirstLine:'.a:firstLine.';LastLine:'.a:lastLine.';ValidRange:1~'.line('$').')'
        return ''
    endif
    let sourcefilename=expand("%:t")
    let definename=substitute(sourcefilename,' ','','g')
    let definename=substitute(definename,'\.','_','g')
    let definename = toupper(definename)
    exe 'normal '.a:firstLine.'GO'
    call setline('.', '`ifndef '.definename."")
    normal ==o
    call setline('.', '`define '.definename."")
    normal ==o
    call setline('.', "")
    exe 'normal =='.(a:lastLine-a:firstLine+1).'jo'
    normal ==o
    call setline('.', "")
    call setline('.', '`endif //'.definename."")
    normal ==o
    call setline('.', "")
    let goLn = a:firstLine+2
    exe 'normal =='.goLn.'G'
endfunction

function InsertFileDef()
    let firstLine = 1
    let lastLine = line('$')
    let n=1
    while n < 20
        let line = getline(n)
        if n==1 
            if line =~ '^\/\*.*$'
                let n = n + 1
                continue
            else
                break
            endif
        endif
        if line =~ '^.*\*\/$'
            let firstLine = n+1
            break
        endif
        let n = n + 1
    endwhile
    call InsertHeadDef(firstLine, lastLine)
endfunction

