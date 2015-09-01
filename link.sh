#! /bin/bash
#
# install.sh
# Copyright (C) 2014 work <work@cp01-rdqa2014-01.vm.baidu.com>
#
# Distributed under terms of the MIT license.
#

link(){
	FILE=$1
	ln -sf -v "$PWD/$FILE" "$HOME/.$FILE"
}

link $1
