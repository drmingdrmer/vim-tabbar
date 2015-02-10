if ! exists('g:vimtabbar_pattern')
    let g:vimtabbar_pattern = ' {path} '
endif

set showtabline=2
set guioptions-=e
set tabline=%!vimtabbar#Build()
