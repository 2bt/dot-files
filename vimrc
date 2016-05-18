execute pathogen#infect()

"let g:airline_powerline_fonts = 1

set nocompatible
filetype off
"filetype plugin indent on

syntax on
colorscheme desert256
highlight search ctermbg=23 ctermfg=white
highlight pmenu ctermbg=233 ctermfg=7
highlight pmenusel ctermbg=23 ctermfg=white
highlight spellbad ctermbg=none ctermfg=magenta

"	set cursorline
highlight cursorline ctermbg=233 cterm=none
highlight linenr ctermbg=233


"	highlighting matching brackets
highlight matchparen ctermbg=52 cterm=bold

"	highlight trailing whitespace
highlight trailingspace ctermbg=52
match trailingspace /\s\+$/


set exrc secure
set tabstop=4 shiftwidth=4 noexpandtab
set scrolloff=5
set incsearch hlsearch
set autoindent
set number
set hidden
set ruler
set showcmd
set laststatus=2
set mouse=a
set modeline

set wildmenu
set wildcharm=<c-z>
set wildmode=longest,list:longest
set completeopt=menu,preview

nnoremap <c-pagedown> :bn<cr>
nnoremap <c-pageup> :bp<cr>
nnoremap <c-k> :nohlsearch<cr>
"nnoremap <leader>w :bd<cr>

" MiniBufExplorer
"let g:miniBufExplMapWindowNavVim = 1
"let g:miniBufExplMapWindowNavArrows = 1
"let g:miniBufExplMapCTabSwitchBufs = 1
"let g:miniBufExplModSelTarget = 1

autocmd Filetype html,xml,xsl source ~/.vim/scripts/closetag.vim
autocmd FileType cpp setlocal syntax=cpp11
autocmd FileType haskell setlocal expandtab tabstop=2 shiftwidth=2
autocmd FileType haml,yaml setlocal expandtab tabstop=2 shiftwidth=2
autocmd FileType fortran setlocal expandtab tabstop=2 shiftwidth=2
autocmd FileType scheme,lisp setlocal expandtab tabstop=1 shiftwidth=1 lisp
autocmd BufRead,BufNewFile *.sls setfiletype scheme
autocmd BufRead,BufNewFile *.md setlocal syntax=markdown
autocmd BufRead,BufNewFile *.z80 setlocal tabstop=8 shiftwidth=8
autocmd BufRead,BufNewFile *.ck setlocal syntax=c

" vala stuff
autocmd BufRead *.vala,*.vapi set efm=%f:%l.%c-%[%^:]%#:\ %t%[%^:]%#:\ %m
autocmd BufRead,BufNewFile *.vala,*.vapi setfiletype vala


"highlight wordoncursor cterm=bold
"autocmd cursormoved * exe printf('match wordoncursor /\v\<%s\>/', escape(expand('<cword>'), '/\'))

let mapleader = "\<BS>"
nnoremap <F4> :make<cr>
nnoremap <leader>m :make<cr>
nnoremap <leader>M :!metamake<cr>
nnoremap <leader>T :!metamake test<cr>
nnoremap <leader>S :!metamake static<cr>
nnoremap <leader>" viw<esc>a"<esc>bi"<esc>lel
nnoremap <leader>' viw<esc>a'<esc>bi'<esc>lel
nnoremap <leader>` viw<esc>a`<esc>bi`<esc>lel
nnoremap <leader>( viw<esc>a)<esc>bi(<esc>lel
nnoremap <leader>{ viw<esc>a}<esc>bi{<esc>lel
nnoremap <leader>[ viw<esc>a]<esc>bi[<esc>lel
nnoremap <leader>< viw<esc>a><esc>bi<<esc>lel
vnoremap <leader>" y`>a"<esc>`<i"<esc>`>ll
vnoremap <leader>' y`>a'<esc>`<i'<esc>`>ll
vnoremap <leader>` y`>a`<esc>`<i`<esc>`>ll
vnoremap <leader>( y`>a)<esc>`<i(<esc>`>ll
vnoremap <leader>{ y`>a}<esc>`<i{<esc>`>ll
vnoremap <leader>[ y`>a]<esc>`<i[<esc>`>ll
vnoremap <leader>< y`>a><esc>`<i<<esc>`>ll
onoremap p i(
vnoremap <leader>j :!python -m json.tool<cr>


"	navigate via visual lines
nnoremap <up> g<up>
nnoremap <down> g<down>

vnoremap <s-up> g<up>
vnoremap <s-down> g<down>

"	Y like D
nnoremap Y y$

"	do not lose selection
vnoremap > >gv
vnoremap < <gv



function SmoothScroll(up)
	if a:up
		let scrollaction=""
	else
		let scrollaction=""
	endif
	exec "normal " . scrollaction
	redraw
	let counter=1
	while counter<&scroll
		let counter+=1
		sleep 7m
		redraw
		exec "normal " . scrollaction
	endwhile
endfunction

nnoremap <C-U> :call SmoothScroll(1)<Enter>
nnoremap <C-D> :call SmoothScroll(0)<Enter>


nnoremap <C-n> :set relativenumber!<cr>


function Switch()
	let l:root = expand("%:r")
	let l:h_ext_list = ["h"]
	let l:c_ext_list = ["c", "cpp"]
	if index(l:c_ext_list, expand("%:e")) > -1
		let l:ext_list = l:h_ext_list
	elseif index(l:h_ext_list, expand("%:e")) > -1
		let l:ext_list = l:c_ext_list
	else
		echo "ERROR: couldn't switch between header and source"
		return
	endif
	for e in l:ext_list
		let l:switch = l:root . "." . e
		if filereadable(l:switch)
			break
		endif
	endfor
	execute "e " . l:switch
endfunction
nnoremap <leader>s :call Switch()<cr>


" frequent substitutions
vnoremap <leader><space> :s/\s\+$//g<cr>:nohlsearch<cr>gv
vnoremap <leader><tab> :s/    /\t/g<cr>:nohlsearch<cr>gv
vnoremap <leader>y :s/x/y/g<cr>:nohlsearch<cr>gv
vnoremap <leader>x :s/y/x/g<cr>:nohlsearch<cr>gv
vnoremap <leader><bs> :s/\s\+$//<cr>gv

vnoremap <leader>; <c-v>0I;<esc>
vnoremap <leader># <c-v>0I#<esc>
vnoremap <leader>/ <c-v>0I//<esc>
vnoremap <leader>- <c-v>0I--<esc>

