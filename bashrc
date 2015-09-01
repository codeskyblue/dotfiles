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

PS1='\u@\h \w $ '
