" =======================
" Function definitions (sourced by ~/.vimrc)
" =======================
" File:   ~/.vim/functions.vim

" =======================
" Implement change or deletion of set of characters contained in 
" smallest containing set of <>, (), {}, [] including brackets (a)
" or not (i) in operator-pending mode.
function! SelectMinTextObject(objs, ai, force)
    " visually select minimal textobject
    " objs  : any valid text object without i or a, eg: '{[(<'
    " ai    : 'a' or 'i'
    " force : start visual mode even if no valid text object found

    " init data
    let [minObj, minObjStart, minObjEnd] = ['', [], []]

    " split objs into list, loop it
    for obj in split(a:objs, '\zs')
        " get textobject range, continue if it's blank
        let [startPos, endPos] = GetTextObjectPos(a:ai . obj)
        if startPos == []
            continue
        endif

        " update data if it's empty or current text object is smaller
        if minObj ==# '' || minObjStart[1] < startPos[1] ||
            \ minObjStart[1] == startPos[1] && minObjStart[2] < startPos[2]
            let [minObj, minObjStart, minObjEnd] = [obj, startPos, endPos]
        endif
    endfor

    " return if no valid obj found
    if minObj ==# ''
        if a:force
            normal! v
        endif
        return 0
    endif

    " visually select textobject.
    execute 'normal! v'. a:ai . minObj
    return 1
endfunction

function! GetTextObjectPos(obj)
    " get text object range as [startPos, endPos], pos format is the same as
    " getpos(), except it returns [[],[]] if text object is blank
    try
        " record cursor, @a, '[, ']
        let [ cursorPos, regText, regType, yankPos0, yankPos1 ] =
              \ [ getcurpos(), getreg('"'), getregtype('"'),
              \   getpos("'["), getpos("']")]
        " clear register. it's necessary because "ay.. won't fill a if .. is blank
        let @a = ''
        " copy text object into @a if it's not blank
        exec 'normal! "ay' . a:obj
        " return blank if nothing copied, otherwise return start and end of copied
        " area
        return @a ==# '' ? [[],[]] : [getpos("'["), getpos("']")]
    finally
        " restore cursor, @a, '[, ']
        call setpos('.', cursorPos) | call setreg('a', regText, regType)
        call setpos("'[", yankPos0) | call setpos("']", yankPos1)
    endtry
endfunction
" cannot implement omap with vmap, because minimal v area is 1 character,
" minimal o area is 0 character
" =======================


" =======================

