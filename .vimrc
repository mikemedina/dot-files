"{{{ Settings

let mapleader=","               " Set the leader key to ,
let g:netrw_banner=0            " Remove the default banner from the directory view
let g:netrw_browse_split=4      " Open files in the previous window, not directory window
let g:netrw_liststyle=3         " Set the default directory view type to 'tree'
let g:netrw_winsize=25          " Set the default width of the directory view to 25%

set autoindent                  " Maintain indentation when changing lines
set backspace=indent,eol,start  " Let <C-BS> delete freely
set expandtab                   " Convert Tabs to the number of spaces defined by tabstop
set fdm=marker                  " Fold {{{ }}} markers by default
set hlsearch                    " Highlight all search results
set ignorecase                  " Make searches case insensitive
set incsearch                   " Highlight search matches as searches are typed
set linebreak                   " Break words sensibly when wrap is turned on
set mouse=a                     " Enable the mouse in all modes
set nobackup                    " Don't create backup files
set nocompatible                " Turn off forced compatibility with old Vi
set noswapfile                  " Store buffers in memory instead of in temporary files
set nowrap                      " No line wrapping
set nowritebackup               " Don't create a temporary backup before saving
set number                      " Show line numbers
set relativenumber              " Show relative line numbers
set ruler                       " Show row and column
set scrolloff=5                 " Number of rows from vertical edge to start scrolling
set shiftwidth=4                " Number of spaces to indent code scope levels
set showmatch                   " Show matching brackets
set sidescroll=1                " Number of cols to scroll at a time
set sidescrolloff=15            " Number of cols from horizontal edge to start scrolling
set smartcase                   " Case sensitive search if search has capitals
set softtabstop=4               " Behave as though expandtab is off
set tabstop=4                   " Number of spaces that a Tab counts for
syntax on

if has ("gui_running")
    set columns=83              " Show 83 columns by default
    set lines=40                " Show 40 lines by default
    colorscheme elflord

    set guioptions -=T
    set guioptions -=m
    set guifont=Consolas:h11:cANSI
else
    colorscheme elflord
endif

if has("win32")
    source $VIMRUNTIME/mswin.vim
    behave mswin
endif

"}}}

"{{{ Key Swaps

" Swap # and * and prevent the automatic jump to the first matching result
noremap # *N
noremap * #N

" Swap 0 and ^ because 0 is easier to reach
noremap ^ 0
noremap 0 ^

" Swap G and gg because reasons
noremap gg G
noremap G gg

"}}}

"{{{ Custom Bindings

" Swap between the current and alternate buffers
nnoremap <C-Tab> <C-^>

" Rebind j/k to gj/gk so wrapped lines are treated like normal lines
nnoremap <silent> j gj
nnoremap <silent> k gk

" Press Enter to insert a newline below/above in NORMAL mode
nnoremap <Enter> o<Esc>
nnoremap <S-Enter> O<Esc>

" Maintain selection after indenting with << and >>
vnoremap < <gv
vnoremap > >gv

" Make puts match the indent of the current line
nnoremap p ]p
nnoremap P ]P

" Center the screen on each search result as they're cycled through
nnoremap n nzz
nnoremap N Nzz

" Press Alt+j/k to move the current line up or down
nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv

" Repeat last macro
noremap Q @@

" Search for the current visually selected text
vnoremap // y/<C-R>"<CR>

" Increment or decrement a number
nnoremap + <C-a>
nnoremap - <C-x>

" Press V to select the current line without the line ending
nnoremap V 0v$

" Press Y to yank from cursor to the end of line
nnoremap Y y$

" Press PgUp/Down to jump to the next non-whitespace character in the column
nnoremap <PageUp> :call search('\%' . virtcol('.') . 'v\S', 'bW')<CR>zz;<Esc>
nnoremap <PageDown> :call search('\%' . virtcol('.') . 'v\S')<CR>zz;<Esc>

" Press Ctrl+h/l to move left and right between tabs
nnoremap <C-h> :tabp<CR>
nnoremap <C-l> :tabn<CR>

" Press Alt+h/l to switch between splits
nnoremap <A-l> <C-w><C-l>
nnoremap <A-h> <C-w><C-h>

" Move the screen up and down with the cursor
nnoremap <C-j> j<C-e>
nnoremap <C-k> k<C-y>

" Press Space to turn off highlighting after a search
nnoremap <silent> <Space> :nohls<CR>

" Press F9 to run the current file in a Python shell
nnoremap <F9> :w<CR>:exec '!python' shellescape(@%, 1)<CR>

" Press =j to format a json file
nnoremap =j :%!python -m json.tool<CR>:set cc=0<CR>

" Press =c to format a csv file
nnoremap =c :let width = 20<CR>:let fill = repeat(' ', width)<CR>:%s/\([^,]*\),\=/\=strpart(submatch(1).fill, 0, width)/ge<CR>:%s/\s\+$//ge<CR>:set cc=0<CR>

"}}}

"{{{ Leader mappings

" Open .vimrc in a new tab
nnoremap <leader>v :tabe $MYVIMRC<CR>fCv$gf

" Find and replace the current selection
vnoremap <leader>r "zy:%s/<C-r>z//g<Left><Left>

" Open the built in File Explorer in its own split
nnoremap <leader>` :Vex<CR>

" Display the current list of buffers and await a buffer number
nnoremap <leader>b :ls<CR>:b<Space>

" Set syntax highlighting to None
nnoremap <leader>sn :set syntax=none<Enter>

" Set syntax highlighting to Java
nnoremap <leader>sj :set syntax=java<Enter>

" Set syntax highlighting to Javascript
nnoremap <leader>sjs :set syntax=javascript<Enter>

" Set syntax highlighting to SQL
nnoremap <leader>ss :set syntax=sql<Enter>

"}}}

