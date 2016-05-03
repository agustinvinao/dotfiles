" vimrc
set undofile                " Save undo's after file closes
set undodir=$HOME/.nvim/undo " where to save undo histories
set undolevels=1000         " How many undos
set undoreload=10000        " number of lines to save for undo

" Plugins ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
if empty(glob('~/.nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin('~/.nvim/plugged')
Plug 'reedes/vim-wordy'
Plug 'jiangmiao/auto-pairs'
Plug 'dyng/ctrlsf.vim'
Plug 'Shougo/deoplete.nvim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --bin' } |  Plug 'junegunn/fzf.vim'
Plug 'jaxbot/github-issues.vim'
Plug 'ludovicchabant/vim-gutentags'
Plug 'benekastah/neomake', { 'on': ['Neomake'] }
Plug 'kassio/neoterm'
Plug 'Shougo/neosnippet' | Plug 'Shougo/neosnippet-snippets'
Plug 'scrooloose/nerdtree', { 'on': ['NERDTreeFind', 'NERDTreeToggle'] }
Plug 'tmux-plugins/vim-tmux-focus-events'
Plug 'ntpeters/vim-better-whitespace'
Plug 'gorodinskiy/vim-coloresque', { 'for': ['css', 'sass', 'scss', 'less'] }
Plug 'tpope/vim-commentary'
Plug 'junegunn/vim-easy-align'
Plug 'easymotion/vim-easymotion'
Plug 'tpope/vim-fugitive' | Plug 'gregsexton/gitv', { 'on': 'Gitv' }
Plug 'tpope/vim-eunuch'
Plug 'matze/vim-move'
Plug 'terryma/vim-multiple-cursors'
" Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'mhinz/vim-sayonara', { 'on': 'Sayonara' }
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-speeddating'
Plug 'janko-m/vim-test', { 'on': ['TestFile', 'TestLast', 'TestNearest', 'TestSuite', 'TestVisit'] }
Plug 'tmux-plugins/vim-tmux'
Plug 'christoomey/vim-tmux-navigator'
Plug 'benmills/vimux'

" Interface ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Plug 'flazz/vim-colorschemes'
" Plug 'Yggdroot/indentLine'
Plug 'vim-scripts/restore_view.vim'
" Plug 'airblade/vim-gitgutter'
Plug 'henrik/vim-indexed-search'
" Plug 'oguzbilgic/sexy-railscasts-theme'
Plug 'dhruvasagar/vim-railscasts-theme'

" Ruby specific ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-rails'
Plug 'p0deje/vim-ruby-interpolation', { 'for': ['ruby'] }
Plug 'ecomba/vim-ruby-refactoring', { 'for': ['ruby'] }
" Plug 'ngmy/vim-rubocop'
Plug 'scrooloose/syntastic'
" , { 'for': ['ruby'] }

" Javascript specific ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Plug 'matthewsimo/angular-vim-snippets'
Plug 'justinj/vim-react-snippets'
Plug 'othree/javascript-libraries-syntax.vim'
Plug 'mxw/vim-jsx'

" Neo4J specific ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Plug 'neo4j-contrib/cypher-vim-syntax'

" RubyMotion specific ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Plug 'rcyrus/snipmate-snippets-rubymotion'

call plug#end()


" General options ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" Watch for changes in .vimrc and automatically reload the config.
augroup reload_vimrc " {
    autocmd!
    autocmd BufWritePost $MYVIMRC source $MYVIMRC
augroup END " }

" Configure search
set ignorecase smartcase

" Use system's clipboard. Keep platform specific settings
set clipboard=unnamed,unnamedplus

" Support per directory configuration
set exrc secure

" No backup or swapfile
set nobackup nowritebackup noswapfile

" Use zsh as shell
set shell=/usr/bin/zsh

" Interface ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" Colorscheme
set background=dark
colorscheme railscasts
" Tomorrow-Night
hi VertSplit guibg=#AAA

" Show line numbers
set number numberwidth=2

" Highlight column limit
set textwidth=80 colorcolumn=+1

" Line cursors on insert mode
let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1

" Enable true color
let $NVIM_TUI_ENABLE_TRUE_COLOR=1

" Start terminal in insert mode
au BufEnter * if &buftype == 'terminal' | :startinsert | endif

" Areas where the splits should occur
set splitbelow splitright

" Breaklines
set linebreak breakindent
let &showbreak = '↪'
set cpo+=n

" Redraw only when we need to
set lazyredraw

" Formatting ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" Spelling
set spellfile=$HOME/.vim/spell/en.utf-8.add spelllang=en

"
set expandtab shiftround

" Use tabs as spaces, default identation: 2 spaces
set sw=2 ts=2 sts=2

" Set spelling, syntax highlighting for Markdown
au BufRead,BufNewFile *.md setlocal spell filetype=markdown

" Automatically wrap at 72 characters and spell check git commit messages
au FileType gitcommit setlocal textwidth=72 spell

" Enable folding
set foldmethod=indent
set foldlevel=99
au FileType vim
\   setl foldmethod=marker
\ | setl foldenable
\ | setl foldlevel=0

" Enable filetype specific indenting and plugins
filetype indent plugin on

" Custom key mapings ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" Leader is space
let mapleader=" "

" Edit vim configuration
nmap <leader>ev :vsplit $MYVIMRC <cr>

" Save file
noremap <leader>w :update <cr>

" Quicker window movement
nmap <c-j> <c-w>j
nmap <c-k> <c-w>k
nmap <c-l> <c-w>l
nmap <c-h> <c-w>h

" Easy splitting
map <leader>s :split <cr>
map <leader>v :vsplit <cr>

" Replace hashrockets with 1.9 hash style syntax
nmap <Leader>: :%s/:\([^ ]*\)\(\s*\)=>/\1:/gc <cr>o

" Switch between the last two files
nmap <leader><leader> <c-^>

" Open current file with external tool
nmap <leader>E :!xdg-open % <CR> <CR>

" map . in visual mode
vnoremap . :norm.<cr>

" unmap F1 help
nmap <F1> <nop>
imap <F1> <nop>

" unmap ex mode: 'Type visual to go into Normal mode.'
nmap Q <nop>

" Auto Pairs  ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
let g:AutoPairsShortcutToggle = ''
let g:AutoPairsMultilineClose = 1

" CtrlSF +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
let g:ctrlsf_position = 'left'
let g:ctrlsf_winsize = '80'
let g:ctrlsf_indent = 2
nmap <leader>/ <Plug>CtrlSFPrompt
vmap <leader>/ <Plug>CtrlSFVwordPath
" au FileType ctrlsf setlocal norelativenumber nonumber

" Deoplete +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
let g:deoplete#enable_at_startup = 1

" Let <Tab> also do completion
inoremap <silent><expr> <Tab>
\ pumvisible() ? "\<C-n>" :
\ deoplete#mappings#manual_complete()

" Close the documentation window when completion is done
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif

" FZF ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
nmap <leader>f :FZF <cr>
if executable('ag')
  let $FZF_DEFAULT_COMMAND='ag -l -g ""'
endif
let g:fzf_layout = { 'down': '~40%' }
nmap <leader>f :Files <cr>
nmap <leader>b :Buffers <cr>
" Escapes on esc
au FileType fzf tnoremap <nowait><buffer> <esc> <c-g>
" This is the default extra key bindings
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }

" Github Issues ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
let g:github_access_token = $GITHUB_TOKEN
let g:gissues_async_omni = 1
let g:gissues_lazy_load = 1

" Indent Line ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
let g:indentLine_enabled=0
let g:indentLine_leadingSpaceEnabled=1
let g:indentLine_fileTypeExclude=['jade']

" Neosnippet +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
let g:neosnippet#enable_snipmate_compatibility = 1
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: "\<TAB>"

" Nerdtree +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
map <leader>d :NERDTreeToggle<cr>
map <leader>D :NERDTreeFind<cr>
let g:NERDTreeMinimalUI = 1
" let NERDTreeQuitOnOpen = 1
let g:NERDTreeAutoDeleteBuffer=1
let g:NERDTreeIgnore=[
  \ '\.git$',
  \ '\.sass-cache$',
  \ '\.tmp$',
  \ 'tags$',
  \ 'tmp$',
  \ 'node_modules$' ]

" Neomake ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
let g:neomake_verbose = 0
autocmd! BufWritePost,BufEnter * Neomake

" Neoterm ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
let g:neoterm_position = 'vertical'
let g:neoterm_size = 80


" Vim Easymotion +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
let g:EasyMotion_smartcase = 1
let g:EasyMotion_do_mapping = 0 " Disable default mappings
nmap s <Plug>(easymotion-s2)

" Vim Gitgutter ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
" let g:gitgutter_override_sign_column_highlight = 0
" let g:gitgutter_realtime = 0
" let g:gitgutter_eager = 0
" hi SignColumn guibg=#AAA
" hi GitGutterAdd guibg=#AAA
" hi GitGutterChange guibg=#AAA
" hi GitGutterDelete guibg=#AAA
" hi GitGutterChangeDelete guibg=#AAA

" Javascript Libraries Syntax ++++++++++++++++++++++++++++++++++++++++++++++++++
let g:used_javascript_libs = 'underscore,jquery,react,flux'

" Vim JSX ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
let g:jsx_ext_required = 0

" Vim Multiple Cursors +++++++++++++++++++++++++++++++++++++++++++++++++++++++++
let g:multi_cursor_exit_from_visual_mode = 0
let g:multi_cursor_exit_from_insert_mode  = 0

" Vim Plug +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
nmap <leader>pu :PlugUpdate<CR>
nmap <leader>pU :PlugUpgrade<CR>
nmap <leader>pc :PlugClean<CR>
nmap <leader>pi :PlugInstall<CR>

" Vim Rails ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
nmap <leader>a :A <cr>
nmap <leader>av :AV <cr>
nmap <leader>as :AS <cr>


" Vim Sayonara +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
nnoremap <leader>q :Sayonara!<cr>
nnoremap <leader>Q :Sayonara<cr>

" Vim Test +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
let g:test#strategy = 'vimux'
let g:test#preserve_screen = 1
nmap <leader>T :TestFile<CR>
nmap <leader>t :TestNearest<CR>
nmap <leader>l :TestLast<CR>

let &runtimepath=("~/.nvim/,~/.nvim/spell/," . &runtimepath)

" Rubocop
" Mark syntax errors with :signs
let g:syntastic_enable_signs=1

" Do not automatically jump to the error when saving the file
" Jump feature is annoying to me as it automatically moves the cursor
let g:syntastic_auto_jump=0

" Show the error list automatically
" Allows you to easily navigate the quick fix list
let g:syntastic_auto_loc_list=1

" This is where the magic happens. Chain together different style checkers
" in order to check for both style flaws and syntax errors.
" Syntax checkers: https://github.com/scrooloose/syntastic/wiki/Syntax-Checkers
let g:syntastic_ruby_checkers=['rubocop', 'mri']
let g:syntastic_python_checkers=['pep8', 'pylint', 'python']
let g:syntastic_javascript_checkers=['jshint']
let g:syntastic_scala_checkers=['scalac', 'scalastyle']
