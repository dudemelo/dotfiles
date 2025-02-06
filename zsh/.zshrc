# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH
export PATH="$PATH:/opt/nvim-linux-x86_64/bin:/usr/local/go/bin:/home/jfmelo/.local/bin:/home/jfmelo/.cargo/env"

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="gozilla"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
HIST_STAMPS="%d/%m/%y %T"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder
ZSH_CUSTOM=/home/jfmelo/Projects/dotfiles/oh-my-zsh

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git pj zsh-syntax-highlighting timer)
PROJECT_PATHS=(~/Projects ~/scribbr)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
#alias npm='docker run -it --name npm --rm -v $PWD:/app -w /app -e HOME=/app -p 3000:3000 node:14 npm'
#alias npm-lts='docker run -it --name npm --rm -v $PWD:/app -w /app -e HOME=/app -p 3000:3000 node:lts npm'
#alias npx='docker run -it --name npx --rm -v $PWD:/app -w /app -e HOME=/app node:15 npx'
#alias npx-lts='docker run -it --rm -v $PWD:/app -w /app -e HOME=/app -p 8545:8545 node:lts npx'
#alias node='docker run -it --rm -v $PWD:/app -w /app -e HOME=/app -p 8545:8545 node:latest node'
#alias node-lts='docker run -it --rm -v $PWD:/app -w /app -e HOME=/app -p 8545:8545 node:lts node'
#alias yarn='docker run -it --name yarn --rm -v $PWD:/app -w /app -e HOME=/app -p 1337:1337 node:15 yarn'
#alias yarn='docker run -it --name yarn --rm -v $PWD:/app -w /app -e HOME=/app -p 1337:1337 node:15 yarn'
#alias yarn='docker run -it --name yarn --rm -v $PWD:/app -w /app -e HOME=/app -p 1337:1337 node:lts yarn'
#alias composer='docker run -it --name composer --rm -v $PWD:/app -w /app -e HOME=/app composer composer'
#alias php='docker run --name php --rm -v $PWD:/var/www -p 8080:8080 -w /var/www php:8-alpine php'
alias pypy='docker run --name pypy --rm -v $PWD:/var/www -p 8080:8080 -w /var/www pypy:slim pypy'
alias composer1='docker run -it --name composer --rm -v $PWD:/app -w /app -e HOME=/app composer composer'
alias terraform='docker run --rm -it -v $HOME/.ssh:/root/.ssh -v $HOME/.aws:/root/.aws -v $PWD:/var/www -w /var/www hashicorp/terraform:latest'
alias eth='docker run -it --rm -v $PWD:/share trailofbits/eth-security-toolbox'
alias bettercap='sudo docker run --rm -it --privileged --net=host -p 80:80 -p 8081:8081  bettercap/bettercap bettercap'
alias mysql='docker run --rm -it --privileged --net=host -v $PWD:/var/www -w /var/www mysql mysql'
alias postgres='docker run --rm -it --privileged --net=host -v $PWD:/var/www -w /var/www postgres:alpine psql'
alias mysqldump='docker run --rm -it --privileged --net=host -v $PWD:/var/www -w /var/www mysql mysqldump'
alias redis-cli='docker run --rm -it --privileged --net=host -v $PWD:/var/www -w /var/www redis:alpine redis-cli'
alias ds='docker compose'
alias v='nvim .'
alias tf='terraform'
alias dit='docker exec -it'
alias ditu='docker exec -itu root'
alias gooff='nvidia-settings --assign="CurrentMetaMode=DPY-0: nvidia-auto-select @2560x1080 +0+0 {ViewPortIn=2560x1080, ViewPortOut=2560x1080+0+0}" && sleep 2 && xrandr --output eDP-1-1 --auto --primary --right-of HDMI-0 && sleep 2 && nitrogen --restore'
alias golive='nvidia-settings --assign="CurrentMetaMode=DPY-0: 1920x1080 @1920x1080 +640+0 {ViewPortIn=1920x1080, ViewPortOut=1920x1080+0+0}" && sleep 2 && xrandr --output eDP-1-1 --auto --primary --right-of HDMI-0 && sleep 2 && nitrogen --restore'
alias fixdirchmod='sudo chown $USER . -Rf; find . -type d -exec chmod 755 {} +; find . -type f -exec chmod 644 {} +;'
alias ssh='env TERM=xterm-256color ssh'
alias copy='xclip -sel clip'
alias ab='docker run --rm -it --net=host -v $PWD:/var/www -w /var/www httpd:alpine ab'
alias dotnet='docker run -it -v $PWD:/var/www -w /var/www --rm -p 8000:8080 mcr.microsoft.com/dotnet/sdk:8.0 dotnet'
alias up='sudo apt update; sudo apt dist-upgrade; sudo apt autoremove; sudo apt autoclean; sudo apt remove; sudo apt clean'

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export XDG_CURRENT_DESKTOP=sway
export CPLUS_INCLUDE_PATH=/usr/include/c++/11:/usr/include/x86_64-linux-gnu/c++/11
