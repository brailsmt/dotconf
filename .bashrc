export EDITOR=nvim
export ECLIPSE_BASE=/opt/eclipse
export BREW_INST_BASE=$(brew --prefix)
export GIT_BASE=/usr/share/git-core
export HOMEBREW_GITHUB_API_TOKEN=f92c9db3aa6658ad4408ee8a4367331319074e80

export CLICOLOR=1

export PATH="$HOME/.local/bin:$HOME/.cabal/bin:$HOME/bin:$HOME/bin/jpr:$BREW_INST_BASE/opt/coreutils/libexec/gnubin:$BREW_INST_BASE/sbin:$BREW_INST_BASE/bin:$ECLIPSE_BASE:$PATH"

# source bash_completion
. $BREW_INST_BASE/etc/bash_completion
	
set -o vi
set completion-ignore-case on

shopt -s nocaseglob
shopt -s histappend
history -a
export HISTCONTROL=ignoredups
export HISTFILESIZE=5000000
export HISTSIZE=5000000

export GIT_PS1_SHOWDIRTYSTATE=true
export GIT_PS1_SHOWUNTRACKEDFILES=true
export GIT_PS1_SHOWUPSTREAM=verbose
export GIT_PS1_SHOWCOLORHINTS=true
if [ -f $HOME/.git-prompt.sh ]; then
    . $HOME/.git-prompt.sh
fi

# load $HOME/.bash_aliases
. $HOME/.bash_aliases

#export PS1="\u@\W \n\$ "
#export PS1='\t \w\n\u [\!] \$ '
#export PS1='\[\033[32m\]\u@\h\[\033[00m\]:\[\033[36m\]\w\[\033[31m\]$(__git_ps1) \[\033[00m\]\$ '
#export PS1='\[\033[32m\]\u@\h\[\033[00m\]:\[\033[36m\]\w\[\033[31m\]$(__git_ps1) \n\[\033[00m\][\t (\!)]\$ '

export LSCOLORS='fxgxBxBxCxegedabagacad'


# color escape sequences
export none='\[\033[0;00m\]'
export black='\[\033[0;30m\]'
export red='\[\033[0;31m\]'
export green='\[\033[0;32m\]'
export yellow='\[\033[0;33m\]'
export blue='\[\033[0;34m\]'
export magenta='\[\033[0;35m\]'
export cyan='\[\033[0;36m\]'
export white='\[\033[0;37m\]'
export bblack='\[\033[1;30m\]'
export bred='\[\033[1;31m\]'
export bgreen='\[\033[1;32m\]'
export byellow='\[\033[1;33m\]'
export bblue='\[\033[1;34m\]'
export bmagenta='\[\033[1;35m\]'
export bcyan='\[\033[1;36m\]'
export bwhite='\[\033[1;37m\]'

export PS1="${yellow}cwd: ${red}\w ${bcyan}\$(__git_ps1)\n${green}[${white}\D{%Y%m%d %T}${green}|${cyan}\u${green}]${white}\$ ${none}"

eval $(dircolors -b $HOME/.dircolors)


export MAVEN_OPTS='-Xmx2024m -Djava.net.preferIPv4Stack=true'
export JAVA_TOOL_OPTIONS='-Djava.awt.headless=true'

# Crawler related env vars
export CRAWLER_BASE=$HOME/dev/bin/crawler
export CRAWLER_HOME=$CRAWLER_BASE


# Source some useful bash functions
. $HOME/.bash_func.sh

# add fzf shell goodness
export FZF_DEFAULT_COMMAND='ag -t'
[ -f $HOME/.fzf.bash ] && source $HOME/.fzf.bash

# add fasd shell goodness
which fasd >/dev/null && eval "$(fasd --init auto)"

# Add command line directory bookmarks
export BOOKMARKS_FUZZY_COMPLETE=1
export BOOKMARKS_FUZZY_MENU=1
. $HOME/dev/brailsmt/directory_bookmarks/bin/bookmarks.sh

# Do some clide set up
export CLIDE_INSTALL_BASE=$HOME/dev/clide
export CLIDE_BIN=$CLIDE_INSTALL_BASE/bin:$PATH
export PATH=$CLIDE_INSTALL_BASE/bin:$PATH

# config to use the 'gist' cli command with cerner's github
export GITHUB_URL=https://github.cerner.com/

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

# needed for mono
export MONO_GAC_PREFIX="/usr/local"

# use directory based environment settings
source $HOME/dev/brailsmt/direnv/direnv
