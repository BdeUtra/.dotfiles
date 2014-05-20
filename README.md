Leto CLI dotfiles
=================

a basic set of sanity dot files to start off some of your important CLI program's config files.

Pre-install
-----------

mac
```
brew install vim
brew install tmux
brew install tig
brew install reattach-to-user-namespace
```

linux
```
sudo apt-get install vim-gtk
sudo apt-get install tmux
sudo apt-get install tig
```

you want all these things.

Install
-------
1. `cd ~`
2. `git clone https://github.com/letolab/.dotfiles.git` (lies fork this mofo don't clone)
3. `cd .dotfiles`
4. `python makesyms.py`
5. `git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim` trust me you want this

Programs
---------------
so your three basic programs are `vim`, `tmux -2`, and `tig`

`vim` is your text editor and or IDE, it does all of the things and is baddass.

`tmux -2` is a terminal based widow/buffer manger it means you can be baddass with vim (the `-2` suffix make tmux use 256 colors in terminal)

`tig` is cool git viewer in curses, it means you can get on with learning vim without thinking about git to much

Important Changed Keybinds
------------------
`CTRL-a` is your tmux prefix, all tmux commands are prefixed by this keystroke (not CTRL-b which is default).

`ALT-<left|right|up|down>` resizes tmux panes

`CTRL-a v` opens a tmux vertical split

`CTRL-a h` opens a tmux horizontal split

*optional (recomended)* bind your capslock key to ESC: https://pqrs.org/macosx/keyremap4macbook/pckeyboardhack.html.en


Cheatsheets
-----------
tmux: https://gist.github.com/henrik/1967800

vim: http://zombiebrainzjuice.fr/wp-content/uploads/2013/08/An-extended-and-graphical-VIM-cheat-sheet.png

http://vim.rtorr.com/

tig: https://github.com/pmiossec/tig-cheat-sheet/releases/tag/v0.2

Things you should read
----------------------
http://stevelosh.com/blog/2010/09/coming-home-to-vim/

http://mislav.uniqpath.com/2011/12/vim-revisited/

Links you should click
--------------------------
http://vimcasts.org/
    
https://github.com/trending?l=vim

http://www.reddit.com/r/vim

http://zzapper.co.uk/vimtips.html

http://www.meetup.com/Vim-London/

Dotfiles from leto people
-------------------------
Poking around other peoples dotfiles is a good way of finding cool things or ways of doing stuff 

https://github.com/nicwest/.dotfiles

https://gist.github.com/qazwsxpawel/937863b9b5ed18e0322e
