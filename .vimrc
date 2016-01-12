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


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" Vim Airline                                                            """
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call vam#ActivateAddons(['vim-airline'])
let g:airline_powerline_fonts = 1
set laststatus=2


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" You Complete Me                                                        """
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call vam#ActivateAddons(['YouCompleteMe'])


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


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" Task Juggler                                                           """
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
:hi Folded ctermbg=022
:hi Folded ctermfg=255

