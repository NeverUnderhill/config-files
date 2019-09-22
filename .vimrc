set nocompatible              " be iMproved, required
filetype off                  " required

call plug#begin('~/.vim/plugged')			" Specifying directory for plugins
"Plug 'Shougo/deoplete.nvim' 
"Plug 'w0rp/ale'
"Plug 'dracula/vim'
Plug 'scrooloose/syntastic'
Plug 'itchyny/lightline.vim'
Plug 'Yggdroot/indentLine'
Plug 'jiangmiao/auto-pairs'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'terryma/vim-multiple-cursors'
Plug 'scrooloose/nerdcommenter'
Plug 'tpope/vim-sensible'
Plug 'ervandew/supertab'
Plug 'majutsushi/tagbar'
Plug 'mbbill/undotree'
Plug 'scrooloose/nerdtree'
Plug 'universal-ctags/ctags'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'gregsexton/MatchTag'
Plug 'Valloric/YouCompleteMe'

call plug#end()

"<configure expanding of tabs for various file types>
au BufRead,BufNewFile *.py set expandtab
au BufRead,BufNewFile *.c set noexpandtab
au BufRead,BufNewFile *.h set noexpandtab
au BufRead,BufNewFile Makefile* set noexpandtab

"<basic settings>
syntax on										"Enables syntax highlighting and stuff
filetype plugin indent on	"filetype and indent recognition
let mapleader=' '	        " leader key
set number                  " Print the line number in front of each line
set relativenumber			" Relative line numeration
set wrap                    " Wraps lines
set linebreak				" Wrap lines at convenient points
set tabstop=4		    	" Makes TAB 2 places wide
set softtabstop=4		    " Number of spaces in tab when editing
set shiftwidth=4			" makes 2 places indentation after {
set expandtab               " enter spaces when tab is pressed
set cursorline 				" highlights current line
set ruler                   " show line and column number
set showmatch 	    		" highlights matching {[()]}     
set term=screen-256color    " FIXES tmux colorscheme problem, together with set -g default-terminal "screen-256color" in .tmux.conf
set t_Co=256
nnoremap <c-u> bvw<left>U
nnoremap <leader>ev :vs $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>
inoremap jj <Esc>
"</basic settings>

"<split navigation>
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
"</split navigation>

"<colorscheme>
syntax enable
colorscheme darkblue
highlight Normal guibg=NONE ctermbg=NONE
highlight NonText ctermbg=none
"</colorscheme>

"<syntastic>
let g:syntastic_auto_jump = 0
let g:syntastic_check_on_open = 0
let g:syntastic_echo_current_error = 1
let g:syntastic_enable_signs = 1
let g:syntastic_cpp_compiler_options = '-std=c++11 '
let g:syntastic_error_symbol = "✗"
let g:syntastic_warning_symbol = "⚑"
let g:syntastic_quiet_messages = {'level': 'warnings'}
let g:syntastic_cpp_compiler = 'g++'
let g:syntastic_cpp_check_header = 1
"</syntastic>

"<indentline>
let g:indentLine_char = '┆'
let g:indentLine_setColors = 0
"</indentline>

"<nerdCOMMENTER>  
let g:NERDDefaultAlign = 'left'
"</nerdCOMMENTER>  

let c_no_curly_error=1      "enhanced highlighting error fix

"<Tagbar>
nmap <F8> :TagbarToggle<CR>
nmap <F9> :TagbarTogglePause<CR>

"<Nerdtree>
nmap <F7> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
let g:NERDTreeQuitOnOpen=1

"<YCM>
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_seed_identifiers_with_syntax = 1
let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py'
let g:ycm_show_diagnostics_ui = 0
let g:ycm_confirm_extra_conf = 0
let g:ycm_semantic_triggers =  { 'cpp,objcpp' : ['->', '.', '::', 're!gl', 're!GL']  }
let g:ycm_key_list_select_completion = ['<C-j>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-k>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-n>'

"<UltiSnips>
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<C-b>"
let g:UltiSnipsJumpBackwardTrigger = "<C-x>"

command W :execute ':silent w !sudo tee % > /dev/null' | :edit!
