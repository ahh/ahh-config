# .zshrc 
#
# System default .zshrc file.  The .zshrc file are executed when the shell is
# executed after your .login file when you first log in.
#
# Other important dot files that you might want to look at
#   .zlogin   .emacs   .forward

# This makes the default path plus these two available to users.
# The ~/bin is so you can have binaries in you own home folder
# that the shell can find and execute.
#export PATH=$PATH:~/bin

# Some classes, like CS60, require you to be able to use and execute 
# special programs. The directory where these programs are stored should
# be given to you by your professor. Since you'll be using these programs
# frequently its useful to add them to your PATH. Uncomment the following
# line to add the bin directory for CS60 to your PATH.
#export PATH=$PATH:/cs/cs60/bin

# Your current directory (denoted ".") is the directory from which you
# are typing your commands, and can be changed with "chdir" or "cd".
# It's isn't in the default path, because having it in your path may
# lead to security problems.  If you want, uncomment the following line. 
#export PATH=$PATH:.

# Default user prompt
#PS1="%T [%n@%m:%~]
#%! %# "

# Here are some other good prompts to choose from. You can also 
# create your own.
# mpierce uses a colorified, somewhat rearranged version:
fg_red="$(print '%{\e[1;31m%}')"
fg_green="$(print '%{\e[1;32m%}')"
fg_normal="$(print '%{\e[0m%}')"
PS1="%(!.${fg_red}.${fg_green})%n${fg_normal}@%B%m%b [%6c]
(%!) %# "
# It looks best with white text on a black background.
# It has a green user, unless you're root, in which case the user is red.

# Remember the last 50 commands
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.history

# If you're on a Mac, source the fink init script
case `uname` in
Darwin)
	test -r /sw/bin/init.sh && . /sw/bin/init.sh
	;;
esac

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

#
# SETTING ALIASES
# 
# You can set aliases quite easily just by following the same format
# as the other commands use below. In case you need to know the format is
# alias new_command='old commands'

# If you do a lot of C compiling, this saves finger wear
# (Note that only one filename may be specified.)
# alias     C='gcc -o \!* \!*.c '
# alias     C++='g++ -o \!* \!*.[Cc]*[^~] '

# This is a _really_ handy alias.
# show / after directories, * after executables, etc.
alias     ls='ls -F --color=auto'
alias qwerty='screen -x mail'
alias zxcv='screen -x main'
alias asdfg='gcc -x c - && ./a.out && rm a.out'
# Useful commands made better (according to some) through alias:
# alias     mv='nocorrect mv -i'
# alias     cp='nocorrect cp -i'
# alias     rm='nocorrect rm -i'        # The nocorrect option keeps the zsh spell checker from 
# alias     mkdir='nocorrect mkdir'     # running on any of the arguments passed to the command.
# alias     man='nocorrect man'
# alias     ll='ls -l'
# alias     l.='ls -A'
# alias     sizeof='du -sh'     # Useful for checking the size of directories and regular files

# Double quotes enable variable interpolation
#alias       knuth="ssh ${USER}@knuth.cs.hmc.edu"
#alias       turing="ssh ${USER}@turing.cs.hmc.edu"
#alias       wilkes="ssh ${USER}@wilkes.cs.hmc.edu"
#alias       odin="ssh ${USER}@odin.ac.hmc.edu"

# Java Shortcuts
# alias     je=java
# alias     jx='javac \!$.java ; java \!$'
# alias     jc=~/bin/jc

# Load the zsh completion system
autoload -U compinit
compinit

bindkey -e

export EDITOR=emacs
stty stop undef
alias ack=ack-grep
