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

export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init - zsh)"

export PATH="$PATH:$HOME/.composer/vendor/bin"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
fvim() {
  files=$(git ls-files) &&
  selected_files=$(echo "$files" | fzf -m --preview 'head -100 {}') &&
  vim $selected_files
}
