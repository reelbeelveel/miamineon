# miamineon

A Vim colorscheme built on Steve Losh's Badwolf (http://stevelosh.com/projects/badwolf/)

I honestly have no idea what I'm doing, but I'm trying my best to learn...

# screenshots
![Alt text](/../master/screenshots/splash-screenshot.png?raw=true)
![Alt text](/../master/screenshots/screenshot0.png?raw=true)

# installation

```
mv miamineon.vim ~/.vim/colors/
mv miamineon-airline.vim ~/.vim/plugged/vim-airline-themes/autoload/airline/themes/miamineon.vim
```

Add to .vimrc:

```
colorscheme miamineon
let g:airline_theme = 'miamineon'
```

Enjoy!

# additional notes

Because this colorscheme is xterm-256 based, it will not appear correctly for terminals which are not 256-color compatible.

