dotfiles
========

Vim update refer: 
<https://github.com/Valloric/YouCompleteMe/wiki/Building-Vim-from-source>

Vim vundle refer:
<https://github.com/gmarik/Vundle.vim>

## Steps

    git clone --recursive git@github.com:codeskyblue/dotfiles ~/.dotfiles
    echo '[[ -f ~/.dotfiles/bashrc ]] && source ~/.dotfiles/bashrc' >> ~/.bashrc
    

my own dotfiles for linux and mac

## bin
- pp

    An implementation `pip install --save`, update all `cat requirements.txt | xargs -i pp {}`

- adduser.sh

    add a new user to linux account

- base64

    Encode a string to BASE64

    ```
    echo -n hello | base64
    ```
