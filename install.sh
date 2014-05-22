#! /bin/bash
#
# install.sh
# Copyright (C) 2014 work <work@cp01-rdqa2014-01.vm.baidu.com>
#
# Distributed under terms of the MIT license.
#


find ./ -maxdepth 1 -name '.*' | while read filename
do
	BASENAME=$(basename $filename)
	ABSNAME=$(readlink -f $filename)
	TGTNAME=$HOME/$BASENAME

	case $BASENAME in
		.) continue;;
		..) continue;;
	esac

	if test -L $TGTNAME
	then
		if test "X$(readlink -f $TGTNAME)" = "X$ABSNAME"
		then
			echo "SKIP $BASENAME"
			continue
		else
			echo "FIX link $BASENAME"
			ln -svf $ABSNAME $TGTNAME
			continue
		fi
	fi
	if test -f $TGTNAME
	then
		echo "MAKE $name"
		read -p "exists $name -- replace [y/n]" confirm
		if [[ "X$confirm" != "Xn" ]]
		then
			ln -svf $ABSNAME $TGTNAME
		fi
		continue
	fi
	if test -d $TGTNAME
	then
		echo "backup folder"
		mv $TGTNAME $TGTNAME.bak
	fi
	ln -svf $ABSNAME $TGTNAME
done
