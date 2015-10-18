execute pathogen#infect()
syntax on
filetype plugin indent on
set cindent
set expandtab
set tabstop=2
set shiftwidth=2
set softtabstop=2

set scrolloff=8
set clipboard=unnamed


let base16colorspace=256
set background=dark "Set the background to dark
set t_Co=256 
colorscheme base16-railscasts "Use the railscasts color scheme

set nu "Set line numbers

set undofile
set undodir =~/.vim/.vimundo/

set fdm=indent
set foldlevelstart=99

"Do not highlight a matching parentheses automatically
let loaded_matchparen = 1

" ****** Leader Remaps ****** "
let mapleader = "\<Space>" "Set the leader to spacebar
"Set <Leader> + w to save a file
nnoremap<Leader>w :w<CR>
"Set <Leader> + f to freeze vim and go back to terminal
nnoremap<Leader>f <C-z>
"Enter line selection with <Leader><Leader>
nmap <Leader><Leader> V

"Set <Leader>p and <Leader>P to cycle through yankstack
nmap <leader>p <Plug>yankstack_substitute_older_paste
nmap <leader>P <Plug>yankstack_substitute_newer_paste

" ****** Airline Config ****** "
" Airline configurations
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'

if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

let g:airline_symbols.space = "\ua0"

" Set airline to always be visible
set laststatus=2

" Treat buffers like tabs
nmap gt :bn<CR>
nmap gT :bp<CR>

" Close a buffer without closing the window
nnoremap <leader>q :bp<cr>:bd #<cr>

nmap ntt :NERDTreeToggle<CR>

" ****** Macros ****** "
" q!            Abort macro recording without changing the current one.
function! s:AbortMacroRecording()
    " We don't know which register is being recorded, so save them all and find
    " the one by comparing all values.
    let l:registers = split('abcdefghijklmnopqrstuvwxyz', '\zs')
    let l:savedRegisters = map(copy(l:registers), 'getreg(v:val)')

    " Abort macro recording.
    normal! q

    for l:idx in range(len(l:registers))
        let l:reg = l:registers[l:idx]
        let l:contents = l:savedRegisters[l:idx]
        if getreg(l:reg) !=# l:contents
            call setreg(l:reg, l:contents)
            echo printf('Aborted recording into register %s; macro is: %s', l:reg, strtrans(l:contents))
            return
        endif
    endfor

    echomsg "Couldn't detect recorded register"
endfunction
nnoremap <silent> q! :<C-u>call <SID>AbortMacroRecording()<CR>

" Create functions for showing and removing extra whitespace
function ShowSpaces(...)
  let @/='\v(\s+$)|( +\ze\t)'
  let oldhlsearch=&hlsearch
  if !a:0
    let &hlsearch=!&hlsearch
  else
    let &hlsearch=a:1
  end
  return oldhlsearch
endfunction

function TrimSpaces() range
  let oldhlsearch=ShowSpaces(1)
  execute a:firstline.",".a:lastline."substitute ///gec"
  let &hlsearch=oldhlsearch
endfunction

" enable quick_scope conditionally
let g:qs_enable = 0
let g:qs_enable_char_list = [ 'f', 'F', 't', 'T' ]

function! Quick_scope_selective(movement)
  let needs_disabling = 0
  if !g:qs_enable
    QuickScopeToggle
    redraw!
    let needs_disabling = 1
  endif
  let letter = nr2char(getchar())
  if needs_disabling
    QuickScopeToggle
  endif
  return a:movement . letter
endfunction

" quick_scope maps, operator-pending mode included (can do 'df' with hint)
for i in g:qs_enable_char_list
  execute 'noremap <expr> <silent>' . i . " Quick_scope_selective('". i . "')"
endfor

command -bar -nargs=? ShowSpaces call ShowSpaces(<args>)
command -bar -nargs=0 -range=% TrimSpaces <line1>,<line2>call TrimSpaces()
nnoremap <F12>     :ShowSpaces 1<CR>
nnoremap <S-F12>   m`:TrimSpaces<CR>``
vnoremap <S-F12>   :TrimSpaces<CR>

call yankstack#setup()
