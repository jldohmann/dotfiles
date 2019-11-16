" Vim syntax file
" Language: reStructuredText documentation format
" Maintainer: Marshall Ward <marshall.ward@gmail.com>
" Previous Maintainer: Nikolai Weibull <now@bitwi.se>
" Website: https://github.com/marshallward/vim-restructuredtext
" Latest Revision: 2018-12-29

if exists("b:current_syntax")
finish
endif

let s:cpo_save = &cpo
set cpo&vim

syn case ignore

syn match   rstTransition  /^[=`:.'"~^_*+#-]\{4,}\s*$/

syn cluster rstCruft                contains=rstEmphasis,rstStrongEmphasis,
       \ rstInterpretedText,rstInlineLiteral,rstSubstitutionReference,
       \ rstInlineInternalTargets,rstFootnoteReference,rstHyperlinkReference
 
syn region  rstLiteralBlock         matchgroup=rstDelimiter
       \ start='::\_s*\n\ze\z(\s\+\)' skip='^$' end='^\z1\@!'
       \ contains=@NoSpell

syn region  rstQuotedLiteralBlock   matchgroup=rstDelimiter
       \ start="::\_s*\n\ze\z([!\"#$%&'()*+,-./:;<=>?@[\]^_`{|}~]\)"
       \ end='^\z1\@!' contains=@NoSpell
 
syn region  rstDoctestBlock         oneline display matchgroup=rstDelimiter
       \ start='^>>>\s' end='^$'
 
syn region  rstTable                transparent start='^\n\s*+[-=+]\+' end='^$'
       \ contains=rstTableLines,@rstCruft
syn match   rstTableLines           contained display '|\|+\%(=\+\|-\+\)\='
 
syn region  rstSimpleTable          transparent
       \ start='^\n\%(\s*\)\@>\%(\%(=\+\)\@>\%(\s\+\)\@>\)\%(\%(\%(=\+\)\@>\%(\s*\)\@>\)\+\)\@>$'
       \ end='^$'
       \ contains=rstSimpleTableLines,@rstCruft
syn match   rstSimpleTableLines     contained display
       \ '^\%(\s*\)\@>\%(\%(=\+\)\@>\%(\s\+\)\@>\)\%(\%(\%(=\+\)\@>\%(\s*\)\@>\)\+\)\@>$'
syn match   rstSimpleTableLines     contained display
       \ '^\%(\s*\)\@>\%(\%(-\+\)\@>\%(\s\+\)\@>\)\%(\%(\%(-\+\)\@>\%(\s*\)\@>\)\+\)\@>$'
 
syn cluster rstDirectives           contains=rstFootnote,rstCitation,
       \ rstHyperlinkTarget,rstExDirective
 
syn match   rstExplicitMarkup       '^\s*\.\.\_s'
       \ nextgroup=@rstDirectives,rstComment,rstSubstitutionDefinition
 
" "Simple reference names are single words consisting of alphanumerics plus
" isolated (no two adjacent) internal hyphens, underscores, periods, colons
" and plus signs."
let s:ReferenceName = '[[:alnum:]]\%([-_.:+]\?[[:alnum:]]\+\)*'
 
syn keyword     rstTodo             contained FIXME TODO XXX NOTE
