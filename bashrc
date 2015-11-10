# Add to ~/.bashrc
#
# test -z "$DOTFILE_BASHRC" && . $HOME/.dotfiles/bashrc
#
#

DOTFILE_BASHRC=1

alias gs='git status -s'
alias gp='git push'
alias cdgodir='cd $GOPATH/src'

case $(uname) in
Darwin)
	alias ls='ls -l -G'
	export GOPATH=$HOME/Documents/godir
	;;
*)
	export GOPATH=$HOME/godir
	;;
esac

export PATH=$PATH:$GOPATH/bin:$HOME/.dotfiles/bin

# quick change dir
qcd(){
	FILE=$HOME/.qcd.list
	if test $# -eq 0
	then
		echo $PWD >> $FILE
		echo -e "Add to '$FILE'\n$PWD"
		return
	fi
	if test $(uniq $FILE | grep "$1" | wc -l) -eq 1
	then
		cd $(uniq $FILE | grep "$1")
		return
	else
		uniq $FILE | grep "$1"
	fi
}

#PS1='\u@\h \w $ '
export GITAWAREPROMPT=~/.dotfiles/git-aware-prompt
source "${GITAWAREPROMPT}/main.sh"

PS1="\${debian_chroot:+(\$debian_chroot)}\u@\h:\w \n\[$txtcyn\]\$git_branch\[$txtred\]\$git_dirty\[$txtrst\]\[$txtred\]$\[$txtrst\] "
