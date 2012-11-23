" pathogen first
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

" we want color
syntax on

" explicitly get out of vi-compatible mode
set nocompatible 

" don't use local version of .(g)vimrc, .exrc
set noexrc 

" I like my background dark
set background=dark

" change color scheme
let g:solarized_termtrans=1
let g:solarized_termcolors=256
let g:solarized_contrast="high"
let g:solarized_visibility="high"
colorscheme solarized

" before I used the solarized scheme this was pretty nice 
"if (&t_Co == 256 || &t_Co == 88) && !has('gui_running') &&
"      \ filereadable(expand("$HOME/.vim/plugin/guicolorscheme.vim"))
"      " Use the guicolorscheme plugin to makes 256-color or 88-color
"      " terminal use GUI colors rather than cterm colors.
"      runtime! plugin/guicolorscheme.vim
"      "GuiColorScheme candycode
"      GuiColorScheme darkspectrum
"else
"     " For 8-color 16-color terminals or for gvim, just use the
"     " regular :colorscheme command.
"     colorscheme candy
"endif

" break the line after
"set textwidth=75

" text encoding
" does not work with --enable-multibyte, dunno
"set encoding=de_DE.UTF-8
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

" no autoident as it messes up everything...
set noautoindent

"  backup options
set backup
set backupdir=~/.backup
set viminfo=%100,'100,/100,h,\"500,:100,n~/.viminfo

" make the history longer
set history=500

" highlight current line
set cursorline 

" show statusline
set laststatus=2

" be quiet
set noerrorbells

" don't blink
set novisualbell

" turn on line numbers
"set number 

" make it relative numbers
set relativenumber

" We are good up to 99999 lines
set numberwidth=5 

" four spaces are one TAB
set shiftwidth=4
set softtabstop=4
set tabstop=4

" String to put at the start of lines that have been wrapped
set showbreak=+

" when a bracket is inserted, briefly jump to the matching one (
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
set wildmenu

" substitute globally by default
set gdefault 

" autocomplete filenames to the longest or show me a list
set wildmode=longest,list

" When on, the title of the window will be set to the value of
" 'titlestring' (if it is not empty)
set title

" fold on syntax automagically, always
"set foldmethod=syntax         

" 2 lines of column for fold showing, always
set foldcolumn=2              

" Define the look of title
"set titlestring=%t%(\ %M%)%(\ (%{expand(\"%:~:.:h\")})%)%(\ %a%) 
set title titlestring=%<%F\ %M%=%l/%L\ -\ %p%% titlelen=70

" Last - but not least - playing with the statusline
" See >:h statusline< for more details
set statusline=[%n][File:%f]%m%=[Row:%l][Col:%c][%p%%]

" Enable compiler support for ruby
compiler ruby

" use ctags
set tags=tags;/

" set the leader
let mapleader = ";"

"improve autocomplete menu color
highlight Pmenu ctermbg=238 gui=bold

" SuperTab
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
autocmd FileType ruby,eruby set shiftwidth=2
autocmd FileType ruby,eruby set softtabstop=2
autocmd FileType ruby,eruby set tabstop=2
autocmd FileType ruby,eruby set expandtab

autocmd FileType ruby,eruby set omnifunc=rubycomplete#Complete
autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1
autocmd FileType ruby,eruby let g:rubycomplete_rails = 1
autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1

" use ruby 1.9 in vim
let s:ruby_path = "/Users/madhatter/.rvm/rubies/default/bin/"

" Textwidth only for SLRN und Mutt
au BufNewFile,BufRead .followup,.article.*,.letter.*,/tmp/mutt-*,nn.*,snd.*,mutt* set tw=72

" Colors in Mails
au BufNewFile,BufRead /tmp/mutt-* :so /usr/local/share/vim/vim73/syntax/mail.vim

" Colors for slrn's score-file
au BufRead .slrn-score :so /usr/local/share/vim/vim73/syntax/slrnsc.vim

" No Textwidth for HTML 
au BufRead *.htm,*.html,*.shtml set textwidth=0

" Colors for .muttrc and other mutt-related config-files
" nmap <F9> :so /usr/local/share/vim/vim73/syntax/muttrc.vim<CR>
" nope, all beginning with .mutt* automatically please
au BufRead .mutt* :so /usr/local/share/vim/vim73/syntax/muttrc.vim

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

" remap key Q
nnoremap Q gq}1G

" keymappings for navigating splitwindows
map <C-J> <C-W>j<C-W>_
map <C-K> <C-W>k<C-W>_
map <C-H> <C-W>h<C-W>_
map <C-L> <C-W>l<C-W>_

" keymappings for command-t plugin
noremap <leader>o <Esc>:CommandT<CR>
noremap <leader>O <Esc>:CommandTFlush<CR>
noremap <leader>m <Esc>:CommandTBuffer<CR>

" toggle the taglist
map <F2> :TlistToggle<CR>

" toogle Gundo window
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

"let g:Powerline_theme = 'skwp'
let g:Powerline_colorscheme = 'skwp'
"let g:Powerline_symbols = 'fancy'
"let g:Powerline_symbols = 'unicode'
