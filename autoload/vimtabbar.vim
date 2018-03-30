fun! vimtabbar#Build() "{{{

    let screen_width = &columns - 2
    let text_width = 0

    let on_screen = tabpagebuflist()

    let names = []
    let cur = bufnr('%')
    for i in range(1, bufnr('$'))

        if !s:IsVisible(i)
            continue
        endif

        let name = s:TabLabel(i)

        let synname = 'TabLineFill'
        if cur == i
            let synname = 'TabLineSel'
        elseif index(on_screen, i) >= 0
            let synname = 'TabLine'
        endif

        let names += [{'text': name, 'syn': synname}]
        let text_width += strlen(name)

        if cur < i - 1
            if text_width > screen_width
                let dif = text_width - screen_width
                let names[-1]['text'] = names[-1]['text'][: -dif]
                let text_width -= strlen(dif)

                break
            endif
        else
            while text_width > screen_width
                let dif = text_width - screen_width
                let first = names[0]
                if strlen(first['text']) <= dif
                    call remove(names, 0)
                    let text_width -= strlen(first['text'])
                else
                    let first['text'] = first['text'][dif :]
                    let text_width -= dif
                endif
            endwhile
        endif
    endfor

    let rst = ''
    for elt in names
        let rst .= '%#' . elt['syn'] . '#' . elt['text'] . '%0*'

    endfor
    return rst
endfunction "}}}

fun! s:IsVisible(i) "{{{
    if !bufexists(a:i) || !buflisted(a:i)
        return 0
    endif

    if getbufvar(a:i, 'current_syntax') == 'qf'
        return 0
    endif

    return 1
endfunction "}}}

fun! s:TabLabel(i) "{{{
    let mod = getbufvar(a:i, "&mod")
    let text = ""

    if mod == 1
        let text = " +"
    endif

    return text . s:BufLabel(a:i)
endfunction"}}}

fun! s:BufLabel(i) "{{{
    let path = bufname(a:i)
    if path == ""
        return ' [No Name] '
    endif

    let path = s:PathForHuman(path)
    return substitute(g:vimtabbar_pattern, '\V{path}', path, 'g')

endfunction "}}}

fun! s:PathForHuman(p) "{{{
    let p = a:p
    let p = simplify(p)
    let p = substitute(p, '\', '/', 'g')

    let p = substitute(p, '^\V' . escape( $HOME, '\' ), '~', '')

    let p = pathshorten(p)
    return p
endfunction "}}}
