# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=/Users/law/.oh-my-zsh

DEFAULT_USER=$USER
prompt_context() {}

ZSH_THEME="agnoster"

plugins=(git zsh-autosuggestions z kubectl minikube docker docker-compose)

# This needs to be before oh-my-zsh is sourced. Fixes slow pasting.
DISABLE_MAGIC_FUNCTIONS=true

source $ZSH/oh-my-zsh.sh

export SSH_KEY_PATH="~/.ssh/rsa_id"

source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source <(doctl completion zsh)

export GOPATH="$HOME/repos/go"

alias cl=clear
alias cdl='cd && clear'
alias py=python3
alias ws='work-log.sh START'
alias we='work-log.sh STOP'
alias wh='py /usr/local/bin/work-log-parse.py'
alias wl='less ~/.work.log'
alias vim="nvim"
alias ktldr='py ~/repos/ktldr/ktldr.py /Volumes/Kindle ~/drive/reading/book-tldrs'
alias docker-delete-all='docker rm $(docker ps -aq)'
alias docker-stop-all='docker stop $(docker ps -aq)'
alias docker-stop-last='docker stop $(docker ps -aq | head -n 1)'
alias helm-delete-all='helm delete $(helm ls --short) --purge'
eval $(thefuck --alias)
alias dotfiles='/usr/bin/git --git-dir=/Users/law/.dotfiles/ --work-tree=/Users/law'
alias delete-all-droplets='doctl compute droplet delete --force $(doctl compute droplet list --format="ID" --no-header)'
