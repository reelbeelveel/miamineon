" TODO Title Block.
" Supporting code -------------------------------------------------------------
" Preamble {{{

if !has("gui_running") && &t_Co != 88 && &t_Co != 256
    finish
endif

set background=dark

if exists("syntax_on")
    syntax reset
endif

let g:colors_name = "miamineon"


" }}}
" Palette {{{

let s:mnc = {}

" Normal text.
let s:mnc.lime = ['00ff00', 10]

" Pure and simple.
let s:mnc.milk = ['ffffff', 15]
let s:mnc.ink  = ['000000', 16]

" A Gradient of Gray. A Graydient, if you will.
let s:mnc.brightgray   = ['d9cec3', 252] 
let s:mnc.lightgray    = ['998f84', 245]
let s:mnc.gray         = ['857f78', 243]
let s:mnc.mediumgray   = ['666462', 241]
let s:mnc.deepgray     = ['45413b', 238]
let s:mnc.deepergray   = ['35322d', 236]
let s:mnc.darkgray     = ['242321', 235]
let s:mnc.blackgray    = ['1c1b1a', 233]
let s:mnc.blackestgray = ['141413', 232]

" With a high of 114ºF
let s:mnc.hotpink    = ['d7005f', 162]
" So yellow it's criminal.
let s:mnc.viceyellow = ['d7ff00', 190]
" Like an unfiltered swimming pool.
let s:mnc.seastain   = ['87ffa7', 121]
" the place crawls with the beasts
let s:mnc.crocodile  = ['5f875f', 65]
" is similar to lime but slimier.
let s:mnc.slime      = ['87ff00', 118]
" Heavily burnt, rotting orange.
let s:mnc.sunburn    = ['d75f00', 166]
" Dirty underpass
let s:mnc.concrete   = ['d7d7ff', 189]
" Gradient fullfilled.
let s:mnc.purple     = ['af00ff', 127]
let s:mnc.purpler    = ['af00d7', 129]
let s:mnc.purplest   = ['af5fff', 135]

" }}}
" Highlighting Function {{{
function! s:HL(group, fg, ...)
    " Arguments: group, guifg, guibg, gui, guisp

    let histring = 'hi ' . a:group . ' '

    if strlen(a:fg)
        if a:fg == 'fg'
            let histring .= 'guifg=fg ctermfg=fg '
        else
            let c = get(s:mnc, a:fg)
            let histring .= 'guifg=#' . c[0] . ' ctermfg=' . c[1] . ' '
        endif
    endif

    if a:0 >= 1 && strlen(a:1)
        if a:1 == 'bg'
            let histring .= 'guibg=bg ctermbg=bg '
        else
            let c = get(s:mnc, a:1)
            let histring .= 'guibg=#' . c[0] . ' ctermbg=' . c[1] . ' '
        endif
    endif

    if a:0 >= 2 && strlen(a:2)
        let histring .= 'gui=' . a:2 . ' cterm=' . a:2 . ' '
    endif

    if a:0 >= 3 && strlen(a:3)
        let c = get(s:mnc, a:3)
        let histring .= 'guisp=#' . c[0] . ' '
    endif

    " echom histring

    execute histring
endfunction
" }}}
" Configuration Options {{{

let s:gutter='blackgray'
let s:tabline='blackgray'
" }}}

" Actual colorscheme ----------------------------------------------------------
" Vanilla Vim {{{

" General/UI {{{

call s:HL('Normal', 'lime', 'blackgray')
call s:HL('NonText', 'crocodile', 'bg')
call s:HL('Folded', 'crocodile', 'bg', '')

call s:HL('VertSplit', 'darkgray', 'deepgray', '')

call s:HL('CursorLine',   '', 'blackestgray', 'none')
call s:HL('CursorColumn', '', 'blackgray')
call s:HL('ColorColumn',  '', 'blackgray')

call s:HL('TabLine', 'lime', s:tabline, 'none')
call s:HL('TabLineFill', 'lime', s:tabline, 'none')
call s:HL('TabLineSel', 'ink', 'slime', 'none')

call s:HL('MatchParen', 'concrete', 'darkgray', 'bold')

call s:HL('SpecialKey', 'crocodile', 'bg', 'bold')

call s:HL('Visual',    '',  'deepgray')
call s:HL('VisualNOS', '',  'deepgray')

call s:HL('Search',    'ink', 'concrete', 'bold')
call s:HL('IncSearch', 'ink', 'slime',    'bold')

call s:HL('Underlined', 'fg', '', 'underline')

call s:HL('StatusLine',   'ink', 'slime',     'bold')
call s:HL('StatusLineNC', 'milk', 'deepgray', 'bold')

call s:HL('Directory', 'hotpink', '', 'bold')

call s:HL('Title', 'seastain')

call s:HL('ErrorMsg',   'viceyellow','bg','bold')
call s:HL('MoreMsg',    'concrete',  '',  'bold')
call s:HL('ModeMsg',    'hotpink',   '',  'bold')
call s:HL('Question',   'hotpink',   '',  'bold')
call s:HL('WarningMsg', 'concrete',  '',  'bold')

" This is a ctags tag, not an HTML one.  'Something you can use c-] on'.
call s:HL('Tag', '', '', 'bold')

" hi IndentGuides                  guibg=#373737
" hi WildMenu        guifg=#66D9EF guibg=#000000

" }}}
" Gutter {{{

call s:HL('LineNr',       'gray', s:gutter)
call s:HL('CursorLineNr', 'viceyellow', 'blackgray')
call s:HL('SignColumn',   '',             s:gutter)
call s:HL('FoldColumn',   'crocodile', s:gutter)

" }}}
" Cursor {{{

call s:HL('Cursor',  'crocodile', 'slime', 'bold')
call s:HL('vCursor', 'slime', 'slime', 'bold')
call s:HL('iCursor', 'slime', 'slime', 'none')

" }}}
" Syntax highlighting {{{

" Start with a simple base.
call s:HL('Special', 'seastain')

" Comments are slightly brighter than folds, to make 'headers' easier to see.
call s:HL('Comment',        'crocodile', 'bg', 'none')
call s:HL('Todo',           'concrete', 'bg', 'bold')
call s:HL('SpecialComment', 'concrete', 'bg', 'bold')

" Strings are a nice, pale straw color.  Nothing too fancy.
call s:HL('String', 'hotpink')

" Control flow stuff is viceyellow.
call s:HL('Statement',   'viceyellow', '', 'bold')
call s:HL('Keyword',     'viceyellow', '', 'bold')
call s:HL('Conditional', 'viceyellow', '', 'bold')
call s:HL('Operator',    'viceyellow', '', 'none')
call s:HL('Label',       'viceyellow', '', 'none')
call s:HL('Repeat',      'viceyellow', '', 'none')

" Functions and variable declarations are sunburn, because plain looks weird.
call s:HL('Identifier',   'sunburn', '', 'none')
call s:HL('Function',     'sunburn', '', 'none')
call s:HL('vimFunction',  'sunburn', '', 'none')
call s:HL('vimFunc',      'sunburn', '', 'none')
call s:HL('vimIsCommand', 'sunburn', '', 'none')
call s:HL('PreProc',     'seastain', '', 'none')
call s:HL('Macro',       'seastain', '', 'none')
call s:HL('Define',      'seastain', '', 'none')
call s:HL('PreCondit',   'seastain', '', 'bold')
call s:HL('Constant',      'purple', '', 'bold')
call s:HL('Character',     'purple', '', 'bold')
call s:HL('Boolean',       'purple', '', 'bold')
call s:HL('Number',        'purple', '', 'bold')
call s:HL('Float',         'purple', '', 'bold')
call s:HL('SpecialChar', 'concrete', '', 'bold')
call s:HL('Type',        'concrete', '', 'none')
call s:HL('StorageClass', 'viceyellow', '', 'none')
call s:HL('Structure', 'viceyellow', '', 'none')
call s:HL('Typedef',   'viceyellow', '', 'bold')
" Make try/catch blocks stand out.
call s:HL('Exception','seastain', '', 'bold')
" Misc
call s:HL('Error','hotpink', 'slime', 'bold')
call s:HL('Debug', 'viceyellow', 'ink', 'bold')
call s:HL('Ignore', 'mediumgray', '', '')
" }}}
" Completion Menu {{{
call s:HL('Pmenu', 'lime', 'deepergray')
call s:HL('PmenuSel', 'ink', 'slime', 'bold')
call s:HL('PmenuSbar', '', 'deepergray')
call s:HL('PmenuThumb', 'brightgray')

" }}}
" Diffs {{{

call s:HL('DiffDelete', 'ink', 'ink')
call s:HL('DiffAdd', '', 'deepergray')
call s:HL('DiffChange', '', 'darkgray')
call s:HL('DiffText', 'milk', 'deepergray', 'bold')

" }}}
" Spelling {{{

if has("spell")
    call s:HL('SpellCap', 'concrete', 'bg', 'undercurl,bold', 'concrete')
    call s:HL('SpellBad', '', 'bg', 'undercurl', 'concrete')
    call s:HL('SpellLocal', '', '', 'undercurl', 'concrete')
    call s:HL('SpellRare', '', '', 'undercurl', 'concrete')
endif

" }}}

" }}}
" Plugins {{{

" CtrlP {{{

    " the message when no match is found
    call s:HL('CtrlPNoEntries', 'concrete', 'viceyellow', 'bold')

    " the matched pattern
    call s:HL('CtrlPMatch', 'sunburn', 'bg', 'none')

    " the line prefix '>' in the match window
    call s:HL('CtrlPLinePre', 'deepgray', 'bg', 'none')

    " the prompt’s base
    call s:HL('CtrlPPrtBase', 'deepgray', 'bg', 'none')

    " the prompt’s text
    call s:HL('CtrlPPrtText', 'lime', 'bg', 'none')

    " the prompt’s cursor when moving over the text
    call s:HL('CtrlPPrtCursor', 'ink', 'slime', 'bold')

    " 'prt' or 'win', also for 'regex'
    call s:HL('CtrlPMode1', 'ink', 'slime', 'bold')

    " 'file' or 'path', also for the local working dir
    call s:HL('CtrlPMode2', 'ink', 'slime', 'bold')

    " the scanning status
    call s:HL('CtrlPStats', 'ink', 'slime', 'bold')

    " TODO: CtrlP extensions.
    " CtrlPTabExtra  : the part of each line that’s not matched against (Comment)
    " CtrlPqfLineCol : the line and column numbers in quickfix mode (|s:HL-Search|)
    " CtrlPUndoT     : the elapsed time in undo mode (|s:HL-Directory|)
    " CtrlPUndoBr    : the square brackets [] in undo mode (Comment)
    " CtrlPUndoNr    : the undo number inside [] in undo mode (String)

" }}}
" EasyMotion {{{

call s:HL('EasyMotionTarget', 'slime',  'bg', 'bold')
call s:HL('EasyMotionShade',  'deepgray', 'bg')

" }}}
" Interesting Words {{{

call s:HL('InterestingWord1', 'ink', 'sunburn')
call s:HL('InterestingWord2', 'ink', 'lime')
call s:HL('InterestingWord3', 'ink', 'seastain')
call s:HL('InterestingWord4', 'ink', 'purple')
call s:HL('InterestingWord5', 'ink', 'concrete')
call s:HL('InterestingWord6', 'ink', 'viceyellow')

" }}}
" Makegreen {{{
"
" hi GreenBar term=reverse ctermfg=white ctermbg=green guifg=ink guibg=#9edf1c
" hi RedBar   term=reverse ctermfg=white ctermbg=red guifg=white guibg=#C50048

" }}}
" Rainbow Parentheses {{{

call s:HL('level16c', 'mediumgray','', 'bold')
call s:HL('level15c', 'concrete','', '')
call s:HL('level14c', 'concrete','', '')
call s:HL('level13c', 'sunburn','', '')
call s:HL('level12c', 'slime','', '')
call s:HL('level11c', 'lime','', '')
call s:HL('level10c', 'purple','', '')
call s:HL('level9c',  'seastain', '', '')
call s:HL('level8c',  'purpler','', '')
call s:HL('level7c',  'concrete','', '')
call s:HL('level6c',  'concrete','', '')
call s:HL('level5c',  'sunburn','', '')
call s:HL('level4c',  'slime','', '')
call s:HL('level3c',  'lime','', '')
call s:HL('level2c',  'purple','', '')
call s:HL('level1c',  'seastain', '', '')

" }}}
" ShowMarks {{{

call s:HL('ShowMarksHLl', 'slime', 'blackgray')
call s:HL('ShowMarksHLu', 'slime', 'blackgray')
call s:HL('ShowMarksHLo', 'slime', 'blackgray')
call s:HL('ShowMarksHLm', 'slime', 'blackgray')

" }}}

" }}}
" Filetype-specific {{{

" Clojure {{{

call s:HL('clojureSpecial',  'viceyellow', '', '')
call s:HL('clojureDefn',     'viceyellow', '', '')
call s:HL('clojureDefMacro', 'viceyellow', '', '')
call s:HL('clojureDefine',   'viceyellow', '', '')
call s:HL('clojureMacro',    'viceyellow', '', '')
call s:HL('clojureCond',     'viceyellow', '', '')

call s:HL('clojureKeyword', 'sunburn', '', 'none')

call s:HL('clojureFunc',   'concrete', '', 'none')
call s:HL('clojureRepeat', 'concrete', '', 'none')

call s:HL('clojureParen0', 'lightgray', '', 'none')

call s:HL('clojureAnonArg', 'milk', '', 'bold')

" }}}
" Common Lisp {{{

call s:HL('lispFunc',           'lime', '', 'none')
call s:HL('lispVar',            'sunburn', '', 'bold')
call s:HL('lispEscapeSpecial',  'sunburn', '', 'none')

" }}}
" CSS {{{

call s:HL('cssColorProp', 'viceyellow', '', 'none')
call s:HL('cssBoxProp', 'viceyellow', '', 'none')
call s:HL('cssTextProp', 'viceyellow', '', 'none')
call s:HL('cssRenderProp', 'viceyellow', '', 'none')
call s:HL('cssGeneratedContentProp', 'viceyellow', '', 'none')

call s:HL('cssValueLength', 'purple', '', 'bold')
call s:HL('cssColor', 'purple', '', 'bold')
call s:HL('cssBraces', 'lightgray', '', 'none')
call s:HL('cssIdentifier', 'sunburn', '', 'bold')
call s:HL('cssClassName', 'sunburn', '', 'none')

" }}}
" Diff {{{

call s:HL('gitDiff', 'lightgray', '',)

call s:HL('diffRemoved', 'concrete', '',)
call s:HL('diffAdded', 'lime', '',)
call s:HL('diffFile', 'ink', 'viceyellow', 'bold')
call s:HL('diffNewFile', 'ink', 'viceyellow', 'bold')

call s:HL('diffLine', 'ink', 'sunburn', 'bold')
call s:HL('diffSubname', 'sunburn', '', 'none')

" }}}
" Django Templates {{{

call s:HL('djangoArgument', 'hotpink', '',)
call s:HL('djangoTagBlock', 'sunburn', '')
call s:HL('djangoVarBlock', 'sunburn', '')

" }}}
" HTML {{{

" Punctuation
call s:HL('htmlTag',    'purple', 'bg', 'none')
call s:HL('htmlEndTag', 'purplest', 'bg', 'none')

" Tag names
call s:HL('htmlTagName',       'purple', '', 'bold')
call s:HL('htmlSpecialTagName','sunburn', '', 'bold')
call s:HL('htmlSpecialChar',      'slime', '', 'none')

" Attributes
call s:HL('htmlArg', 'viceyellow', '', 'none')

" Stuff inside an <a> tag

    call s:HL('htmlLink', 'concrete', '', 'underline')
" }}}
" Java {{{

call s:HL('javaClassDecl', 'viceyellow', '', 'bold')
call s:HL('javaScopeDecl', 'viceyellow', '', 'bold')
call s:HL('javaCommentTitle',    'lightgray', '')
call s:HL('javaDocTags', 'milk', '', 'none')
call s:HL('javaDocParam', 'concrete','', '')

" }}}
" LaTeX {{{

call s:HL('texStatement'  , 'slime'  , '', 'none')
call s:HL('texMathZoneX'  , 'sunburn', '', 'none')
call s:HL('texMathZoneA'  , 'sunburn', '', 'none')
call s:HL('texMathZoneB'  , 'sunburn', '', 'none')
call s:HL('texMathZoneC'  , 'sunburn', '', 'none')
call s:HL('texMathZoneD'  , 'sunburn', '', 'none')
call s:HL('texMathZoneE'  , 'sunburn', '', 'none')
call s:HL('texMathZoneV'  , 'sunburn', '', 'none')
call s:HL('texMathZoneX'  , 'sunburn', '', 'none')
call s:HL('texMath'       , 'sunburn', '', 'none')
call s:HL('texMathMatcher','sunburn' , '', 'none')
call s:HL('texRefLabel '  , 'hotpink', '', 'none')
call s:HL('texRefZone'    ,    'lime', '', 'none')
call s:HL('texComment'    ,'purplest', '', 'none')
call s:HL('texDelimiter'  , 'sunburn', '', 'none')
call s:HL('texZone'   ,'brightgray', '', 'none')

augroup badwolf_tex
    au!

    au BufRead,BufNewFile *.tex syn region texMathZoneV start="\\(" end="\\)\|%stopzone\>" keepend contains=@texMathZoneGroup
    au BufRead,BufNewFile *.tex syn region texMathZoneX start="\$" skip="\\\\\|\\\$" end="\$\|%stopzone\>" keepend contains=@texMathZoneGroup
augroup END

" }}}
" LessCSS {{{

call s:HL('lessVariable', 'lime', '', 'none')

" }}}
" Lispyscript {{{

call s:HL('lispyscriptDefMacro', 'lime', '', '')
call s:HL('lispyscriptRepeat', 'concrete', '', 'none')

" }}}
" REPLs {{{
" This isn't a specific plugin, but just useful highlight classes for anything
" that might want to use them.

call s:HL('replPrompt', 'slime', '', 'bold')

" }}}
" Mail {{{

call s:HL('mailSubject', 'sunburn', '', 'bold')
call s:HL('mailHeader', 'lightgray', '', '')
call s:HL('mailHeaderKey', 'lightgray', '', '')
call s:HL('mailHeaderEmail', 'milk', '', '')
call s:HL('mailURL', 'purple', '', 'underline')
call s:HL('mailSignature', 'gray', '', 'none')
call s:HL('mailQuoted1', 'gray', '', 'none')
call s:HL('mailQuoted2', 'concrete', '', 'none')
call s:HL('mailQuoted3', 'hotpink', '', 'none')
call s:HL('mailQuoted4', 'sunburn', '', 'none')
call s:HL('mailQuoted5', 'lime', '', 'none')

" }}}
" Markdown {{{

call s:HL('markdownHeadingRule', 'lightgray', '', 'bold')
call s:HL('markdownHeadingDelimiter', 'lightgray', '', 'bold')
call s:HL('markdownOrderedListMarker', 'lightgray', '', 'bold')
call s:HL('markdownListMarker', 'lightgray', '', 'bold')
call s:HL('markdownItalic', 'milk', '', 'bold')
call s:HL('markdownBold', 'milk', '', 'bold')
call s:HL('markdownH1', 'sunburn', '', 'bold')
call s:HL('markdownH2', 'lime', '', 'bold')
call s:HL('markdownH3', 'lime', '', 'none')
call s:HL('markdownH4', 'lime', '', 'none')
call s:HL('markdownH5', 'lime', '', 'none')
call s:HL('markdownH6', 'lime', '', 'none')
call s:HL('markdownLinkText', 'purple', '', 'underline')
call s:HL('markdownIdDeclaration', 'purple')
call s:HL('markdownAutomaticLink', 'purple', '', 'bold')
call s:HL('markdownUrl', 'purple', '', 'bold')
call s:HL('markdownUrldelimiter', 'lightgray', '', 'bold')
call s:HL('markdownLinkDelimiter', 'lightgray', '', 'bold')
call s:HL('markdownLinkTextDelimiter', 'lightgray', '', 'bold')
call s:HL('markdownCodeDelimiter', 'hotpink', '', 'bold')
call s:HL('markdownCode', 'hotpink', '', 'none')
call s:HL('markdownCodeBlock', 'hotpink', '', 'none')

" }}}
" MySQL {{{

call s:HL('mysqlSpecial', 'concrete', '', 'bold')

" }}}
" Python {{{

hi def link pythonOperator Operator
call s:HL('pythonBuiltin',     'concrete')
call s:HL('pythonBuiltinObj',  'concrete')
call s:HL('pythonBuiltinFunc', 'concrete')
call s:HL('pythonEscape',      'concrete')
call s:HL('pythonException',   'lime', '', 'bold')
call s:HL('pythonExceptions',  'lime', '', 'none')
call s:HL('pythonPrecondit',   'lime', '', 'none')
call s:HL('pythonDecorator',   'viceyellow', '', 'none')
call s:HL('pythonRun',         'gray', '', 'bold')
call s:HL('pythonCoding',      'gray', '', 'bold')

" }}}
" SLIMV {{{

" Rainbow parentheses
call s:HL('hlLevel0', 'gray')
call s:HL('hlLevel1', 'sunburn')
call s:HL('hlLevel2', 'seastain')
call s:HL('hlLevel3', 'concrete')
call s:HL('hlLevel4', 'purpler')
call s:HL('hlLevel5', 'hotpink')
call s:HL('hlLevel6', 'sunburn')
call s:HL('hlLevel7', 'seastain')
call s:HL('hlLevel8', 'concrete')
call s:HL('hlLevel9', 'purpler')

" }}}
" Vim {{{

call s:HL('VimCommentTitle', 'lightgray', '', 'bold')

call s:HL('VimMapMod',    'concrete', '', 'none')
call s:HL('VimMapModKey', 'concrete', '', 'none')
call s:HL('VimNotation', 'concrete', '', 'none')
call s:HL('VimBracket', 'concrete', '', 'none')

" }}}

" }}}

