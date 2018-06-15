set shell=/bin/zsh

set nocompatible              " be iMproved, required
filetype off                  " required

" set the leader key
let mapleader = "\<Space>"
let maplocalleader = "\<Space>"

" " set the runtime path to include Vundle and initialize
" set rtp+=~/.vim/bundle/Vundle.vim

call plug#begin("~/.nvim/plugged")
Plug 'djoshea/vim-autoread' " autoread when a file is changed

"Plug 'kien/ctrlp.vim' "CtrlP
"nmap <Leader>p :CtrlP<Space>
"nmap <c-b> :CtrlPBuffer<CR>
"" let g:ctrlp_by_filename       = 1
"let g:ctrlp_user_command = 'ag %s -i --nocolor --nogroup --hidden
      "\ --ignore .git
      "\ --ignore .svn
      "\ --ignore .hg
      "\ --ignore .DS_Store
      "\ --ignore "**/*.pyc"
      "\ -g ""'


" Fuzzy file finder
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': 'yes \| ./install' }
Plug 'junegunn/fzf.vim'
nnoremap <c-b> :Buffers<CR>
nnoremap <c-p> :Files<CR>


" Plug 'altercation/vim-colors-solarized'

Plug 'tmux-plugins/vim-tmux'

Plug 'tomtom/tcomment_vim'

"Lib necessary for things
Plug 'tomtom/tlib_vim' 

" Plug 'easymotion/vim-easymotion' " EASYMOTION
" let g:EasyMotion_enter_jump_first = 1
" map  / <Plug>(easymotion-sn)
" omap / <Plug>(easymotion-tn)
" map  n <Plug>(easymotion-next)
" map  N <Plug>(easymotion-prev)
" let g:EasyMotion_smartcase = 1
" map ff <Plug>(easymotion-s)

" Move anywhere with 2 key
Plug 'justinmk/vim-sneak'
let g:sneak#label = 1
    
Plug 'tpope/vim-surround'
Plug 'tpope/vim-characterize' "ga inspect char

" Allows usage of command such as :Chmod :Mkdir etc...
Plug 'tpope/vim-eunuch'

Plug 'tpope/vim-repeat'

" Git in vim
Plug 'tpope/vim-fugitive'

" Default params accepted by all
Plug 'tpope/vim-sensible'

Plug 'rking/ag.vim'

" Show macro and regisers
Plug 'junegunn/vim-peekaboo'
let g:peekaboo_delay = 400

Plug 'vim-scripts/vim-addon-mw-utils'

Plug 'https://github.com/vim-latex/vim-latex'
let g:tex_conceal="dmgs"
let g:tex_flavor="latex"

" Base 16 theme
Plug 'chriskempson/base16-vim'
let base16colorspace=256  " Access colors present in 256 colorspace

" Plug 'vim-airline/vim-airline'
" Plug 'vim-airline/vim-airline-themes'
" let g:airline_powerline_fonts = 1 
" " Enable the list of buffers
" let g:airline#extensions#tabline#enabled = 1
" " Show just the filename
" let g:airline#extensions#tabline#fnamemod = ':t'
Plug 'itchyny/lightline.vim'
let g:lightline = {
      \ 'colorscheme': 'jellybeans',
      \ 'separator' : {'left' : '', 'right': ''},
      \ 'subseparator' : {'left' : '', 'right': ''},
      \ }

Plug 'mgee/lightline-bufferline'
let g:lightline.tabline          = {'left': [['buffers']], 'right': [['close']]}
let g:lightline.component_expand = {'buffers': 'lightline#bufferline#buffers'}
let g:lightline.component_type   = {'buffers': 'tabsel'}

"Plug 'bfredl/nvim-ipy'
"map <silent> <F9> <Plug>(IPy-Terminate)
"nmap <silent> <C-s> <Plug>(IPy-Run)
"imap <silent> <C-s> <esc><Plug>(IPy-Run)i
"vmap <silent> <C-s> <Plug>(IPy-Run)
"nmap <silent> <F8> <Plug>(IPy-Interrupt)
"autocmd BufEnter *jupyter* imap <buffer> <CR> <esc><Plug>(IPy-Run)i
"imap <silent> <C-x><C-u> <esc><Plug>(IPy-Complete)

Plug 'jalvesaq/Nvim-R'
Plug 'jalvesaq/nvimcom'

" Autocompletion
Plug 'davidhalter/jedi-vim'
let g:jedi#use_tabs_not_buffers = 0
let g:jedi#popup_on_dot = 0
let g:jedi#show_call_signatures = 1
let g:jedi#completions_enabled = 0

Plug 'roxma/nvim-completion-manager'

" Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
" set runtimepath+=~/.config/nvim/plugged/deoplete.nvim
" let g:deoplete#enable_at_startup = 1
" let g:deoplete#enable_smart_case = 1
" let g:deoplete#enable_camel_case = 1
" let g:deoplete#keyword_patterns = {}
" let g:deoplete#keyword_patterns._ = '\w{2,}'
" let g:deoplete#omni#input_patterns = {}
" let g:deoplete#omni#input_patterns.r = '\w+\$'
" let g:deoplete#sources = {}
" let g:deoplete#sources._ = []
" inoremap <expr> <S-Tab> deoplete#mappings#manual_complete()
"
" "
" Plug 'zchee/deoplete-jedi' " Python jedi for deoplete
" let g:deoplete#sources#jedi#server_timeout=60
"
Plug 'poppyschmo/deoplete-latex'

Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets' " load the snippets
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger="<c-e>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"
let g:UltiSnipsSnippetDirectories=["UltiSnips", "mysnippets"]

" If you want :UltiSnipsEdit to split your window.
" let g:UltiSnipsEditSplit="vertical"

" New markdown syntax
Plug 'prurigro/vim-markdown-concealed'

" Preview markdown 
Plug 'JamshedVesuna/vim-markdown-preview'
let vim_markdown_preview_hotkey='<C-m>'
let vim_markdown_preview_github=1
let vim_markdown_preview_browser='Google Chrome'
let vim_markdown_preview_use_xdg_open=1

Plug 'Valloric/MatchTagAlways'

Plug 'mattn/emmet-vim'
"let g:user_emmet_expandabbr_key = '<c-e>'
"let g:user_emmet_install_global = 0
"autocmd FileType html,css EmmetInstall

" Buffer with list of mark 
Plug 'kshenoy/vim-signature' 

" Better indentation for python
Plug 'hynek/vim-python-pep8-indent'

" Grammar checker
Plug 'vim-scripts/LanguageTool'
let g:languagetool_jar='/home/jduc/LanguageTool-3.2/languagetool-commandline.jar'

" Better match it
Plug 'https://github.com/tmhedberg/matchit'

" REPL interactive
Plug 'hkupty/iron.nvim', { 'do': ':UpdateRemotePlugins' }
nmap <leader>s ctr
nmap <leader>ss 0ctr$
vmap <leader>s ctr

Plug 'https://github.com/w0rp/ale'
let g:ale_fixers ={'python': ['autopep8', 'isort']}

Plug 'tmhedberg/SimpylFold'

Plug 'sbdchd/neoformat'

" REPL neoterm  (NOT WORKING WITH IYPTHON)
" Plug 'kassio/neoterm'
" "nnoremap <silent> <leader>ss :TREPLSend<cr>
" vnoremap <silent> <leader>ss :TREPLSendSelection<cr>
" " hide/close terminal
" nnoremap <silent> <leader>th :call neoterm#close()<cr>
" " clear terminal
" nnoremap <silent> <leader>tl :call neoterm#clear()<cr>
" " kills the current job (send a <c-c>)
" nnoremap <silent> <leader>tc :call neoterm#kill()<cr>
"
Plug 'tmux-plugins/vim-tmux-focus-events'

" Extend visual selection 
Plug 'terryma/vim-expand-region' 
vmap v <Plug>(expand_region_expand)
vmap <C-v> <Plug>(expand_region_shrink)

" Allows to navigate easy between vim and tmux
Plug 'christoomey/vim-tmux-navigator'
let g:tmux_navigator_no_mappings = 1
nnoremap <silent> <A-h> :TmuxNavigateLeft<cr>
nnoremap <silent> <A-j> :TmuxNavigateDown<cr>
nnoremap <silent> <A-k> :TmuxNavigateUp<cr>
nnoremap <silent> <A-l> :TmuxNavigateRight<cr>
nnoremap <silent>  <A-p> :TmuxNavigatePrevious<cr>

" Allows to align things with :Tab
Plug 'godlygeek/tabular' 


" takes note
Plug 'vimwiki/vimwiki'
let g:vimwiki_list = [{'path': '~/ownCloud/notes/vimwiki'}]
map <Leader>tt <Plug>VimwikiToggleListItem

call plug#end()
"""""""""""""""""""""""""""""""""""""""""""""""""""""

filetype plugin indent on
syntax on
let python_highlight_all = 1

set icm=split "show preview of command typed

set showtabline=2 "show tabline even 1 tab
set noshowmode "hide the insert below powerline
set hidden "hide buffer instead of close
set showmatch "show match brackets
set guifont=DejaVu\ Sans\ Mono\ for\ Powerline\ Bold\ 10
set ruler
" set number
" set relativenumber
set nrformats-=octal
set nowritebackup
set nohlsearch
"set autochdir  "auto change dir when open a file
autocmd BufEnter * silent! lcd %:p:h  " some plugin fais with the former line
" bkp
set noswapfile
set nobackup "no stupid ~ files
set magic
set ignorecase
set smartcase
set wildignore=*.o,*~,*.pyc,*.doj      " Ignore some files for wildmenu
set wildmode=longest,list,full
set wildmenu
set autoread
set incsearch
" Tabs
set tabstop=2
set expandtab
set shiftwidth=2
set softtabstop=2
set smarttab
set textwidth=99
set nosmartindent
set cc=100

" Undofile
set undofile
set undodir=/home/jduc/.vimundo/

set cursorline
set ttimeoutlen=0
set timeoutlen=700
set wildmode=longest,list,full "command line completion
set wildmenu
set mouse=a "mouse auto
set laststatus=2                             " always show statusbar
set backspace=2 "backspace normal
set history=1000
set undolevels=1000  " lots of undo
set noerrorbells "dont beep

set foldmethod=indent
set foldlevel=99
" Encoding
set encoding=utf8
setglobal fileencoding=utf-8
set fileencodings=ucs-bom,utf-8,latin1
set termencoding=utf-8

ino <C-C> <Esc>
nnoremap <F2> :set invpaste paste?<CR>
set pastetoggle=<F2>

" file style
set linebreak 

" Use ag instead of grep
if executable('ag')
    set grepprg=ag\ --nogroup\ --column\ --smart-case\ --nocolor\ --follow
    set grepformat=%f:%l:%c:%m
endi

"autocmd BufEnter * lcd %:p:h
set t_Co=256
set background=dark

colorscheme base16-default-dark

"powerline
"let g:Powerline_symbols = 'fancy'

"Exit terminal 
tnoremap <esc><esc> <C-\><C-n>
"autocmd BufWinEnter,WinEnter term://* startinsert


set guicursor=a:blinkon0
" cause Tmux 
noremap <F4> :set hlsearch! hlsearch?<CR>
nnoremap <CR> :nohlsearch<CR><CR>
nnoremap k gk
nnoremap j gj
nnoremap 0 g0
nnoremap $ g$
nnoremap ^ g^
"Tab stuff # replaced now for buffer
nnoremap tn :bn<CR>
nnoremap tp :bp<CR>
nnoremap te :ene<CR>
nnoremap td :bp <BAR> bd #<CR>
nnoremap tt :b#<CR>
nnoremap T :b
"Make it possible to use . in visual
vnoremap . : normal . <CR>
" Search selection
vnoremap * y/<C-R>"<CR>

" gO to open file with default program
nnoremap gO :!xdg-open <cfile>& <CR>

" Map <C-c> to <Escape> in insert mode
function! ToggleEscapeRemap()
  if empty(mapcheck('<C-c>', 'i'))
    inoremap <C-c> <Esc>
  else
    iunmap <C-c>
  endif

  return ''
endfunction

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" KEY MAPPING
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" run bash code
nmap <leader>g :.w !bash <CR>
vmap <leader>g :w !bash <CR>

" Quick select what got pasted
noremap gV `[v`]
map q: :q


" IMPORTANT: grep will sometimes skip displaying the file name if you
" search in a singe file. This will confuse Latex-Suite. Set your grep
" program to always generate a file-name.
set grepprg=grep\ -nH\ $*

" Remove trailing
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

command -bar -nargs=? ShowSpaces call ShowSpaces(<args>)
command -bar -nargs=0 -range=% TrimSpaces <line1>,<line2>call TrimSpaces()
nnoremap <F12>     :ShowSpaces 1<CR>
nnoremap <S-F12>   m`:TrimSpaces<CR>``
vnoremap <S-F12>   :TrimSpaces<CR>



" OPTIONAL: Starting with Vim 7, the filetype of empty .tex files defaults to
" 'plaintex' instead of 'tex', which results in vim-latex not being loaded.
" The following changes the default filetype back to 'tex':
"flet g:tex_flavor='latex'
"
let g:Tex_DefaultTargetFormat = 'pdf'
let g:Tex_MultipleCompileFormats='pdf, aux'
"let g:tex_flavor='pdflatex'
let g:tex_flavor='xelatex'
let g:Tex_ViewRule_pdf = 'zathura'
let g:Tex_GotoError=0
let g:Tex_FoldedEnvironments="frame"
function SetXeTex()
	let g:Tex_CompileRule_pdf = 'xelatex -aux-directory=F:/Vim/my_latex_doc/temp --synctex=-1 -src-specials -interaction=nonstopmode $*'
endfunction
map <Leader>lx :<C-U>call SetXeTex()<CR>


" Set specific type params
set iskeyword-=_
autocmd FileType html setlocal syntax=html sw=2 ts=2 cc=0
autocmd FileType r setlocal sw=2 ts=2 iskeyword-=.
autocmd FileType tex setlocal sw=2 ts=2 tw=0 cc=0
autocmd FileType sh setlocal ts=2 sw=2 tw=0
autocmd FileType python setlocal sw=4 ts=8
autocmd BufRead,BufNewFile REPORT.html,README.html setlocal syntax=markdown
"
" vim R plugin
let vimrplugin_source_args = "echo = TRUE"
