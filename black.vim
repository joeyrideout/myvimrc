" local syntax file - set colors on a per-machine basis:
" vim: tw=0 ts=4 sw=4
" Vim color file
" Maintainer:	Steven Vertigan <steven@vertigan.wattle.id.au>
" Last Change:	2006 Sep 23
" Revision #5: Switch main text from white to yellow for easier contrast,
" fixed some problems with terminal backgrounds.

set background=light
hi clear
if exists("syntax_on")
  syntax reset
endif
let g:colors_name = "black"
hi Normal		guifg=black	guibg=white	ctermfg=black	ctermbg=white
hi NonText		guifg=darkblue	ctermfg=darkblue
hi comment		guifg=darkgrey		ctermfg=darkgrey	ctermbg=white	gui=bold 
hi constant		guifg=darkred		ctermfg=darkred
hi identifier	guifg=darkgrey		ctermfg=black
hi statement	guifg=darkblue		ctermfg=darkblue	ctermbg=white	gui=none
hi preproc		guifg=darkblue		ctermfg=darkblue
hi type			guifg=darkcyan	ctermfg=darkcyan	ctermbg=white
hi special		guifg=darkred	ctermfg=darkred	ctermbg=white
hi Underlined	guifg=black		ctermfg=black	gui=underline	cterm=underline
hi label		guifg=darkblue	ctermfg=darkblue
hi operator		guifg=darkred	gui=bold	ctermfg=darkred	ctermbg=white

hi ErrorMsg		guifg=black	guibg=white	ctermfg=black
hi WarningMsg	guifg=black		guibg=white	ctermfg=black	gui=bold
hi ModeMsg		guifg=black	gui=NONE	ctermfg=black
hi MoreMsg		guifg=black	gui=NONE	ctermfg=black
hi Error		guifg=blue		guibg=white	gui=underline	ctermfg=blue

hi Todo			guifg=black		guibg=black	ctermfg=black	ctermbg=white
hi Cursor		guifg=black		guibg=white		ctermfg=black	ctermbg=white
hi Search		guifg=black		guibg=black	ctermfg=black	ctermbg=white
hi IncSearch	guifg=black		guibg=black	ctermfg=black	ctermbg=white
hi LineNr		guifg=grey		ctermfg=grey
hi title		guifg=white	gui=bold	cterm=bold

hi StatusLineNC	gui=NONE	guifg=black guibg=white	ctermfg=black  ctermbg=white
hi StatusLine	gui=bold	guifg=black	guibg=white	ctermfg=black   ctermbg=white
hi VertSplit	gui=none	guifg=white	guibg=white	ctermfg=white	ctermbg=white

hi Visual		term=reverse		ctermfg=black	ctermbg=black	guifg=black		guibg=black

hi DiffChange	guibg=black		guifg=black	ctermbg=black	ctermfg=black
hi DiffText		guibg=olivedrab		guifg=black		ctermbg=black	ctermfg=black
hi DiffAdd		guibg=white		guifg=black		ctermbg=white		ctermfg=black
hi DiffDelete   guibg=coral			guifg=black	ctermbg=black		ctermfg=black

hi Folded		guibg=black		guifg=black		ctermbg=black		ctermfg=black
hi FoldColumn	guibg=darkgrey		guifg=black	ctermbg=darkgrey		ctermfg=black
hi cIf0			guifg=darkgrey			ctermfg=darkgrey

