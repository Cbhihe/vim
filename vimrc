set encoding=utf-8
scriptencoding=utf-8
set termencoding=utf-8
set nocompatible
				" Superfluous: vim automatically sets nocompatible if it finds 
				" vimrc or gvimrc " upon startup.


" Plugins
" =========================
" :scriptnames
				" Check loaded plugins  
" :set runtimepath? 
				" Check loaded plugins' RT path
" :echo syntastic#util#system('echo "$PATH"')
				" to see syntastic's idea of env-var $PATH
filetype off
set rtp+=~/.vim/bundle/vundle
				" set the runtime path for vundle, required
call vundle#begin()
				" Initialize Vundle, required

" Keep all 'Plugin' commands below this line
" ------------------------------------
" For GitHub repos: specify plugins using 'user/repository' format or
"  'user/repository.git' format
" For vim scripts: reference the plugin by name as it appears on site

Plugin 'gmarik/vundle'				
				" let Vundle manage vundle, required
Plugin 'vim-syntastic/syntastic'
				" syntax checker 
Plugin 'Valloric/YouCompleteMe.git'	" 
				" Compiled plugin 'youcompleteme.vim' in 
				" '/usr/share/vim/vimfiles/autoload'
Plugin 'Townk/vim-autoclose' 
				" Create pairs of (,{,[,",` and ' automatically.
				" Place cursor between them automatically.
				" Delete with one keystroke by doing BS on first sign .
				" Suppress creation of closing sign, by typing CTRL-V in
				" insert mode immediately prior to typing the opening sign.
"Plugin 'vim/matchit.vim'
				" part of vim standard distribution since v6.0 
Plugin 'dougireton/vim-chef'
				" Detects Chef cookbook and Chef-Repo files and sets the filetype 
				" to 'ruby.chef'
Plugin 'jimhester/lintr'
				" Detects syntax errors and inconsistencies in R scripts
				" Git-cloned from https://github.com/jimhester/lintr
Plugin 'vim-scripts/LaTeX-Suite-aka-Vim-LaTeX'
				" Git cloned from:
				" https://github.com/vim-scripts/LaTeX-Suite-aka-Vim-LaTeX.git
Plugin 'Kuniwak/vint'
				" Git cloned from https://github.com/Kuniwak/vint
" ------------------------------------
" All plugins must be added before above line

call vundle#end()
filetype plugin indent on
				" Required
				" Load ftplugin.vim and indent.vim from $VIMRUNTIME 
				" (/usr/share/vim/vim81)
				" Turn automatic filetype detection on

let mapleader=',,'	" <leader> mapped to '\' by default. 

let g:ft_ignore_pat = '\.\(Z\|gz\|bz2\|zip\|tgz\)$'
				" Ensure contents of compressed files not inspected.
let rmd_include_html = 1
				" Source 'ftplugin/html.vim'

" ==== YCM configuration
"let g:ycm_server_keep_logfiles = 1
"let g:ycm_server_log_level = 'debug'
				" Keep for YCM plugin install debug
let g:ycm_server_python_interpreter = 'python3'
				" NEEDED because YCM's server is compiled with Python 2.7
				" Nevertheless YCM accepts vim clients with either py2 or py3
map <leader>g :YcmCompleter GoToDefinitionElseDeclaration<CR>
				" Define a shortcut for goto definition

" ==== YCM extra for C/C++ projects
" Default location is at project's root, extra location is:
"let g:ycm_global_ycm_extra_conf = '~/.config/ycm/clang/.ycm_extra_conf.py'
"let g:ycm_confirm_extra_conf = 1
"let g:ycm_extra_conf_globlist = ['~/.config/ycm/clang/*','!~/**']

" ==== YCM extra for java projects
"   > see https://wiki.archlinux.org/index.php/Vim/YouCompleteMe

" ==== YCM extra for python projects
"set pyxversion=2
"let g:ycm_python_binary_path ='/usr/bin/python2'
let g:ycm_python_interpreter_path = ''
let g:ycm_python_sys_path = []
let g:ycm_extra_conf_vim_data = [
  \  'g:ycm_python_interpreter_path',
  \  'g:ycm_python_sys_path'
  \]
let g:ycm_global_ycm_extra_conf = '~/.config/ycm/python/global_extra_conf.py'
let g:ycm_autoclose_preview_window_after_completion=1
				" Ensure auto-complete window goes away when done with it

" ==== Syntastic configuration
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_shell = '/usr/bin/bash' 
				" Specify shell which accepts Bourne compatible syntax
let g:syntastic_java_checkers = []
				" Manual disabling of Syntastic Java diagnostics
				" due to incompatibility with YCM's native RT diagnostics
let g:syntastic_always_populate_loc_list = 1
				" Set to 0 if other plugins use and fill the location-list
				" Obviate need to issue ':Errors' before opening loc-list
let g:syntastic_auto_loc_list = 2
				" Does not open loc-list automatically when errors occur.
				" Does close loc-list window automatically when last error has
				" been suppressed.
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_auto_jump = 0
				" Jump automatically to 1st detected issue if !=0
" let g:syntastic_enable_elixir_checker = 1
" let g:syntastic_elixir_checkers = ["elixir"]

let g:Syntastic_enable_signs = 1
				" keep defaults margin signs
set signcolumn=yes
				" Ancker sign column permanently on

"let g:syntastic_error_symbol = "\u2717"
hi clear SyntasticErrorSign 
				" Change default color for syntastic's error sign in margin
hi SyntasticErrorSign ctermfg=1 ctermbg=0 guifg=red guibg=grey

"let g:syntastic_warning_symbol = "\u26A0"
hi clear SyntasticWarningSign 
				" Change default color for syntastic's warning sign in margin
hi SyntasticWarningSign ctermfg=209 ctermbg=0 guifg=yellow guibg=grey

let g:syntastic_enable_highlighting = 1
				" Enable error and warning highlighting whenever possible
hi clear SyntasticError
				" Change default for Syntastic's error highlight
hi SyntasticError ctermfg=201 cterm=underline guisp=Pink gui=undercurl

hi clear SyntasticWarning
				" Change default for Syntastic's warning highlight
hi SyntasticWarning ctermfg=215 cterm=underline guisp=Pink

let g:syntastic_enable_balloons = 1
				" Not available with every checker
let g:syntastic_aggregate_errors = 0
				" Show errors for 1st checker chosen, then 2nd if 1st checker
				" returns zero error, etc.
				" Set to 1 to show all errors at once.
let g:syntastic_sort_aggregated_errors = 0
				" Let error messages be grouped by check-engine used
				" Useful when 'syntastic_aggregate_errors = 1' above.
let g:syntastic_echo_current_error = 1
let g:syntastic_cursor_column = 1
				" When several errors are found on same line,
				" Enable picking which error is displayed first in cmd window.

"let g:syntastic_extra_filetypes = ["3rd_party_filetype","etc"]
				" Only used for filetypes of checkers added by 3rd party
				" plugins

let g:syntastic_filetype_map = {
        \ 'plaintex': 'tex',
		\ 'ruby.chef': 'chef'}
				" file mapping dict to map unknown or composite file types to known ones

let g:syntastic_mode_map = {
        \ 'mode': 'active',
        \ 'active_filetypes': ['python','c','cpp','r','perl','sh','php','erlang','vim','sql','tex'],
        \ 'passive_filetypes': ['chef', 'puppet']}
				" Enable selective active mode when passive mode is activated 
				" in local buffer, with: ': SyntasticToggleMode'

"let g:syntastic_quiet_messages = {
"        \ "level":  [""],
"        \ "type":   [""],
"        \ "regex":   '\m\[C03\d\d\]',
"        \ "file:p":  ['\m^/usr/include/', '\m\c\.h$'] }
"let g:syntastic_python_flake8_quiet_messages = {
"		\ "level":  ["warnings"],
"        \ "type":   ["style"],
"        \ "regex":   [''],
"        \ "file:p":  ['\m\c\.py$'] }
				" filetype and checker specific filter have precedence over
				" general ones (as the one commented out above). They can be
				" used to build exceptions to general rules.

let g:syntastic_stl_format = '[%E{Error #%e from l.%fe}%B{, }%W{Warning #%w from l.%fw}]'

" ----------------------------
" See available checkers with ':h syntastic-checkers' in vim buffer
" ----------------------------
let g:syntastic_c_checkers = ['make', 'splint']
"let g:syntastic_c_flawfinder_thres = 3
				" Default value = 3.  Useful only if 'flawfinder' is included
				" in checkers' list instead of 'splint'.
				" Overridden by YCM

let g:syntastic_cpp_checkers = ['clang_check', 'flawfinder']
				" Overridden by YCM

let g:syntastic_python_checkers = ['pylint', 'flake8', 'bandit']
let g:syntastic_python_python_use_codec = 0
				" Enable the use of codes to encode Python declarations, with
				" the 'python' checker.
				" See https://docs.python.org/reference/lexical_analysis.html \
				" \ #encoding-declarations such as:
				" https://noseofyeti.readthedocs.org/en/latest/

let g:syntastic_fortran_checkers = ['gfortran']
				" Checker ignores usual 'g:syntastic_fortran_gfortran_<option>' variables.
				" See ':h syntastic-checkers' for more details and config tips

let g:syntastic_php_checkers = ['php', 'phplint'] 
				" 'phplint' not installed as of 2018.10.18
				
let g:syntastic_html_checkers = ['tidy']
				" Install with pacman

let g:syntastic_vim_checkers = ['vint']
				" Obtained directly from plugin repo
				" Install with `sudo pip install vim-vint` 
let g:no_vim_maps = 0
				" Enable vim map
				" Move to start and end of functions with [[ and ]].
				" Move around comments with ]" and ["

"let g:syntastic_tex_checkers = ['lacheck', 'tex/language_check']
let g:tex_flavor = 'latex'
				" Possible values: 'plain', 'context', 'latex'
				" Not required, if 'g:syntastic_filetype_map' implemented.
				" When 1st line of *.tex file has %&<format>, filetype can be  
				" is either: 'plaintex' (for plain TeX), 'context' (for ConTeXt),
				" or 'tex' (for LaTeX).  
				" Otherwise, vim conducts kw-search in file to choose 
				" context or tex. In the absence of kws, default is 'plaintex'.
				" Default can be changed w/: " 'g:tex_flavor = '[format]'
 
let g:syntastic_enable_r_lintr_checker = 1
				" Required
let g:syntastic_r_checkers = ['lintr']
				" Static analysis tools
				" Executes R code in vim (may be security risk for foreign code).
				" Plugin git-cloned from https://github.com/jimhester/lintr

let g:syntastic_sh_checkers = ['shellcheck', 'sh']
let g:syntastic_sh_shellcheck_args = '-x'

let g:syntastic_perl_checkers = ['perlcritic']
				" Static analyzer. Does not run code.
				" checker not installed as of 2018.10.18
let g:syntastic_perl_perlcritic_thres = 5
				" Highlight policy violation as error for level >= 5 (default)
				" Others shown as warnings.

let g:syntastic_erlang_checkers = ['syntaxerl', 'escript']
				" checkers not installed as of 2018.10.18

let g:syntastic_puppet_checkers = ['puppet', 'puppet-lint']
				" See this style-linter project at http://puppet-lint.com/

let g:syntastic_sql_checkers = ['sqlint']
				" valid for ANSI SQL

let g:syntastic_chef_checkers = ['foodcritic']
				" Style-linter 
				" See project at: https://github.com/Foodcritic/foodcritic/
				" Step 1: install chef + foodcritic with AUR package 'chef-dk'
				" Step 2: Install plugin vim-chef to define filetype 'ruby.chef'
				" Step 3: Make Syntastic recognize composite filetype 'ruby.chef'
				" Step 4: Make Syntastic recognize executable '/usr/bin/foodcritic'
let g:syntastic_chef_foodcritic_exec = '/usr/bin/foodcritic'
				" Default executable path

let g:syntastic_ruby_checkers = ['mri']
				" See this style-linter project at http://github.com/foodcritic/
let g:syntastic_ruby_mri_exec = '/user/bin/ruby'
				" Default executable path


" =========================
" Colors
" =========================
"syntax on			" Enable syntax highlighting using vim default highlight colors. 
					" By default 'syntax on' also turns on filetype detection.
				    " Overrule previously defined user highlight color settings.
 
" Define dark or light terminal background color when detection not automatic
"  (default) in case no automatic detection of terminal color takes place.
if &term ==# 'xterm'
	set background=dark  
elseif &term ==# 'xterm-256color'
	set background=dark  
    set t_Co=256
endif               " Set term color to 256

" See available color schemes in $VIMRUNTIME/colors/,
"   currently at /usr/share/vim/vim81/colors/ (for vim v8.1)
":color default
":color ron			"high contrast very similar to 'murphy' and 'industry'
":color murphy		" high contrast very similar to 'ron' and 'industry'
":color industry	" high contrast very similar to 'ron' and 'murphy'
":color slate
":color koehler
":color zellner		" strange wine colors
":color delek
":color peachpuff
color torte			" very similar to 'pablo'
":color pablo		" very similar to 'torte'
":color desert
":color elflord
":color solarized	" very similar to 'shine' and 'morning'
":color morning		" very similar to 'shine' and 'solarized'
":color shine		" very similar to 'solarized' and 'morning'

if !exists('g:syntax_on')
    syntax enable	" Set syntax highlighting groups not yet set.
endif
					" Turn syntax highlighting on for different types of files
					" equivalent to ':source $VIMRUNTIME/syntax/syntax.vim'
					" Allow subsequent use of :highlight command to set user defined
					" highlighting  color, i.e. preserve user defined highlight 
                    " color settings.
 
" Highlight groups: " Normal, Special, Comment, Constant, Type, Error, Underlined, 
					" Boolean, Conditional, NonText, Cursor, CursorLine, Function, 
					" Include, Debug, ErrorMsg, Folded, Todo ('TODO','FIXME','XXX'), etc.
					" (see http://vimdoc.sourceforge.net/htmldoc/syntax.html#xterm-color)
" Key=Value pairs:  
"           cterm=    underline | bold | none | reverse | italic
" ctermfg,ctermbg=    NR-16   NR-8    COLOR NAME 
"						0       0       Black
"						1       4       DarkBlue
"						2       2       DarkGreen
"						3       6       DarkCyan
"						4       1       DarkRed
"						5       5       DarkMagenta
"						6       3       Brown, DarkYellow
"						7       7       LightGray, LightGrey, Gray, Grey
"						8       0*      DarkGray, DarkGrey
"						9       4*      Blue, LightBlue
"						10      2*      Green, LightGreen
"						11      6*      Cyan, LightCyan
"						12      1*      Red, LightRed
"						13      5*      Magenta, LightMagenta
"						14      3*      Yellow, LightYellow
"						15      7*      White
"     guifg, guibg=   #000000, ...
                       

highlight Normal ctermbg=Black
                    " Assign black bg to 'Normal' group, if 
                    " terminal = 'cterm' (color terminal)
"highlight Comment ctermfg=Cyan ctermbg=Black cterm=underline
					" Override 'Comment' group's color
					" Note: all but any one 'key=value' pair optional


" =========================
" General settings
" =========================
set showmode		" Show mode (vim default) on last line of buffer window
set noerrorbells	" Turn off audible error bells
set visualbell 
"set t_vb=^[[?5h$<100>^[[?5l  
					" Does not work in xterm, although should turn on visual 
					" bell (flash display 100ms)
set title			" Set terminal title to opened file name and appends 'pwd'
set magic			" Make characters have the same meaning as in grep regexp
					" 'very magic': \v in front of a search pattern make 
					"   every following character except 'a-zA-Z0-9' and '_' have 
					"   special meaning
					" 'anti very magic': \V has the opposite effect of \v. All 
					"   characters are parsed literally and must be preceded by \ 
					"   to activate their special meaning.
					" ':set nomagic' is the opposite of ':set magic'
set lazyredraw		" Don't allow redraw when using macros
set ignorecase		" Make case insensitive
set smartcase		" Use case/become case-sensitive if caps is used
set mouse=a			" Allow normal mouse behavior in all 4 principal modes
set number			" Place a number left of each line start.
set timeout			" Timeout on :mappings and key codes (when timeout off (default)) 
set timeoutlen=1500 " Define time (ms) available to enter command after the <leader>
					" or during entry of key combination. Default value is 1000.
					" synonym of 'set tm=1500'
set incsearch		" Show match as search proceeds


" =========================
" viminfo + last cursor position
" =========================
" :help 'viminfo'	for more details
" :set viminfo?		to inspect parameter values
"  '20  :  marks will be remembered for up to 20 previously edited files
"  <1000:  limit the number of lines saved for each register to 1000 lines
"  s100 :  registers with more than 100 KB of text are skipped.
"  h	:  disable search highlight when opening a file
"  c	:  attempt by foreign vim shell to read 'viminfo' file w original
"		   encoding (need +iconv at compile time)
"  "100 :  will save up to 100 lines for each register
"  :100 :  up to 100 lines of command-line history will be remembered
"  %    :  saves and restores the buffer list
"  n... :  where to save the viminfo files
set viminfo='20,<1000,s100,h,c,/100,\"100,:100,%,n~/.vim/.viminfo
					" Remember last cursor position when reopening file
"set viminfo+=/100   " Control history size

function! ResCur()	" Restore session with cursor in last position inside line
  if line("'\"") > 1 && line("'\"") <= line('$') 
    normal! g`"		
    return 1
  endif
endfunction
if has('folding')
  function! UnfoldCur()
    if !&foldenable
      return
    endif
    let cl = line('.')
    if cl <= 1
      return
    endif
    let cf  = foldlevel(cl)
    let uf  = foldlevel(cl - 1)
    let min = (cf > uf ? uf : cf)
    if min
      execute 'normal!' min . 'zo'
      return 1
    endif
  endfunction
endif

augroup resCur
  autocmd!
					" remove all autocmds from group 'resCur' every time
					" .vimrc is sourced.
  if has('folding')
    autocmd BufWinEnter * if ResCur() | call UnfoldCur() | endif
  else
    autocmd BufWinEnter * call ResCur()
  endif
augroup END
				    " at 3rd line in above block, make g`" into g'" to restore cursor 
				    " position to last line, at beginning of line

" =========================
" Buffer swap, backup, write-backup files, temporary working directory
" =========================
set noswapfile		" disable swap for vim buffers
set nobackup		" don't make ~ file backups
set writebackup		" save a temporary backup of file(s) being edited with vim 
set backupdir=~/.vim/backups
set directory=~/.vim/tmp


" =========================
" Spell checking
" =========================
" See ':help spell-quickstart'
" After manual editing of ~/.vim/after/$USER-*.utf-8.add, recreate corresponding 
" *.spl files, with: ':mkspell! ~/.vim/after/$USER-*.utf-8.add'
set spell spelllang=en,fr,de,es,cjk	
					" enable spellchecking in English, French, German, Spanish
					" cjk indicate Chinese, Japanese and Korean, but treatment
					" of those three cases differs, in that none of the 3 Asian
					" languages' characters are checked.

augroup speLang
  autocmd!
  autocmd FileType plaintext setlocal spell spelllang=en,fr,de,es,cj
augroup END

set spellfile=/home/$USER/.vim/after/$USER-tech.utf-8.add,/home/$USER/.vim/after/$USER-plain.utf-8.add
" Change default color for spell-checker to highlight words
hi clear SpellBad
hi SpellBad ctermfg=7 ctermbg=4 cterm=none guisp=Blue gui=undercurl
"hi clear SpellCap
"hi SpellCap ctermfg=00 ctermbg=06 cterm=none guifg=#000000 guibg=#008080
"hi clear SpellRare
"hi SpellRare ctermfg=00 ctermbg=06 cterm=none guifg=#000000 guibg=#008080
"hi clear SpellLocal
"hi SpellLocal ctermfg=00 ctermbg=06 cterm=none guifg=#000000 guibg=#008080


" =========================
" Input completion
" =========================
set complete+=k		" 'k' = scan the files given in 'set dict=...' option below
set dictionary+=~/.vim/dict/iab-dict   


" =========================
" Sane text files
" =========================
set fileformats=unix,dos,mac
					" Specify globally which file formats will be tried when 
					" Vim reads a file (i.e. how <EOL> detection will be done). 
					" When more than one format name is present, separated by 
					" commas, automatic detection attempts to detect <EOL> in 
					" the same order.
					" When a new buffer (file) is opened, Vim automatically
					" uses the first of the various proposed format as
					" default. 
					" When empty, the format defined with 'fileformat' is used
					" instead. 
					" When not empty 'fileformat' is ignored.
set fileformat=unix	" Set file format locally
					" :ff=unix to act locally on active buffer


" =========================
" Sane editing
" =========================

packadd! matchit	" Make % cmd jump to matching HTML tags, if/else/endif 
					" constructs, etc.
set foldmethod=manual
					" define fold automatically by indent w/ 'indent'
set wrap			" Display word wrapped text; do not change text in buffer
set linebreak		" Intelligent wrapping occurs at characters " ^I!@*-+;:,./?"
					" (per vim default) or by 'breakat' option
					" Does not introduce <EOL> at wrapped line visual "break"
set breakindent breakindentopt=min:25,shift:4
set showbreak=>>\ 	" display string ">>" at start of wrapped lines
"set tw=0			" Disable textwidth
					" 'tw=75' (e.g.) introduces <EOL> at breaks
"set fo+=t			" Make default format setting in vim heed 'tw' change
"set wm=0			" Disable wrapmargin (counting from right border)
					" 'wm=4' (e.g.) introduces <EOL> at breaks
set whichwrap=b,s,<,>,[,]
					" Traverse line breaks with arrow keys
set showmatch		" Briefly jump to matching bracket
set autoindent		" Insert indent when starting new line with \<CR>, 
					" when ending previous line with \{, etc.
					" When vim compiled with '+cindent' feature, this behavior is modified
set smartindent		" Copy previous indent, insert it on new line

let g:python_recommended_style = 0
					" Do not follow PEP8 style recommendation for format
					" (in particular 'tabstop=8')
set tabstop=4		" Define nbr of space(s) to use for each step of (auto)indent.
					" Used for 'cindent', >>, <<, etc.
set shiftwidth=4
"set smarttab		" Insert nbr of space(s) equal to shiftwidths,
					" when <Tab> is inserted at line begin
set softtabstop=4	" Set nbr of spaces counted by <Tab> or <BS> in editing operations
"set expandtab		" Convert tabs to spaces (for Python)
					" (inverse behavior: 'set noexpandtab')
set cindent			" make indent rule stricter for C programs
set cursorline		" highlight current line (where cursor is)
set wildmenu		" Keyword completion. Pick choice of word with CTRL-P, CTRL-N 
					" cmd completion is enhanced by means of 'wildchar'
					" Requires module +wildmenu feature
set wildchar=<Tab>  " Character to type when starting wildcard expansion
set wildcharm=<C-Z> " Works exactly as wildchar, but inside macro
					" Use in mappings to automatically invoke completion mode
					" e.g. ':cnoremap ss so $vim/session/*.vim<C-Z>' 
					" Use CTRL-P for previous and CTRL-N for next choice.
set wildignore=*.o,*~,*.pyc,*.bak,*.class,*.cache,*.dll,tags
set wildignore+=*.swp
					" ignore file matching given patterns when expanding wildcards
set wildignorecase
"set wildmode=list:longest  
set wildmode=longest,list  
					" When more than 1 match occurs, list all matches 
					" and complete till longest common string.


" =========================
" Status line
" =========================
set showcmd         " Show cmd at bottom right hand corner of screen, left of cursor 
					" location. <leader> disappears after timeoutlen has expired.
set showmode        " Show mode status n statusline at bottom of screen 
set statusline=%<\ %n\ %f\ %m%r%h\ %y%=\ Line:\ \%l/\%L\ (\%p%%)\ Column:\ \%c\ 
					" Specify content of status line

" =========================
" Search 
" =========================
set hlsearch

:command WR :let @/=""
					" wipe register containing the last searched string. 
					" make `:norm n` unavailable to search next occurrence.
map <C-R> :noh<CR>:redraw!"<CR>
					" Redraws session screen erasing all highlights
map <silent> <leader><CR> :noh<CR>
					" temporarily disable highlight when <leader><cr> is pressed
nnoremap <CR> :noh<CR>
					" Useful to disable highlighted search results
hi clear Search     " Change default color for searched words
hi Search ctermfg=red ctermbg=grey cterm=none guisp=red gui=underline


" =========================
" Mappings 
" =========================
" Prepend prefix to 'map' 
"    : normal, visual, select, operator-pending
"   n: normal only
"   v: visual and select
"   o: operator-pending
"   x: visual only
"   s: select only
"   i: insert
"   c: command-line
"   l: insert, command-line, regexp-search and others. 
"      collectively called "Lang-Arg" pseudo-mode)
"nore: makes mapping non-recursive, i.e. lhs expands to rhs only
"      even if rhs is already mapped to something else.
" Append suffix to 'map'
"   !: insert & command-line
" =========================

					" cmds only accepted if initial letter is capitalized
:command WQ	wq
					" command mode: auto correction
:command Wq	wq
					" command mode: auto correction
:command W	w
					" command mode: auto correction
:command Q	q
					" command mode: auto correction
					" ====================
"inoremap ºº <Esc>2h 
					" remap ºº to <Esc> in insert mode 

inoremap <Down> <C-o>gj
inoremap <Up> <C-o>gk
					" Insert mode mapping: make cursor move as expected with wrapped lines
					" Disallow mapping of rhs to avoid nested or recursive mapping.
					" ====================
map <space> /		
					" (normal/command, visual, select, operator-pending modes)
					" map <space> to forward search (/) in active window 
"map <C-space> ?
					" map Ctrl-<space> to backward search (?) in active window
					" WARNING: ineffectual because <C-space> produces no ASCII character
					" ====================
map! <F2> <Esc>a<C-R>=strftime("%c")<CR><Esc>
					" maps F2 to in-place time insertion, in insert and cmd-line modes.
					" ex:  Sun 14 Oct 2018 01:06:19 CEST
map <F2> a<C-R>=strftime("%c")<CR><Esc>   
					" as above, in normal visual and operator-pending modes.
					" ====================
set go+=a           " enable automatic X11 primary `"*y` register copying just 
					" by highlighting with mouse in visual mode
vmap <C-c> "+y		
					" map CTRL+c to yank to clipboard in visual mode
vmap <C-x> "+d	
					" map CTRL+x to cut to clipboard in visual mode
					" ====================
noremap ,,fb <Esc>:tabnew .<CR>
					" Open directory tree in second buffer.
					" :q to close and come back to calling buffer

" =========================
" Check dynamic loading of python 2.x or 3.x at 'vim' launch 
" =========================
"if has('python_compiled')
"  echo 'compiled with Python 2.x support'
"  if has('python_dynamic')
"    echo 'Python 2.x dynamically loaded'
"  endif
"endif
"if has('python3_compiled')
"  echo 'compiled with Python 3.x support'
"  if has('python3_dynamic')
"    echo 'Python 3.x dynamically loaded'
"  endif
"endif
"
