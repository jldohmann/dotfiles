if exists('$DOTFILES')
	source $DOTFILES/vim/autoload.pathogen.vim
	source $DOTFILES/vim/vimrc
endif

execute pathogen#infect()
syntax on
filetype plugin indent on
set number
set ts=4
set autoindent
set expandtab
set shiftwidth=4
set showmatch
let python_highlight_all=1

au VimEnter * NERDTree

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_html_tidy_ignore_errors=["<form> proprietary attribute \"crossorigin\""]
let syntastic_check_on_wq = 0
let cobol_legacy_code = 1

set t_Co=256

"default window splitting"
set splitbelow
set splitright

"better window navigation"
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>ln

"setting tmux as slime default and other slime settings"
"let g:slimt_target = 'tmux'"
let g:slime_target = "screen"
let g:slime_paste_file = "$HOME/.slime_paste"

"enabling more robust WL syntax"
autocmd BufNewFile,BufRead *.wl set syntax=wl
autocmd BufNewFile,BufRead *.wls set syntax=wl
autocmd BufNewFile,BufRead *m set syntax=wl

"enabling reStructuredText syntax"
autocmd BufNewFile,BufRead *.rst set syntax=rst
