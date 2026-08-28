export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="dwaynemac"

DISABLE_AUTO_TITLE="true"
COMPLETION_WAITING_DOTS="true"

plugins=(git git-flow-avh rbenv ruby rails bundler alias-finder macos rake rake-fast asdf autojump)

alias pwdcp="pwd | pbcopy"
alias vim="nvim"

alias nolidsleep="sudo pmset -a disablesleep 1"
alias lidsleepnormal="sudo pmset -a disablesleep 0"

precmd() {
  echo -ne "\e]1;${PWD##*/}\a"
}

source "$ZSH/oh-my-zsh.sh"

export EDITOR="vim"
export HISTSIZE=100000
export SAVEHIST=100000
export HISTFILE="$HOME/.zhistory"

export PATH="$HOME/.local/bin:/opt/homebrew/bin:$PATH"

eval "$(rbenv init -)"

# >>> railway initialize >>>
source "$HOME/.railway/env"
# <<< railway initialize <<<
#
# The following lines have been added by Docker Desktop to enable Docker CLI completions.
fpath=(/Users/dwaynemac/.docker/completions $fpath)
autoload -Uz compinit
compinit
# End of Docker CLI completions
