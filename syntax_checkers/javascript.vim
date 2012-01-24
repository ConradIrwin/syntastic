"============================================================================
"File:        javascript.vim
"Description: Syntax checking plugin for syntastic.vim
"Maintainer:  Martin Grenfell <martin.grenfell at gmail dot com>
"License:     This program is free software. It comes without any warranty,
"             to the extent permitted by applicable law. You can redistribute
"             it and/or modify it under the terms of the Do What The Fuck You
"             Want To Public License, Version 2, as published by Sam Hocevar.
"             See http://sam.zoy.org/wtfpl/COPYING for more details.
"
"============================================================================
if exists("loaded_javascript_syntax_checker")
    finish
endif
let loaded_javascript_syntax_checker = 1

"bail if the user doesnt have jsl installed
"if !executable("jslint")
"    finish
"endif

if !exists("g:syntastic_jsl_conf")
    let g:syntastic_jsl_conf = ""
endif

function! SyntaxCheckers_javascript_GetLocList()
    if empty(g:syntastic_jsl_conf)
        let jslconf = ""
    else
        let jslconf = " -conf " . g:syntastic_jsl_conf
    endif
    let makeprg = "jslint --no-context ".shellescape(expand('%'))
    let errorformat='%f:%l character %c: %m'
    return SyntasticMake({ 'makeprg': makeprg, 'errorformat': errorformat })
endfunction
