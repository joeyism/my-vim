#!/bin/bash

##########################################################################
# COMMON
#
for f in ~/.bash_scripts/*; do source $f; done
alias :q=exit
alias ll="ls -lrth"
alias watchc="watch --color"
alias whatismyip="curl ifconfig.me"
alias whereami='printf "$(curl -s ifconfig.co/city), $(curl -s ifconfig.co/country) {$(curl -s curl ifconfig.me)}"'
alias copy="xclip -selection clipboard"
alias wut="fortune | cowsay | lolcat"
alias grep_cheat="curl cheat.sh/grep"
alias gohere='cd $HERE'
alias here='HERE=$(pwd)'
alias s='status'
mkcd(){
    mkdir $@
    cd $@
}
status(){
  task
  gitlist
}
cheat(){
    curl cheat.sh/$1
}
grep_code(){
    grep -rnw . -e "$@" --exclude-dir={node_modules,venv}
}
grep_code_filename(){
    grep -rnwl . -e "$@" --exclude-dir={node_modules,venv}
}
findfile(){
    find . -path ./node_modules -prune -o -name $1 -print
}
helpa(){
    cat ~/.bash_scripts/*${1}*.sh
}
senv(){
    set -a
    source $1
    set +a
}

##########################################################################
# BASH_ALIASES RELATED
#
alias sa="source ~/.bash_aliases"
alias realias="curl -X GET https://raw.githubusercontent.com/joeyism/.files/master/.bash_aliases > ~/.bash_aliases && source ~/.bash_aliases"
alias diffa="vimdiff <(curl -sL https://raw.githubusercontent.com/joeyism/.files/master/.bash_aliases) ~/.bash_aliases"
ea(){
    _check_no_args_quiet $1
    if [ $? == 1 ]; then
        vim ~/.bash_aliases
    else
        vim ~/.bash_scripts/$1
    fi
}
complete -W "$(ls ~/.bash_scripts/)" ea
updatea(){
    for file in $(git status --porcelain | awk 'match($1, "M"){print " " $2}')
    do
        git add $file
    done
    git commit -m "update"
    git push origin master
}

wgeturl(){
    url=$1
    _check_no_args_quiet
    if [ $? != 0 ]
    then
        read -p "url: " url
    fi
    filename=$(echo $url | tr "?" "\n" | head -n 1 | tr "/" "\n" | tail -n 1)
    wget "$url" -O $filename
}
