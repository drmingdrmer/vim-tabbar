# vim-tabbar

## Preface

This is a fork of [drmingdrmer/vim-tabbar](https://github.com/drmingdrmer/vim-tabbar), which was the closest plugin to the functionality I wanted out of my tab bar.

There are exactly two differences between this fork and the original:

1. `"[No Name]" -> " [No Name] "`, to fix the spacing.
2. There is now a middle-man function `TabLabel` which returns exactly what `BufLabel` returns, plus a `+` if the file is modified.

TL;DR - I made it behave more like the *built-in* tabline.

So if you're using drmingdrmer's buftabline and find yourself hurting for that little `+` to let you know the buffer is modified, this fork is for you.

## Original Readme

Simple, stupid and fast tab-bar for VIM.

Names of opened buffer are shortened and shows on the top row of window.

Tab button uses one of these three highlight for different states:

-   `TabLineFill`: inactive buffer(**grey text on cyan background**).
-   `TabLine`: in one of the windows but not focused(**white text on dark cyan background**).
-   `TabLineSel`: currently focused buffer(**black text on white background**).

![](res/screenshot.png)

##  Installation

Installing with [pathogen.vim](https://github.com/tpope/vim-pathogen)
 is recommended. Copy and paste:

```sh
cd ~/.vim/bundle
git clone git://github.com/drmingdrmer/vim-tabbar.git
```

Or just copy all of the files in to `~/.vim`.

##  Customizing Colors

Three high light settings in color scheme file(`~/.vim/colors/**.vim`)
are used by this plugin:

```vim
hi TabLineFill cterm=none ctermfg=grey  ctermbg=cyan
hi TabLine     cterm=none ctermfg=white ctermbg=cyan
hi TabLineSel  cterm=none ctermfg=black ctermbg=white
```
