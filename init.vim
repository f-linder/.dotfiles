:set number
:set autoindent 
:set tabstop=4
:set shiftwidth=4
:set smarttab
:set softtabstop=4
:set mouse=a

call plug#begin()

	Plug 'https://github.com/tmsvg/pear-tree' " auto match brackets
	Plug 'https://github.com/preservim/nerdtree' " nerdtree / file explorer
	Plug 'https://github.com/neoclide/coc.nvim' " auto completion
	Plug 'https://github.com/tpope/vim-commentary' " for commenting gcc & gc
	Plug 'https://github.com/preservim/tagbar' " tagbar for code navigation
	Plug 'https://github.com/tc50cal/vim-terminal' " terminal extension
	
	Plug 'https://github.com/vim-airline/vim-airline' " status bar
	Plug 'https://github.com/rafi/awesome-vim-colorschemes' " colorschemes
	Plug 'https://github.com/vim-airline/vim-airline-themes' "airline schemes
	Plug 'https://github.com/ryanoasis/vim-devicons' " developer icons (install nerdfont + use it in terminal)


set encoding=UTF-8

call plug#end()

:colorscheme meta5

"----------------NERDTREE-----------------
	let g:NERDTreeDirArrowExpandable="+"
	let g:NERDTreeDirArrowCollapsilble="~"
	nnoremap <C-t> :NERDTreeToggle<CR>

"------------------------STATUS BAR---------------
	set statusline=2
	let g:airline_theme='alduin' 
	let g:airline#extensions#whitespace#enabled = 0
	let g:airline#extensions#tabline#enabled = 1
	let g:airline_powerline_fonts = 1
	let g:airline#extensions#tabline#buffer_idx_mode = 1

"--------------TAGBAR---------------------
	nmap <F8> :TagbarToggle<CR>

"---------------Conquer of Completion-------------- 
	set updatetime=300
	set sigcolumn=yes
	inoremap <expr> <Tab> pumvisible() ? coc#_select_confirm() : "\<Tab>"
	" map ctrl + j and ctrl + k to traverse up and down the coc completion list
	inoremap <expr> <C-j> coc#pum#visible() ? coc#pum#next(1) : "\<C-n>"
	inoremap <expr> <C-k> coc#pum#visible() ? coc#pum#prev(1) : "\<C-p>"
	
"-------------- PEAR TREE -------------
	let g:pear_tree_pairs = {
		    \ '(': {'closer': ')'},
		    \ '[': {'closer': ']'},
		    \ '{': {'closer': '}'},
		    \ "'": {'closer': "'"},
		    \ "<": {'closer': ">"},
		    \ '"': {'closer': '"'}
          	    \ }
	inoremap ä <Plug>(PearTreeJump)
	    
" -----------MAPPINGS---------------
	imap ö <ESC>
	" moving between splits
	nnoremap <C-J> <C-W><C-J>
	nnoremap <C-K> <C-W><C-K>
	nnoremap <C-L> <C-W><C-L>
	nnoremap <C-H> <C-W><C-H>



