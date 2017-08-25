# Oh-my-zsh installation
export ZSH=$HOME/.oh-my-zsh

# Oh-my-zsh theme
ZSH_THEME="awesomepanda"

# Aliases
alias .....="cd ../../../../"
alias ....="cd ../../../../"
alias ...="cd ../../../"
alias ..="cd .."
alias .4="cd ../../../../"
alias .5="cd ../../../../.."
alias bc="bc -l"
alias cd..="cd .."
alias cd..='cd ..'
alias egrep="egrep --color=auto"
alias fastping="ping -c 100 -s.2"
alias fgrep="fgrep --color=auto"
alias grep="grep --color=auto"
alias l.="ls -d .* --color=auto"
alias la="ls -aF"
alias ld="ls -ld"
alias less="less -R"
alias ll="ls -la"
alias ls="ls --color=auto"
alias mkdir="mkdir -pv"
alias more="more -R"
alias mount="mount |column -t"
alias path="echo $PATH | tr ':' '\n' | nl"
alias ping="ping -c 5"
alias ports="netstat -tulanp"
alias sha1="openssl sha1"
alias wget="wget -c"
alias zgrep="zgrep --color=auto"

# Specific aliases
case "$(uname)" in
  Linux)
    # Configurations
    TERM=xterm-256color

    alias f5="sudo apt-get -y update && \
              sudo apt-get -y upgrade && \
              sudo apt-get -y dist-upgrade && \
              sudo apt-get -y autoremove && \
              sudo apt-get -y clean all && \
              cd ~/.dotfiles && \
              git pull-sub && \
              source ~/.zshrc"
    ;;
  Darwin)
    alias f5="brew update && \
              brew upgrade && \
              brew cu --all --yes && \
              brew cleanup && \
              brew prune && \
              brew cask cleanup && \
              cd ~/.dotfiles && \
              git pull-sub && \
              source ~/.zshrc"

    export PATH="/usr/local/opt/curl/bin:$PATH"
    ;;
esac

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to disable command auto-correction.
# DISABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
HIST_STAMPS="dd/mm/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Oh-my-zsh plugins
plugins=(
  docker
  docker-compose
  node
  npm
  nvm
  osx
  postgres
  redis-cli
  ssh-agent
  sublime
  ubuntu
  vagrant
  yarn
)

source $ZSH/oh-my-zsh.sh

# Language environment
export LANG=pt_BR.UTF-8

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
