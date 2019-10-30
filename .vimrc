""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" Vundle                                                                 """
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'w0rp/ale'
Plugin 'Vimjas/vim-python-pep8-indent'
Plugin 'vim-scripts/Conque-GDB'
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line




" put     this line first in ~/.vimrc
set nocompatible | filetype indent plugin on | syn on

fun! SetupVAM()
  let c = get(g:, 'vim_addon_manager', {})
  let g:vim_addon_manager = c
  let c.plugin_root_dir = expand('$HOME', 1) . '/.vim/vim-addons'

  " Force your ~/.vim/after directory to be last in &rtp always:
  " let g:vim_addon_manager.rtp_list_hook = 'vam#ForceUsersAfterDirectoriesToBeLast'

  " most used options you may want to use:
  " let c.log_to_buf = 1
  " let c.auto_install = 0
  let &rtp.=(empty(&rtp)?'':',').c.plugin_root_dir.'/vim-addon-manager'
  if !isdirectory(c.plugin_root_dir.'/vim-addon-manager/autoload')
    execute '!git clone --depth=1 git://github.com/MarcWeber/vim-addon-manager '
        \       shellescape(c.plugin_root_dir.'/vim-addon-manager', 1)
  endif

  " This provides the VAMActivate command, you could be passing plugin names, too
  call vam#ActivateAddons([], {})
endfun
call SetupVAM()

" ACTIVATING PLUGINS

" OPTION 1, use VAMActivate
" VAMActivate PLUGIN_NAME PLUGIN_NAME ..

" OPTION 2: use call vam#ActivateAddons
" use <c-x><c-p> to complete plugin names

" OPTION 3: Create a file ~/.vim-srcipts putting a PLUGIN_NAME into each line
" See lazy loading plugins section in README.md for details
" call vam#Scripts('~/.vim-scripts', {'tag_regex': '.*'})


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" General                                                                """
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set expandtab
set shiftwidth=4
set softtabstop=4
set noswapfile
let g:spellfile_URL = 'http://ftp.vim.org/vim/runtime/spell'
set spelllang=en
set spell

set nocscopeverbose


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" Vim Airline                                                            """
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call vam#ActivateAddons(['vim-airline'])
let g:airline_powerline_fonts = 1
set laststatus=2


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" You Complete Me                                                        """
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" call vam#ActivateAddons(['YouCompleteMe'])


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" neocomplete                                                            """
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call vam#ActivateAddons(['neocomplete'])


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" Trailing Whitespace                                                    """
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call vam#ActivateAddons(['trailing-whitespace'])


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" Tag List                                                               """
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call vam#ActivateAddons(['taglist'])


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" Vim Color Schemes                                                      """
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call vam#ActivateAddons(['color-schemes'])
colorscheme massey


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" Fugitive                                                               """
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call vam#ActivateAddons(['fugitive'])


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" Jedi Vim
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call vam#ActivateAddons(['jedi-vim'])
" let g:jedi#force_py_version=3
autocmd FileType python setlocal completeopt-=preview


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" Vim Go                                                                 """
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call vam#ActivateAddons(['vim-go'])
autocmd Filetype go setlocal noexpandtab
autocmd Filetype go setlocal tabstop=4
autocmd Filetype go setlocal shiftwidth=4
autocmd Filetype go setlocal softtabstop=4


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" AVR GCC                                                                """
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:ale_c_gcc_executable = 'avr-gcc'
let g:ale_c_gcc_options = '-std=c99 -Wall -mmcu=atmega328 -DF_CPU=8000000 -Os'
autocmd BufRead,BufNewFile *.h,*.c set filetype=c


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" Task Juggler                                                           """
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
:hi Folded ctermbg=022
:hi Folded ctermfg=255


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" Conque-GDB                                                             """
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 1: strip color after 200 lines, 2: always with color
let g:ConqueTerm_Color = 2
" close conque when program ends running
" let g:ConqueTerm_CloseOnEnd = 1
" display warning messages if conqueTerm is configured incorrectly
let g:ConqueTerm_StartMessages = 0


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" My Hardcore Mode                                                       """
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" nnoremap <Up> <Nop>
" nnoremap <Down> <Nop>
" nnoremap <Left> <Nop>
" nnoremap <Right> <Nop>
" nnoremap <Insert> <Nop>
" nnoremap <Delete> <Nop>
" nnoremap <PageUp> <Nop>
" nnoremap <PageDown> <Nop>
" nnoremap <Home> <Nop>
" nnoremap <End> <Nop>
" inoremap <Up> <Nop>
" inoremap <Down> <Nop>
" inoremap <Left> <Nop>
" inoremap <Right> <Nop>
" inoremap <Insert> <Nop>
" inoremap <Delete> <Nop>
" inoremap <PageUp> <Nop>
" inoremap <PageDown> <Nop>
" inoremap <Home> <Nop>
" inoremap <End> <Nop>
" vnoremap <Up> <Nop>
" vnoremap <Down> <Nop>
" vnoremap <Left> <Nop>
" vnoremap <Right> <Nop>
" vnoremap <Insert> <Nop>
" vnoremap <Delete> <Nop>
" vnoremap <PageUp> <Nop>
" vnoremap <PageDown> <Nop>
" vnoremap <Home> <Nop>
" vnoremap <End> <Nop>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" vimdiff
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if &diff
    "colorscheme Monokai
    "colorscheme Chasing_Logic
    "colorscheme apprentice
    "colorscheme bluedrake
    colorscheme MountainDew
endif


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" Search Options
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set hlsearch
set incsearch


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" colorstepper
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ColorStepper.vim
"
" Cycle easily through vim colorschemes.
"
" Original script by scott-268 (2007)
" With modifications by _sc_ (2009) and qualiabyte (2012)

function! LoadColors()
        let g:step_colors = split(globpath(&rtp,"colors/*.vim"),"\n")
endfunction

function! StepColorBy( count )
        if !exists("g:step_colors")
                call LoadColors()
        endif
        if exists("g:color_step")
                let g:color_step = (g:color_step + a:count) % len(g:step_colors)
        else
                let g:color_step = 0
        endif
        silent exe 'so ' . g:step_colors[g:color_step]
        call PrintColorscheme()
endfunction

function! StepColorNext()
        call StepColorBy( 1 )
endfunction

function! StepColorPrev()
        call StepColorBy( -1 )
endfunction

function! PrintColorscheme()
        redraw
        echo g:step_colors[g:color_step]
endfunction

if !hasmapto('<Plug>ColorstepPrev')
    nmap <unique> <F6> <Plug>ColorstepPrev
endif
if !hasmapto('<Plug>ColorstepNext')
    nmap <unique> <F7> <Plug>ColorstepNext
endif
if !hasmapto('<Plug>ColorstepReload')
    nmap <unique> <S-F7> <Plug>ColorstepReload
endif

nmap <unique> <Plug>ColorstepNext :call StepColorNext()<CR>
nmap <unique> <Plug>ColorstepPrev :call StepColorPrev()<CR>
nmap <unique> <Plug>ColorstepReload :call LoadColors()<CR>


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" CSCOPE settings for vim
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" This file contains some boilerplate settings for vim's cscope interface,
" plus some keyboard mappings that I've found useful.
"
" USAGE:
" -- vim 6:     Stick this file in your ~/.vim/plugin directory (or in a
"               'plugin' directory in some other directory that is in your
"               'runtimepath'.
"
" -- vim 5:     Stick this file somewhere and 'source cscope.vim' it from
"               your ~/.vimrc file (or cut and paste it into your .vimrc).
"
" NOTE:
" These key maps use multiple keystrokes (2 or 3 keys).  If you find that vim
" keeps timing you out before you can complete them, try changing your timeout
" settings, as explained below.
"
" Happy cscoping,
"
" Jason Duell       jduell@alumni.princeton.edu     2002/3/7
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


"==
" windowdir
"  Gets the directory for the file in the current window
"  Or the current working dir if there isn't one for the window.
"  Use tr to allow that other OS paths, too
function s:windowdir()
  if winbufnr(0) == -1
    let unislash = getcwd()
  else
    let unislash = fnamemodify(bufname(winbufnr(0)), ':p:h')
  endif
    return tr(unislash, '\', '/')
endfunc


"==
" Find_in_parent
" find the file argument and returns the path to it.
" Starting with the current working dir, it walks up the parent folders
" until it finds the file, or it hits the stop dir.
" If it doesn't find it, it returns "Nothing"
function s:Find_in_parent(fln,flsrt,flstp)
  let here = a:flsrt
  while ( strlen( here) > 0 )
    if filereadable( here . "/" . a:fln )
      return here
    endif
    let fr = match(here, "/[^/]*$")
    if fr == -1
      break
    endif
    let here = strpart(here, 0, fr)
    if here == a:flstp
      break
    endif
  endwhile
  return "Nothing"
endfunc



" This tests to see if vim was configured with the '--enable-cscope' option
" when it was compiled.  If it wasn't, time to recompile vim...
if has("cscope")

    """"""""""""" Standard cscope/vim boilerplate
    " use both cscope and ctag for 'ctrl-]', ':ta', and 'vim -t'
    set cscopetag

    " check cscope for definition of a symbol before checking ctags: set to 1
    " if you want the reverse search order.
    set csto=0

    let newcsdbpath = s:Find_in_parent("cscope.out",s:windowdir(),$HOME)
    if newcsdbpath != "Nothing"
        " add any cscope database in current directory
        exe "cs add " . newcsdbpath . "/cscope.out " . newcsdbpath
    " else add the database pointed to by environment variable
    elseif $CSCOPE_DB != ""
        cs add $CSCOPE_DB
    endif

    " show msg when any other cscope db added
    set cscopeverbose


    """"""""""""" My cscope/vim key mappings
    "
    " The following maps all invoke one of the following cscope search types:
    "
    "   's'   symbol: find all references to the token under cursor
    "   'g'   global: find global definition(s) of the token under cursor
    "   'c'   calls:  find all calls to the function name under cursor
    "   't'   text:   find all instances of the text under cursor
    "   'e'   egrep:  egrep search for the word under cursor
    "   'f'   file:   open the filename under cursor
    "   'i'   includes: find files that include the filename under cursor
    "   'd'   called: find functions that function under cursor calls
    "
    " Below are three sets of the maps: one set that just jumps to your
    " search result, one that splits the existing vim window horizontally and
    " diplays your search result in the new window, and one that does the same
    " thing, but does a vertical split instead (vim 6 only).
    "
    " I've used CTRL-\ and CTRL-@ as the starting keys for these maps, as it's
    " unlikely that you need their default mappings (CTRL-\'s default use is
    " as part of CTRL-\ CTRL-N typemap, which basically just does the same
    " thing as hitting 'escape': CTRL-@ doesn't seem to have any default use).
    " If you don't like using 'CTRL-@' or CTRL-\, , you can change some or all
    " of these maps to use other keys.  One likely candidate is 'CTRL-_'
    " (which also maps to CTRL-/, which is easier to type).  By default it is
    " used to switch between Hebrew and English keyboard mode.
    "
    " All of the maps involving the <cfile> macro use '^<cfile>$': this is so
    " that searches over '#include <time.h>" return only references to
    " 'time.h', and not 'sys/time.h', etc. (by default cscope will return all
    " files that contain 'time.h' as part of their name).


    " To do the first type of search, hit 'CTRL-\', followed by one of the
    " cscope search types above (s,g,c,t,e,f,i,d).  The result of your cscope
    " search will be displayed in the current window.  You can use CTRL-T to
    " go back to where you were before the search.
    "

    nmap <C-\>s :cs find s <C-R>=expand("<cword>")<CR><CR>
    nmap <C-\>g :cs find g <C-R>=expand("<cword>")<CR><CR>
    nmap <C-\>c :cs find c <C-R>=expand("<cword>")<CR><CR>
    nmap <C-\>t :cs find t <C-R>=expand("<cword>")<CR><CR>
    nmap <C-\>e :cs find e <C-R>=expand("<cword>")<CR><CR>
    nmap <C-\>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
    nmap <C-\>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
    nmap <C-\>d :cs find d <C-R>=expand("<cword>")<CR><CR>


    " Using 'CTRL-spacebar' (intepreted as CTRL-@ by vim) then a search type
    " makes the vim window split horizontally, with search result displayed in
    " the new window.
    "
    " (Note: earlier versions of vim may not have the :scs command, but it
    " can be simulated roughly via:
    "    nmap <C-@>s <C-W><C-S> :cs find s <C-R>=expand("<cword>")<CR><CR>

    nmap <C-@>s :scs find s <C-R>=expand("<cword>")<CR><CR>
    nmap <C-@>g :scs find g <C-R>=expand("<cword>")<CR><CR>
    nmap <C-@>c :scs find c <C-R>=expand("<cword>")<CR><CR>
    nmap <C-@>t :scs find t <C-R>=expand("<cword>")<CR><CR>
    nmap <C-@>e :scs find e <C-R>=expand("<cword>")<CR><CR>
    nmap <C-@>f :scs find f <C-R>=expand("<cfile>")<CR><CR>
    nmap <C-@>i :scs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
    nmap <C-@>d :scs find d <C-R>=expand("<cword>")<CR><CR>


    " Hitting CTRL-space *twice* before the search type does a vertical
    " split instead of a horizontal one (vim 6 and up only)
    "
    " (Note: you may wish to put a 'set splitright' in your .vimrc
    " if you prefer the new window on the right instead of the left

    nmap <C-@><C-@>s :vert scs find s <C-R>=expand("<cword>")<CR><CR>
    nmap <C-@><C-@>g :vert scs find g <C-R>=expand("<cword>")<CR><CR>
    nmap <C-@><C-@>c :vert scs find c <C-R>=expand("<cword>")<CR><CR>
    nmap <C-@><C-@>t :vert scs find t <C-R>=expand("<cword>")<CR><CR>
    nmap <C-@><C-@>e :vert scs find e <C-R>=expand("<cword>")<CR><CR>
    nmap <C-@><C-@>f :vert scs find f <C-R>=expand("<cfile>")<CR><CR>
    nmap <C-@><C-@>i :vert scs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
    nmap <C-@><C-@>d :vert scs find d <C-R>=expand("<cword>")<CR><CR>


    """"""""""""" key map timeouts
    "
    " By default Vim will only wait 1 second for each keystroke in a mapping.
    " You may find that too short with the above typemaps.  If so, you should
    " either turn off mapping timeouts via 'notimeout'.
    "
    " set notimeout
    "
    " Or, you can keep timeouts, by uncommenting the timeoutlen line below,
    " with your own personal favorite value (in milliseconds):
    "
    "set timeoutlen=4000
    "
    " Either way, since mapping timeout settings by default also set the
    " timeouts for multicharacter 'keys codes' (like <F1>), you should also
    " set ttimeout and ttimeoutlen: otherwise, you will experience strange
    " delays as vim waits for a keystroke after you hit ESC (it will be
    " waiting to see if the ESC is actually part of a key code like <F1>).
    "
    "set ttimeout
    "
    " personally, I find a tenth of a second to work well for key code
    " timeouts. If you experience problems and have a slow terminal or network
    " connection, set it higher.  If you don't set ttimeoutlen, the value for
    " timeoutlent (default: 1000 = 1 second, which is sluggish) is used.
    "
    "set ttimeoutlen=100

endif

