" define theme 
let theme="solarized"
set background=dark
" backspace key expected behavior
set backspace=indent,eol,start
" restore indent after typing hash
"set smartindent
set cindent
set cinkeys-=0#
set indentkeys-=0#
"inoremap # X<BS>#

" use Mac system clipboard
set clipboard=unnamed
" highlight the screen line of the cursor
set cursorline
" highlight the search pattern
set hlsearch
" show invisibles
set list
set listchars=tab:»-,eol:¬,trail:·
" show the line and column number of the cursor position
set ruler
"set rulerformat=%15(%c%V\ %p%%%)
" minimal number of screen lines to keep above and below the cursor
set scrolloff=2
" only if there are at least two tab pages
set showtabline=1
" enable 2^8 colors
set t_Co=256
" use visual bell instead of beeping
set visualbell

" show (partial) command in status line
set showcmd
" show matching brackets
set showmatch
" do case insensitive matching
set ignorecase
" do smart case matching
set smartcase
" incremental search
set incsearch
" autosave before commands like :next and :make
set autowrite
" hide buffers when they are abandoned
set hidden
" enable mouse usage (all modes)
set mouse=a

" status line always
set laststatus=2
" print the line number in front of each line
set number
" use the appropriate number of spaces to insert a tab
set expandtab
" number of spaces to use for each step of (auto)indent
set shiftwidth=4
" <Tab> inserts blanks according to 'shiftwidth'
set smarttab
" number of spaces <Tab> counts for while editing
"set softtabstop=2
" command-line completion operates in an enhanced mode
set wildmenu
" completion mode that is used for 'wildchar'
set wim=longest,full

" load indentation rules and plugins according to the detected filetype
filetype plugin indent on
" syntax highlighting
syntax on

" jump to the last position when reopening a file
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" quick switch buffer
map <Tab><Tab> :b#<CR>

" scroll wheel move one line in Normal mode
map <ScrollWheelUp> <C-Y>
map <S-ScrollWheelUp> <C-U>
map <ScrollWheelDown> <C-E>
map <S-ScrollWheelDown> <C-D>

" cycle buffers
nnoremap <C-n> :bnext<CR>
nnoremap <C-p> :bprevious<CR>

" pair completion
inoremap { {}<Left>
inoremap {<CR> {<CR>}<Esc>O
inoremap {{ {
inoremap {} {}
" skip over closing character
inoremap ( ()<Left>
inoremap <expr> ) strpart(getline('.'), col('.')-1, 1) == ")" ? "\<Right>" : ")"
" handle quotes
"inoremap <expr> ' strpart(getline('.'), col('.')-1, 1) == "\'" ? "\<Right>" : "\'\'\<Left>"
"inoremap <expr> " strpart(getline('.'), col('.')-1, 1) == "\"" ? "\<Right>" : "\"\"\<Left>"

" identify syntax highlight group
map <F10> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<' . synIDattr(synID(line("."),col("."),0),"name") . "> lo<" . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>

" load colorscheme
if filereadable($HOME."/.vim/colors/".theme.".vim")
  execute "colorscheme ".theme
endif

