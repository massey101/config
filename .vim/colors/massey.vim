" Vim color file
" Maintainer:	Jack Massey.
" Last Change:	2018 Jul 23

" This is the default color scheme.  It doesn't define the Normal
" highlighting, it uses whatever the colors used to be.

" Remove all existing highlighting and set the defaults.
set background=light
hi clear

" Load the syntax highlighting defaults, if it's enabled.
if exists("syntax_on")
  syntax reset
endif

let colors_name = "massey"

hi Search     ctermfg=white ctermbg=darkYellow
hi IncSearch  ctermfg=white ctermbg=darkYellow
hi ALEError   ctermfg=white ctermbg=DarkRed
hi ALEWarning ctermfg=white ctermbg=DarkBlue
