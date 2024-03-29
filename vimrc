" pathogen first
call pathogen#infect()
call pathogen#helptags()
"call pathogen#runtime_append_all_bundles()

" we want color
"syntax on
syntax enable

" explicitly get out of vi-compatible mode
set nocompatible

" don't use local version of .(g)vimrc, .exrc
set noexrc

" I like my background dark
set background=dark

" no wrapping of lines
set nowrap

" change color scheme
"colorscheme apprentice
colorscheme palenight
let g:palenight_terminal_italics=1

" use a simple color scheme for vimdiff
if &diff
	colorscheme desert
endif

" vim hardcodes background color erase even if the terminfo file does
" not contain bce (not to mention that libvte based terminals
" incorrectly contain bce in their terminfo files). This causes
" incorrect background rendering when using a color theme with a
" background color.
let &t_ut=''

" break the line after
"set textwidth=75

" text encoding
set enc=utf-8

" fast terminal
set ttyfast

" Enable filetype detection
"filetype on

" Enable filetype-specific indenting
filetype indent on

" Enable filetype-specific plugins
filetype plugin on

" Tab are Tab and Spaces are Spaces!
"set noexpandtab

" No Tabs anywhere!
set expandtab

" use backspace like every other app
set backspace=2

" no autoindent as it messes up everything...
"set noautoindent
set smartindent

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
set belloff=all

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
" disabled for now, testing complete
"let g:SuperTabDefaultCompletionType = "context"
"let g:SuperTabDefaultCompletionType = "<C-X><C-O>"

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
autocmd FileType ruby,eruby,yaml,javascript set shiftwidth=2
autocmd FileType ruby,eruby,yaml,javascript set softtabstop=2
autocmd FileType ruby,eruby,yaml,javascript set tabstop=2
autocmd FileType ruby,eruby,yaml,javascript set expandtab

autocmd FileType ruby,eruby set omnifunc=rubycomplete#Complete
autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1
autocmd FileType ruby,eruby let g:rubycomplete_rails = 1
autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1

" Update tags file when saving a file
autocmd FileType java
	\ autocmd BufWritePost * execute '! if [ -d .git ] || git rev-parse --git-dir > /dev/null 2>&1 ; then ctags --extras=+f --exclude=.git --exclude=log -R *; fi'

" use ruby 1.9 in vim
let s:ruby_path = "~/.rvm/rubies/default/bin/"

" automagically change the current directory for the file in the active window
" thought that might be a good idea, but what I really need is the root
" directory of a project...
"autocmd BufEnter * silent! lcd %:p:h

" Textwidth only for SLRN und Mutt
au BufNewFile,BufRead .followup,.article.*,.letter.*,/tmp/mutt-*,nn.*,snd.*,mutt* set tw=72

" Colors in Mails
au BufNewFile,BufRead /tmp/mutt-* :so /usr/local/share/vim/vim81/syntax/mail.vim

" Colors for slrn's score-file
au BufRead .slrn-score :so /usr/local/share/vim/vim81/syntax/slrnsc.vim

" No Textwidth for HTML
au BufRead *.htm,*.html,*.shtml set textwidth=0

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
au BufRead .mutt* :so /usr/local/share/vim/vim81/syntax/muttrc.vim

function s:pythonSettings()
    set tabstop=4
    set softtabstop=4
    set shiftwidth=4
    set textwidth=80
    set expandtab
    set autoindent
    set fileformat=unix
endfunction

au BufNewFile,BufRead *.py call s:pythonSettings()

" workaround for editing crontabs
au BufEnter /private/tmp/crontab.* setl backupcopy=yes

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
command RefreshTags execute "!bundle list --paths=true | xargs ctags --extras=+f --exclude=.git --exclude=log -R *"
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
map <C-J> <C-W>j
map <C-K> <C-W>k
map <C-H> <C-W>h
map <C-L> <C-W>l

" bindings for the quickfix window
map <C-n> :cnext<CR>
map <C-m> :cprevious<CR>
nnoremap <leader>q :cclose<CR>

" go go go
"
let g:go_fmt_command = "goimports"
"let g:go_highlight_types = 1
"let g:go_highlight_fields = 1
"let g:go_highlight_functions = 1
"let g:go_highlight_function_calls = 1
"let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_def_mode='gopls'
let g:go_info_mode='gopls'
let g:go_imports_autosave = 1

" run :GoBuild or :GoTestCompile based on the go file
function! s:build_go_files()
  let l:file = expand('%')
  if l:file =~# '^\f\+_test\.go$'
    call go#test#Test(0, 1)
  elseif l:file =~# '^\f\+\.go$'
    call go#cmd#Build(0)
  endif
endfunction

autocmd FileType go nmap <leader>B :<C-u>call <SID>build_go_files()<CR>
autocmd FileType go nmap <leader>R  <Plug>(go-run)
autocmd FileType go nmap <leader>T  <Plug>(go-test)
autocmd FileType go nmap <Leader>C <Plug>(go-coverage-toggle)

" Rust stuff
set hidden
let g:racer_cmd = "/home/awarnecke/.cargo/bin/racer"

" Easier shortcut for autocompletion
imap <C-J> <C-X><C-O>

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
let g:CommandTMaxDepth=15
let g:CommandTPreferredImplementation='ruby'

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
"let g:airline_theme = "badwolf"
let g:airline_theme = "palenight"

" Ignore some files in ctags generation
let g:vim_tags_ignore_files = ['.gitignore', '.svnignore', '.cvsignore', '*.js', '*.json', '*.css']

" Vdebug options
" for remote debugging
let g:vdebug_options= {
	\    "path_maps" :{"/home/web": $HOME."/workspace/etsuite"},
	\    "watch_window_style" : 'compact'
	\}

" Ag options
" open ag.vim
nnoremap <leader>a :Ag<Space>
" Highlight the search term in the results
let g:ag_highlight=1
" Ag command line options
let g:ag_prg="ag --column --ignore tags --smart-case"

" Indent Guides settings
"let g:indent_guides_enable_on_vim_startup = 1

function! s:check_back_space()"{{{
       let col = col('.') - 1
       return !col || getline('.')[col - 1] =~ '\s'
endfunction"}}
" }}}
