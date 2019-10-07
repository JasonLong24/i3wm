# Inspired from: https://github.com/wincent/wincent/blob/master/roles/dotfiles/files/.zsh/hash
() {
  local SITE=/var/www/html
  local PASTE=~/git/paste-light
  local SERAPE=~/.vim/plugged/vim-serape
  local i3wm=~/i3wm
  local ZSH=~/i3wm/zsh
  local VIM=~/i3wm/vim
  local GIT=~/git

  test -d "$SITE" && hash -d site="$SITE"
  test -d "$PASTE" && hash -d paste="$PASTE"
  test -d "$SERAPE" && hash -d serape="$SERAPE"
  test -d "$i3wm" && hash -d i3="$i3wm"
  test -d "$i3wm" && hash -d i3wm="$i3wm"
  test -d "$ZSH" && hash -d zsh="$ZSH"
  test -d "$VIM" && hash -d vim="$VIM"
  test -d "$GIT" && hash -d git="$GIT"
}

# Quickly skim through all child directories and put them into std out
#
# Note: programs like ag and rg should probably be used here but they
#       both require you to install something
function fd() {
  local DIR="$1"
  [ -z $DIR ] && DIR="."
  find . -type d | grep $DIR
}

# Jump to a directory via hash
function jump() {
  emulate -L zsh

  if [ $# -eq 0 ]; then
    local DIR_FD=$(fd | fzf)

    # If it is empty assume the command was cancelled
    [ -z $DIR_FD ] && return 1
    cd $DIR_FD
  else

    if [ $1 = "-l" ] || [ $1 = "--list" ]; then
      hash -d | sed 's/=/ -> /g' | column -t  && return 1
    fi

    local DIR="$1"
    if [ $(hash -d|cut -d= -f1|grep -c "^${DIR}\$") = 0 ]; then
      local DIR_FD=$(fd $1)

      # Check that fd actually found something
      [ -z $DIR_FD ] && echo "$1 not found anywhere" && return 1
      cd $(echo $DIR_FD | fzf)
    else
      cd ~"$DIR"
    fi
  fi
}
