#!/usr/bin/env bash

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

# starship
eval "$(starship init zsh)"

# poetry
export PATH="$HOME/.local/bin:$PATH"

# anaconad
# export PATH="/opt/anaconda/bin:$PATH"  # commented out by conda initialize

# pyenv
export PATH="$HOME/.pyenv/bin:$PATH"
eval "$(pyenv init --path)"
eval "$(pyenv init -)"

SPACESHIP_PROMPT_ORDER=(
  user          # Username section
  dir           # Current directory section
  host          # Hostname section
  git           # Git section (git_branch + git_status)
  hg            # Mercurial section (hg_branch  + hg_status)
  exec_time     # Execution time
  line_sep      # Line break
  jobs          # Background jobs indicator
  exit_code     # Exit code section
  char          # Prompt character
)
SPACESHIP_USER_SHOW=always
SPACESHIP_PROMPT_ADD_NEWLINE=false
SPACESHIP_CHAR_SYMBOL="❯"
SPACESHIP_CHAR_SUFFIX=" "


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
#zinit light zsh-users/zsh-completion

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

alias gamingmode="source gamingmode.sh" 
alias focusmode="source focusmode.sh"

alias change-zsh="code ~/.zshrc"
alias update-zsh="source ~/.zshrc"

alias update="yay -Syyu"

alias ll='colorls --group-directories-first --almost-all --long'
alias l='colorls --group-directories-first --almost-all'

alias mirrors="sudo reflector --verbose --latest 10 --sort rate --save /etc/pacman.d/mirrorlist"
alias mirrors-br="sudo reflector --verbose --country Brazil --sort rate --save /etc/pacman.d/mirrorlist"

alias computer-vision="conda activate computer-vision"
alias automizei="conda activate automizei"
alias farmgo-vision="conda activate farmgo-vision"
alias conda-envs="conda info --envs"
alias deactivate="conda deactivate"
# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/opt/anaconda/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/opt/anaconda/etc/profile.d/conda.sh" ]; then
        . "/opt/anaconda/etc/profile.d/conda.sh"
    else
        export PATH="/opt/anaconda/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

