#! /bin/bash
#
# install.sh
# Copyright (C) 2014 work <work@cp01-rdqa2014-01.vm.baidu.com>
#
# Distributed under terms of the MIT license.
#

set -eu

link(){
	FROM=$1
	TO=${2:-".$FROM"}
	ln -sf -v "$PWD/$FROM" "$HOME/$TO"
}

link tmux.conf
link vimrc.simple .vimrc
link gitconfig
