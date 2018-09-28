#!/bin/bash

alias cd..='cd ..'
alias cddev='cd ~/dev'
alias ls='ls --color=auto'

alias ccat="source-highlight --out-format=esc -o STDOUT -i"

#maven aliases
alias deptree='~/bin/mkdeptree'
alias mvneclipse='mvn eclipse:eclipse'
alias mvne='mvn eclipse:eclipse'

alias vim='/usr/local/bin/nvim'
#alias vim='/usr/local/Cellar/neovim/0.1.7/bin/nvim'

# cd to ~/Downloads before starting mutt to ensure it saves attachments in ~/Downloads
#alias mutt='cd ~/Downloads/; mutt'
alias mutt='cd ~/Downloads/; /usr/local/bin/neomutt'

# some git aliases
alias gs='git status'
alias gco='fbr'
alias gpo='git push origin $(gb)'
alias gpof='git push origin $(gb) -f'
alias gpon='git push origin $(gb) -n'
alias gpofn='git push origin $(gb) -nf'

alias glog='git log --date-order --pretty="format:%C(yellow)%h%C(bold white)%d%Creset %s %C(dim white) %an, %ar%Creset"'
alias gl='glog --graph'
alias gdog='git log --all --decorate --oneline --graph'

# work with java 6
alias usej6='export JAVA_HOME=$(/usr/libexec/java_home -v 1.6); \
             export MVNCMD=/usr/local/Cellar/maven@3.1/3.1.1/bin/mvn; \
             alias mvn="/usr/local/Cellar/maven@3.1/3.1.1/bin/mvn"'

# work with java 8
alias usej8='export JAVA_HOME=$(/usr/libexec/java_home -v 1.8); \
             export MVNCMD=/usr/local/bin/mvn; \
             alias mvn="/usr/local/bin/mvn"'

alias mvn='jpm'
