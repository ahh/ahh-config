# .zshrc 
#
# System default .zshrc file.  The .zshrc file are executed when the shell is
# executed after your .login file when you first log in.
#

# Prompt taken from mpierce@knuth.
# It looks best with white text on a black background.
# a colorified, somewhat rearranged version.
fg_red="$(print '%{\e[1;31m%}')"
fg_green="$(print '%{\e[1;32m%}')"
fg_normal="$(print '%{\e[0m%}')"
PS1="%(!.${fg_red}.${fg_green})%n${fg_normal}@%B%m%b [%6c]
(%!) %# "

HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.history

# Have zsh tell you when background jobs finish
setopt notify

# Turn off the infuriating beeping noises
# If you want the shell to beep when you make a mistake,
# comment this line out and run source .zshrc on it.
setopt nobeep

# Protect files from being overwritten
setopt noclobber

# Add a spell checking option for commands
setopt correct

# Disable core dumps
# (If you don't know what that is, you probably want it disabled.)
ulimit -c 0

alias     ls='ls -F --color=auto'
alias asdfg='gcc -x c - && ./a.out && rm a.out'

# Load the zsh completion system
autoload -U compinit
compinit

bindkey -e

export EDITOR=emacs
stty stop undef
alias ack=ack-grep
