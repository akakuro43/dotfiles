#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Customize to your needs...

alias vim='nvim'
alias mkdir='(){mkdir $1;cd $1}'
alias gitlog='git log --color | fzf --ansi'

export EDITOR="vim"

export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init - zsh)"

export PATH="$PATH:$HOME/.composer/vendor/bin"
export GOPATH=$(go env GOPATH)
export PATH=$PATH:$GOPATH/bin

export PATH=/usr/local/bin:$PATH

eval "$(nodenv init -)"

# fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
fvim() {
  files=$(git ls-files) &&
  selected_files=$(echo "$files" | fzf -m --preview 'head -100 {}') &&
  vim $selected_files
}

fd() {
  local dir
  dir=$(find ${1:-.} -path '*/\.*' -prune \
                     -o -type d -print 2> /dev/null | fzf +m) &&
  cd "$dir"
}

# peco
bindkey '^]' peco-src
function peco-src() {
  local src=$(ghq list --full-path | peco --query "$LBUFFER")
  if [ -n "$src" ]; then
    BUFFER="cd $src"
    zle accept-line
  fi
  zle -R -c
}
zle -N peco-src
export PATH="/usr/local/opt/openjdk/bin:$PATH"
