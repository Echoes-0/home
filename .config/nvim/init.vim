set shell=/bin/zsh

set nocompatible              " be iMproved, required

" set the leader key
let mapleader = "\<Space>"
let maplocalleader = "\<Space>"

" " set the runtime path to include Vundle and initialize
" set rtp+=~/.vim/bundle/Vundle.vim

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" PLUGINS START
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin("~/.nvim/plugged")
" autoread when a file is changed
Plug 'djoshea/vim-autoread'

" Fuzzy file finder
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': 'yes \| ./install' }
Plug 'junegunn/fzf.vim'
nnoremap <c-b> :Buffers<CR>
nnoremap <c-p> :Files<CR>

" Syntax highlighting for tmux conf
Plug 'tmux-plugins/vim-tmux'

" Easy comment stuff with gcc command
Plug 'tomtom/tcomment_vim'

"Lib necessary for things
Plug 'tomtom/tlib_vim' 

" Move anywhere with 2 key
Plug 'justinmk/vim-sneak'
let g:sneak#label = 1
    
" Change () and [] {} etc.. easy
Plug 'tpope/vim-surround'

"ga inspect char
Plug 'tpope/vim-characterize'

" Allows usage of command such as :Chmod :Mkdir etc...
Plug 'tpope/vim-eunuch'

" Repeat with . certain command that don't work othewise
Plug 'tpope/vim-repeat'

" Git in vim
Plug 'tpope/vim-fugitive'

" Default params accepted by all
Plug 'tpope/vim-sensible'

" Use of ag in vim
Plug 'jremmen/vim-ripgrep'

" Show macro and regisers
Plug 'junegunn/vim-peekaboo'
let g:peekaboo_delay = 400

" Some stuff for othe plugin'
Plug 'vim-scripts/vim-addon-mw-utils'

Plug 'lervag/vimtex'
let g:vimtex_compiler_latexmk = {'continuous' : 0}

" Plug 'vim-latex/vim-latex'
" let g:tex_conceal="dmgs"
" let g:tex_flavor="latex"

" Base 16 theme
Plug 'chriskempson/base16-vim'
let base16colorspace=256  " Access colors present in 256 colorspace

Plug 'itchyny/lightline.vim'
let g:lightline = {
      \ 'colorscheme': 'jellybeans',
      \ 'separator' : {'left' : '', 'right': ''},
      \ 'subseparator' : {'left' : '', 'right': ''},
      \ }

" Plug 'mgee/lightline-bufferline'
" let g:lightline.tabline          = {'left': [['buffers']], 'right': [['close']]}
" let g:lightline.component_expand = {'buffers': 'lightline#bufferline#buffers'}
" let g:lightline.component_type   = {'buffers': 'tabsel'}

" R stuff
Plug 'jalvesaq/Nvim-R'
" vim R plugin
let vimrplugin_source_args = "echo = TRUE"
Plug 'jalvesaq/nvimcom'

Plug 'jalvesaq/vimcmdline'
" vimcmdline mappings
let cmdline_map_start          = '<LocalLeader>s'
let cmdline_map_send           = '<LocalLeader>se'
let cmdline_map_send_and_stay  = '<LocalLeader>ll'
let cmdline_map_source_fun     = '<LocalLeader>f'
let cmdline_map_send_paragraph = '<LocalLeader>pp'
let cmdline_map_send_block     = '<LocalLeader>bb'
let cmdline_map_quit           = '<LocalLeader>q'
" vimcmdline options
let cmdline_vsplit      = 1      " Split the window vertically
let cmdline_esc_term    = 1      " Remap <Esc> to :stopinsert in Neovim's terminal
let cmdline_in_buffer   = 1      " Start the interpreter in a Neovim's terminal
let cmdline_term_height = 15     " Initial height of interpreter window or pane
let cmdline_term_width  = 100     " Initial width of interpreter window or pane
let cmdline_tmp_dir     = '/tmp' " Temporary directory to save files
let cmdline_outhl       = 1      " Syntax highlight the output
let cmdline_auto_scroll = 1      " Keep the cursor at the end of terminal (nvim)
let cmdline_follow_colorscheme = 1
let cmdline_app           = {}
let cmdline_app['python'] = 'ipython3'
let cmdline_app['sh']     = 'bash'


" Linter and completion "
"""""""""""""""""""""""""
" Plug 'w0rp/ale'
" let g:ale_completion_enabled = 0
" let b:ale_linters = {'python': ['pyls']}
" let g:ale_fixers = {'*': ['remove_trailing_lines', 'trim_whitespace'], 'python': ['black']}
" let g:ale_set_highlights = 0
"
" Plug 'autozimu/LanguageClient-neovim', {
"     \ 'branch': 'next',
"     \ 'do': 'bash install.sh',
"     \ }
"
" let g:LanguageClient_serverCommands = {
"     \ 'python': ['pyls'],
"     \ 'r': ['R', '--quiet', '--slave', '-e', 'languageserver::run()'],
"     \ 'sh': ['bash-language-server', 'start']
"     \ }

" Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
" set runtimepath+=~/.config/nvim/plugged/deoplete.nvim
" let g:deoplete#enable_at_startup = 1
" let g:deoplete#enable_smart_case = 1
" let g:deoplete#enable_camel_case = 1
" inoremap <expr> <S-Tab> deoplete#mappings#manual_complete()
"
" let g:deoplete#keyword_patterns = {}
" let g:deoplete#keyword_patterns._ = '\w{2,}'
" let g:deoplete#omni#input_patterns = {}
" let g:deoplete#omni#input_patterns.r = '\w+\$'
" let g:deoplete#sources = {}
" let g:deoplete#sources._ = []

" Plug 'zchee/deoplete-jedi'
" let g:deoplete#sources#jedi#show_docstring=1

" Plug 'davidhalter/jedi-vim'
" let g:jedi#completions_enabled = 0

Plug 'neoclide/coc.nvim', {'tag': '*', 'do': { -> coc#util#install()}}
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gr <Plug>(coc-references)
vmap <leader>gq  <Plug>(coc-format-selected)
nmap qf <Plug>(coc-fix-current)
nnoremap <silent> K :call <SID>show_documentation()<CR>
function! s:show_documentation()
  if &filetype == 'vim'
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

Plug 'Shougo/neosnippet.vim'
Plug 'Shougo/neosnippet-snippets'
imap <C-e>     <Plug>(neosnippet_expand_or_jump)
smap <C-e>     <Plug>(neosnippet_expand_or_jump)
xmap <C-e>     <Plug>(neosnippet_expand_target)

" New markdown syntax
Plug 'prurigro/vim-markdown-concealed'

" Preview markdown 
Plug 'JamshedVesuna/vim-markdown-preview'
let vim_markdown_preview_hotkey='<C-m>'
let vim_markdown_preview_github=1
let vim_markdown_preview_browser='Google Chrome'
let vim_markdown_preview_use_xdg_open=1

Plug 'mattn/emmet-vim'
"let g:user_emmet_expandabbr_key = '<c-e>'
"let g:user_emmet_install_global = 0
"autocmd FileType html,css EmmetInstall

" Buffer with list of mark 
Plug 'kshenoy/vim-signature' 


" Grammar checker
Plug 'vim-scripts/LanguageTool'
let g:languagetool_jar='/home/jduc/LanguageTool-3.2/languagetool-commandline.jar'

" Better match it
Plug 'tmhedberg/matchit'

" Allows to align things with :Tab
Plug 'godlygeek/tabular' 

" takes note
Plug 'vimwiki/vimwiki'
let g:vimwiki_list = [{'path': '~/ownCloud/notes/vimwiki'}]
map <Leader>tt <Plug>VimwikiToggleListItem
nnoremap <F5> "=strftime("%Y-%d-%m %H:%M")<CR>P
inoremap <F5> <C-R>=strftime("%Y-%d-%m %H:%M")<CR>

" Run stuff asynchron
Plug 'skywind3000/asyncrun.vim'
nmap gO :AsyncRun mimeopen <cfile><CR>

call plug#end()
"""""""""""""""""""""""""""""""""""""""""""""""""""""

filetype plugin indent on
syntax on
let python_highlight_all = 1

"set icm=split "show preview of command typed

set showtabline=1 "show tabline even 1 tab
set noshowmode "hide the insert below powerline
set hidden "hide buffer instead of close
set showmatch "show match brackets
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
set iskeyword-=_


" Undofile
set undofile
set undodir=/home/jduc/.vimundo/

set cursorline
set ttimeoutlen=0
set timeoutlen=700
"set wildmode=longest,list,full "command line completion
set wildmenu
set mouse=a "mouse auto
set laststatus=2                             " always show statusbar
set backspace=2 "backspace normal
set history=1000
set undolevels=1000  " lots of undo
set noerrorbells "dont beep

set foldmethod=manual
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
if executable('rg')
    set grepprg=rg\ --nogroup\ --column\ --smart-case\ --nocolor\ --follow
    set grepformat=%f:%l:%c:%m
endi

"autocmd BufEnter * lcd %:p:h
set t_Co=256
set background=dark

colorscheme base16-default-dark

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


" Set specific type params
autocmd FileType html setlocal syntax=html sw=2 ts=2 cc=0
autocmd FileType r setlocal sw=2 ts=2 iskeyword-=.
autocmd FileType tex setlocal sw=2 ts=2 tw=0 cc=0
autocmd FileType sh setlocal ts=2 sw=2 tw=0
autocmd FileType python setlocal sw=4 ts=8
autocmd BufRead,BufNewFile REPORT.html,README.html setlocal syntax=markdown
autocmd FileType json syntax match Comment +\/\/.\+$+
