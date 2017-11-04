" pathogen first
call pathogen#infect()
call pathogen#helptags()
"call pathogen#runtime_append_all_bundles()

" we want color
syntax on

" explicitly get out of vi-compatible mode
set nocompatible

" don't use local version of .(g)vimrc, .exrc
set noexrc

" I like my background dark
set background=dark

" no wrapping of lines
set nowrap

" change color scheme
"let g:solarized_termtrans=1
"let g:solarized_termcolors=256
"let g:solarized_contrast="high"
"let g:solarized_visibility="high"
"colorscheme solarized

"colorscheme atom-dark-256
"colorscheme monokai
colorscheme jellybeans

" use a simple color scheme for vimdiff
if &diff
	colorscheme desert
endif

" break the line after
"set textwidth=75

" text encoding
" does not work with --enable-multibyte, dunno
set enc=utf-8

" fast terminal
set ttyfast

" Enable filetype detection
filetype on

" Enable filetype-specific indenting
filetype indent on

" Enable filetype-specific plugins
filetype plugin on

" Tab are Tab and Spaces are Spaces!
set noexpandtab

" use backspace like every other app
set backspace=2

" no autoindent as it messes up everything...
"set noautoindent
set autoindent

"  backup options
set backup
set backupdir=~/.backup
set viminfo=%100,'100,/100,h,\"500,:100,n~/.viminfo

" make the history longer
set history=500

" highlight current line
"set cursorline

" show statusline
set laststatus=2

" be quiet
set noerrorbells

" don't blink
set novisualbell

" display the absolute line number at the line you're on
set number

" make it relative numbers
set relativenumber

" Keep the line number gutter narrow so three digits is cozy.
set numberwidth=2

" four spaces are one TAB
set shiftwidth=4
set softtabstop=4
set tabstop=4

" String to put at the start of lines that have been wrapped
set showbreak=+

" when a bracket is inserted, briefly jump to the matching one
set showmatch

" display current mode
set showmode

" enable incremental search
set incsearch

" ignore upper and lower case while searching
set ignorecase

" please be smart enough to recognize upper case in searches
set smartcase

" highlight search results as you type
set hlsearch

" stay away from the bottom line
set scrolloff=4

" enhanced command-line completion
"set wildmenu

" substitute globally by default
set gdefault

" autocomplete filenames to the longest or show me a list
set wildmode=longest,list

" When on, the title of the window will be set to the value of
" 'titlestring' (if it is not empty)
set title

" fold on syntax
set foldmethod=syntax

" enable folding
set foldenable

" column width for fold showing, always
set foldcolumn=1

" open most folds by default
set foldlevelstart=10
"
" 10 nested fold max
set foldnestmax=10

" split windows appear to the right
set splitright
" or below the active window
set splitbelow

" Define the look of title
"set titlestring=%t%(\ %M%)%(\ (%{expand(\"%:~:.:h\")})%)%(\ %a%)
set title titlestring=%<%F\ %M%=%l/%L\ -\ %p%% titlelen=40

" Last - but not least - playing with the statusline
" See >:h statusline< for more details
set statusline=[%n][File:%f]%m%=[Row:%l][Col:%c][%p%%]

" Enable compiler support for ruby
compiler ruby

" use ctags
set tags=tags;/

" set the leader
let mapleader = ";"

" improve autocomplete menu color
"highlight Pmenu ctermbg=238 gui=bold
highlight Pmenu ctermbg=White ctermfg=Darkblue gui=bold

" SuperTab
" disabled for now, testing neocomplcache
let g:SuperTabDefaultCompletionType = "context"

" Syntastic
let g:syntastic_enable_signs=1  "use signs to tell about syntax error
let g:syntastic_auto_jump=1 	"jump to the first error after detection
let g:syntastic_auto_loc_list=1 "automatically open the :Errors window and close it
let g:syntastic_stl_format = '[%E{Err: %fe #%e}%B{, }%W{Warn: %fw #%w}]'

" Syntastic statusline enhancements
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

" automatically set some special behavior
" ruby standard 2 spaces, always
autocmd FileType ruby,eruby,yaml set shiftwidth=2
autocmd FileType ruby,eruby,yaml set softtabstop=2
autocmd FileType ruby,eruby,yaml set tabstop=2
autocmd FileType ruby,eruby,yaml set expandtab

autocmd FileType ruby,eruby set omnifunc=rubycomplete#Complete
autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1
autocmd FileType ruby,eruby let g:rubycomplete_rails = 1
autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1

" use ruby 1.9 in vim
let s:ruby_path = "~/.rvm/rubies/default/bin/"

" automagically change the current directory for the file in the active window
" thought that might be a good idea, but what I really need is the root
" directory of a project...
"autocmd BufEnter * silent! lcd %:p:h

" Textwidth only for SLRN und Mutt
au BufNewFile,BufRead .followup,.article.*,.letter.*,/tmp/mutt-*,nn.*,snd.*,mutt* set tw=72

" Colors in Mails
au BufNewFile,BufRead /tmp/mutt-* :so /usr/local/share/vim/vim80/syntax/mail.vim

" Colors for slrn's score-file
au BufRead .slrn-score :so /usr/local/share/vim/vim80/syntax/slrnsc.vim

" No Textwidth for HTML
au BufRead *.htm,*.html,*.shtml set textwidth=0

" 2 spaces for javascript, like ruby
au BufRead *.js set sw=2

function s:setupWrapping()
	set wrap
	set wrapmargin=2
	set textwidth=80
endfunction

" Make sure all markdown files have the correct filetype set and setup wrapping
au BufRead,BufNewFile *.{md,markdown,mdown,mkd,mkdn,txt} setf markdown | call s:setupWrapping()
"
" Colors for .muttrc and other mutt-related config-files
" nmap <F9> :so /usr/local/share/vim/vim80/syntax/muttrc.vim<CR>
" nope, all beginning with .mutt* automatically please
au BufRead .mutt* :so /usr/local/share/vim/vim80/syntax/muttrc.vim

" workaround for editing crontabs
au BufEnter /private/tmp/crontab.* setl backupcopy=yes

" neocomplcache
" {{{
let g:neocomplcache_enable_at_startup = 1
let g:neocomplcache_enable_auto_select = 1
let g:neocomplcache_enable_smart_case = 1
let g:neocomplcache_enable_camel_case_completion = 1
let g:neocomplcache_enable_underbar_completion = 1

let g:neocomplcache_source_disable = {
			\ 'syntax_complete': 1,
			\ }

let g:neocomplcache_auto_completion_start_length = 2

if !exists('g:neocomplcache_omni_patterns')
	let g:neocomplcache_omni_patterns = {}
endif

let g:neocomplcache_omni_patterns.ruby = '[^. *\t]\.\w*\|\h\w*::'
let g:neocomplcache_omni_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
let g:neocomplcache_omni_patterns.c = '\%(\.\|->\)\h\w*'
let g:neocomplcache_omni_patterns.cpp = '\h\w*\%(\.\|->\)\h\w*\|\h\w*::'

" don't show the completion pop up without hitting keys.
let g:neocomplcache_disable_auto_complete = 1

" use tab for neocomplcache completion
inoremap <expr><TAB> pumvisible() ? "\<C-n>" : <SID>check_back_space() ? "\<TAB>" : "\<C-x>\<C-u>"

function! s:check_back_space()"{{{
	let col = col('.') - 1
	return !col || getline('.')[col - 1] =~ '\s'
endfunction"}}
" }}}

" Umlaute in HTML documents
autocmd FileType html call Doit()
function Doit()
	set textwidth=75 nobackup
	imap ß &szlig;
	imap ä &auml;
	imap Ä &Auml;
	imap ü &uuml;
	imap Ü &Uuml;
	imap ö &ouml;
	imap Ö &Ouml;
endfunction

" ctag generation for Ruby projects
" Create tags for all the installed gems for the current activated Ruby (rbenv and rvm are supported).
" This takes a very long time to execute, that's why I disabled it.
" map rt :!ctags --extra=+f --exclude=.git --exclude=log -R * gem environment gemdir/gems/*

" This does the same thing but scopes the set of gems declared in the Gemfile
command RefreshTags execute "!bundle list --paths=true | xargs ctags --extra=+f --exclude=.git --exclude=log -R *"
map <leader>rt :RefreshTags<CR>

" remap key Q
nnoremap Q gq

" toggle the current fold
nnoremap <Space> za

" close window
nnoremap <leader>c :close<CR>

" kill the buffer
nnoremap <leader>k :bd<CR>

" automatically re-indent the whole file and return to current positon
nnoremap <leader>= mzgg=G`z<CR>

" keymappings for navigating splitwindows
map <C-J> <C-W>j<C-W>_
map <C-K> <C-W>k<C-W>_
map <C-H> <C-W>h<C-W>_
map <C-L> <C-W>l<C-W>_

" Move visual block
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

" keymappings for command-t plugin
noremap <leader>o <Esc>:CommandT<CR>
noremap <leader>O <Esc>:CommandTFlush<CR>
noremap <leader>b <Esc>:CommandTBuffer<CR>

" command-t options
let g:CommandTMaxHeight=40
let g:CommandTMaxFiles=80000
let g:CommandTMaxDepth=8

" disable <C-s> and <C-q> in terminal to make command-t
" keybindings work
silent !stty -ixon > /dev/null 2>/dev/null

" toggle paste mode
nnoremap <leader>p :set invpaste<CR>

" toogle Gundo window
let g:gundo_prefer_python3 = 1
nnoremap <F7> :GundoToggle<CR>

" toggle tagbar window
nmap <F8> :TagbarToggle<CR>
let g:tagbar_type_ruby = {
			\ 'kinds' : [
			\ 'm:modules',
			\ 'c:classes',
			\ 'd:describes',
			\ 'C:contexts',
			\ 'f:methods',
			\ 'F:singleton methods'
			\ ]
			\ }

" Get off my lawn
nnoremap <Left> :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up> :echoe "Use k"<CR>
nnoremap <Down> :echoe "Use j"<CR>

" Powerline font options for airline plugin
let g:airline_powerline_fonts = 1
"let g:airline_theme = "powerlineish"
let g:airline_theme = "badwolf"

" Vdebug options
" for remote debugging
let g:vdebug_options= {
	\    "path_maps" :{"/home/web": $HOME."/workspace/etsuite"},
	\    "watch_window_style" : 'compact'
	\}

" Ag options
" open ag.vim
nnoremap <leader>a :Ag
" Highlight the search term in the results
let g:ag_highlight=1
" Ag command line options
let g:ag_prg="ag --column --ignore tags --smart-case"

"" Unite
"let g:unite_source_history_yank_enable = 1
"call unite#filters#matcher_default#use(['matcher_fuzzy'])
"nnoremap <leader>o :<C-u>Unite -no-split -buffer-name=files   -start-insert file_rec<cr>
"nnoremap <leader>f :<C-u>Unite -no-split -buffer-name=files   -start-insert file<cr>
"nnoremap <leader>r :<C-u>Unite -no-split -buffer-name=mru     -start-insert file_mru<cr>
"nnoremap <leader>y :<C-u>Unite -no-split -buffer-name=yank    history/yank<cr>
"nnoremap <leader>b :<C-u>Unite -no-split -buffer-name=buffer  buffer<cr>
"
"" Custom mappings for the unite buffer
"autocmd FileType unite call s:unite_settings()
"function! s:unite_settings()
"  " Play nice with supertab
"  let b:SuperTabDisabled=1
"  " Enable navigation with control-j and control-k in insert mode
"  imap <buffer> <C-j>   <Plug>(unite_select_next_line)
"  imap <buffer> <C-k>   <Plug>(unite_select_previous_line)
"endfunction

