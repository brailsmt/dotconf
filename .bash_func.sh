#!/bin/bash

swapVersions() {
    if [ $# -ne 2 ]
    then
        echo "Usage: swapVersions <oldVersion> <newVersion>"
    else
        find . -name pom.xml -exec sed -i.orig "s/$1/$2/g" {} \;
    fi
}

gb() {
    git rev-parse --abbrev-ref HEAD
}

# Join a list with a separator
#  Usage:
#    join : $(find target/dependency -name *.jar)
join() {
    local IFS="$1"
    shift
    echo "$*"
}

# fbr() {
#   local branches branch
#   branches=$(git branch -vv) &&
#   branch=$(echo "$branches" | fzf +m) &&
#   git checkout $(echo "$branch" | awk '{print $1}' | sed "s/.* //")
# }

# fbr - checkout git branch (including remote branches)
fbr() {
    local branches branch
    branches=$(git branch --all | grep -v HEAD) \
        && branch=$(echo "$branches" | fzf-tmux -d $(( 2 + $(wc -l <<< "$branches") )) +m) \
        && git checkout $(echo "$branch" | sed "s/.* //" | sed "s#remotes/[^/]*/##")
}

_fzf_git_branch_complete() {
  local prev cur
  prev=${COMP_WORDS[$COMP_CWORD-1]}

  case $prev in 
      checkout)
          cur=${COMP_WORDS[$COMP_CWORD]}
          COMPREPLY=($(git for-each-ref --format='%(refname:short)' refs/heads/ | fzf --ansi -f $cur | tr '\n' ' '))
          ;;
      *)
          __git_wrap__gitk_main $@
          ;;
  esac
  return 0
}
complete -F _fzf_git_branch_complete git

fhist() {
    history | fzf --tac --no-sort | gsed 's/^\([0-9][0-9]*\)\s\s*\(.*\)/\2 #\1/' | pbcopy
}

shrug() {
    echo -n '¯\_(ツ)_/¯' | pbcopy
}
