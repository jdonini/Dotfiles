export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="avit"

plugins=(
  poetry
  git
)

source $ZSH/oh-my-zsh.sh

prompt_context(){}

# npm
export PATH=~/.npm-global/bin:$PATH

# poetry
export PATH="$HOME/.local/bin:$PATH"

# pyenv
export PATH="$HOME/.pyenv/bin:$PATH"
eval "$(pyenv init --path)"
eval "$(pyenv init -)"

### Added by Zinit's installer
if [[ ! -f $HOME/.local/share/zinit/zinit.git/zinit.zsh ]]; then
    print -P "%F{33} %F{220}Installing %F{33}ZDHARMA-CONTINUUM%F{220} Initiative Plugin Manager (%F{33}zdharma-continuum/zinit%F{220})…%f"
    command mkdir -p "$HOME/.local/share/zinit" && command chmod g-rwX "$HOME/.local/share/zinit"
    command git clone https://github.com/zdharma-continuum/zinit "$HOME/.local/share/zinit/zinit.git" && \
        print -P "%F{33} %F{34}Installation successful.%f%b" || \
        print -P "%F{160} The clone has failed.%f%b"
fi

source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# Load a few important annexes, without Turbo
# (this is currently required for annexes)
zinit light-mode for \
    zdharma-continuum/zinit-annex-as-monitor \
    zdharma-continuum/zinit-annex-bin-gem-node \
    zdharma-continuum/zinit-annex-patch-dl \
    zdharma-continuum/zinit-annex-rust

### End of Zinit's installer chunk

zinit light zdharma/fast-syntax-highlighting
zinit light zsh-users/zsh-autosuggestions
zinit light zsh-users/zsh-completion

alias farmgo-web-build='$HOME/Workspace/farmgo-web; docker-compose up --build'
alias farmgo-web-up='$HOME/Workspace/farmgo-web; docker-compose up'
alias farmgo-web-down='$HOME/Workspace/farmgo-web; docker-compose down'
alias farmgo-web-clean='$HOME/Workspace/farmgo-web; docker-compose exec web python manage.py clean'

alias farmgo-image-service-build='$HOME/Workspace/farmgo-image-service; docker-compose up --build'
alias farmgo-image-service-up='$HOME/Workspace/farmgo-image-service; docker-compose up'
alias farmgo-image-service-down='$HOME/Workspace/farmgo-image-service; docker-compose down'
alias farmgo-image-service-clean='$HOME/Workspace/farmgo-image-service; docker-compose exec web python manage.py clean'
alias farmgo-image-service-migration='$HOME/Workspace/farmgo-image-service; docker-compose exec web python manage.py db upgrade'
alias farmgo-image-service-testu='$HOME/Workspace/farmgo-image-service; docker-compose exec web python manage.py testu'
alias farmgo-image-service-testi='$HOME/Workspace/farmgo-image-service; docker-compose exec web python manage.py testi'
alias farmgo-image-service-testf='$HOME/Workspace/farmgo-image-service; docker-compose exec web python manage.py testf'
alias farmgo-image-service-covu='$HOME/Workspace/farmgo-image-service; docker-compose exec web python manage.py covu'
alias farmgo-image-service-covi='$HOME/Workspace/farmgo-image-service; docker-compose exec web python manage.py covi'

alias change-zsh="code ~/.zshrc"
alias update-zsh="source ~/.zshrc"

alias update="yay -Syyu"

alias ll='colorls --group-directories-first --almost-all --long'
alias l='colorls --group-directories-first --almost-all'
