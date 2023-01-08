
	syn match markdownRightArrow "^\s*-->"
	syn match markdownRightArrow "-->"

	syn region markdownBox start="+-" end="-+"
	syn match  markdownBox "^\s*|"
	syn match  markdownBox "|\s*$"

	syn match markdownTimeSep     "\d\{1,2\}\zs[:hm]\ze\d\{1,2\}" contained
	syn match markdownTime              "\d\{1,2\}[:hm]\d\{1,2\}" contains=markdownTimeSep
	syn match markdownTime    "\d\{1,2\}h\d\{1,2\}[:hm]\d\{1,2\}" contains=markdownTimeSep

	syn match markdownQuote  "\"" contained
	syn match markdownString "\".*\"" contains=markdownQuote

	syn match markdownQuote2  "\'" contained
	syn match markdownString2 "\'.*\'" contains=markdownQuote2

	syn match markdownTagSep   "[;,.]"  contained
	syn match markdownBrackts  "[\[\]]" contained
	syn match markdownTags     "\[.*\]" contains=markdownBrackts,markdownTagSep

	syn match markdownDashedTextDashes "--" contained
	syn match markdownDashedText "--.*--" contains=markdownDashedTextDashes

	syn match markdownTagSep2   "[;,.]"  contained
	syn match markdownBrackts2  "[<>]" contained
	syn match markdownTags2     "<.*>" contains=markdownBrackts2,markdownTagSep2

	syn match markdownOKBoxText "\[\zs\s*\(OK\|SIM\)\s*\ze\]"
	syn match markdownNOBoxText "\[\zs\s*\(NO\|NAO\)\s*\ze\]"
	syn match markdownOKBox    "^\s*\[\s*\(OK\|SIM\)\s*\]"        contains=markdownOKBoxText
	syn match markdownNOBox    "^\s*\[\s*\(NO\|NAO\)\s*\]"        contains=markdownNOBoxText
	syn match markdownNOEmpty  "^\s*\[\s*\]"

	syn match markdownCheckBoxX "\[\zsx\ze\]"  
	syn match markdownCheckBox  "^\s*-\s*\[[\ x]\]"        contains=markdownCheckBoxX

	syn match markdownOK "^OK\ze\s."


	" --------------------------------------------------------------------------------	
	" --------------------------------------------------------------------------------	


	hi markdownOK               ctermfg=green 
	hi markdownBox              ctermfg=green
	hi markdownOKBox            ctermfg=red
	hi markdownNOBox            ctermfg=red
	hi markdownNOEmpty          ctermfg=red
	hi markdownOKBoxText        ctermfg=green
	hi markdownNOBoxText        ctermfg=gray
	hi markdownArrow            ctermfg=red
	hi markdownTime             ctermfg=cyan
	hi markdownTimeSep          ctermfg=darkcyan
	hi markdownString           cterm=italic
	hi markdownQuote            ctermfg=darkmagenta
	hi markdownString2          cterm=italic ctermfg=darkgreen
	hi markdownQuote2           ctermfg=green
	hi markdownTags             cterm=italic ctermfg=darkyellow
	hi markdownBrackts          ctermfg=yellow
	hi markdownTagSep           ctermfg=yellow
	hi markdownTags2            cterm=italic ctermfg=darkred
	hi markdownBrackts2         ctermfg=red
	hi markdownTagSep2          ctermfg=red
	hi markdownSectionMarker    ctermfg=blue
	hi markdownDashedText       cterm=italic
	hi markdownDashedTextDashes ctermfg=white

	hi def link markdownRightArrow            markdownArrow
	hi def link markdownBox                   markdownBox
	hi def link markdownCheckBox			  markdownArrow

	hi def link markdownCheckBoxX			  markdownBox


	hi markdownH2                cterm=none ctermfg=cyan
	hi markdownH3                cterm=none ctermfg=darkcyan
	hi markdownH4                cterm=none ctermfg=magenta
	hi markdownH5                cterm=none ctermfg=darkmagenta
	hi markdownH6                cterm=none ctermfg=red
	hi markdownListMarker        cterm=bold ctermfg=red
	hi markdownOrderedListMarker cterm=none ctermfg=red
	hi markdownRule                         ctermfg=darkcyan





