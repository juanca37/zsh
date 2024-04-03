# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="avit"

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
# zstyle ':omz:update' mode auto      # update automatically without asking
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
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(zsh-interactive-cd  git vscode python aws kubectl kubectx docker ansible docker-compose git-prompt git-extras gitfast github gitignore jsontools macos pipenv magic-enter pipenv pylint terraform zsh-autosuggestions)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

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

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
### GLOBAL SETTINGS ###
export SYNGENTA_EMAIL=juan.carrasco@syngenta.com
alias reload-profile="source /Users/juancarrascoalonso/.zshrc"
alias edit-profile="sudo vim /Users/juancarrascoalonso/.zshrc"
x86(){
    arch -x86_64 $*
}

### HOMEBREW SETTINGS ###
export PATH="/usr/local/sbin:/opt/homebrew/bin:$PATH"
if type brew &>/dev/null; then
    FPATH=$(brew --prefix)/share/zsh/site-functions:$FPATH
    autoload -Uz compinit
    compinit
fi
### DOCKER SETTINGS ###
# alias docker-kill-all="docker rm $(docker ps -a -q)"
# alias docker-prune="docker system prune -a"
# alias docker-nuke="docker-stop-all && docker-kill-all && docker-prune"

### NODE & NVM SETTINGS ###
ulimit -n 4096

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

### PYTHON SETTINGS ###
export PATH="$HOME/.poetry/bin:$PATH"
export LDFLAGS="-L/usr/local/opt/openssl/lib"
export CPPFLAGS="-I/usr/local/opt/openssl/include"
export LDFLAGS="-L/usr/local/opt/openblas/lib"
export CPPFLAGS="-I/usr/local/opt/openblas/include"
# export OPENBLAS="$(brew --prefix openblas)"
export CC=/opt/homebrew/bin/gcc-11
# Pyenv
export PYENV_ROOT="$HOME/.pyenv"
if command -v pyenv 1>/dev/null 2>&1; then
    eval "$(pyenv init -)"
fi
# Pipenv
export PIPENV_PYTHON="$PYENV_ROOT/shims/python"
export PIPENV_VENV_IN_PROJECT="1"
pipenv-use(){
    pipenv install --dev --python $1
}
# Poetry
poetry-use(){
    LOC=$(pyenv which python)
    poetry env use $LOC
}


### GITHUB SETTINGS ###
# ssh key location: ~/.ssh/github

### AWS SETTINGS ###
export AWS_SDK_LOAD_CONFIG=1
alias open-aws="open ~/.aws"

destroy-aws-session() {
     unset AWS_ACCESS_KEY_ID
     unset AWS_SECRET_ACCESS_KEY
     unset AWS_SESSION_TOKEN
}

start-aws-session() {
     read "PROFILE_RESPONSE?Which profile would you like to start a session with: "
     read "MFA_RESPONSE?Please enter your MFA code: "
     PROFILE=$(curl -s "https://devops-api.syngenta-digital.com/team-onboarding/v1/profiles?user_name=$SYNGENTA_EMAIL&profile_name=$PROFILE_RESPONSE")
     echo $PROFILE
     echo https://devops-api.syngenta-digital.com/team-onboarding/v1/profiles?user_name=$SYNGENTA_EMAIL&profile_name=$PROFILE_RESPONSE
     ROLE_ARN=$(echo $PROFILE | jq -r ".role_arn")
     destroy-aws-session
     CREDENTIALS=
     export AWS_ACCESS_KEY_ID=$(echo $CREDENTIALS | jq -r ".AccessKeyId")
     export AWS_SECRET_ACCESS_KEY=$(echo $CREDENTIALS | jq -r ".SecretAccessKey")
     export AWS_SESSION_TOKEN=$(echo $CREDENTIALS | jq -r ".SessionToken")
     echo "You now have an active session with $PROFILE_RESPONSE 😊"
}

fdir() {
  cd $(fd --type directory $1 ~ | fzf)
}

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

alias docker-login-ecr="aws ecr get-login-password --region us-east-1 --profile strider| docker login --username AWS --password-stdin 984868136916.dkr.ecr.us-east-1.amazonaws.com"
alias python-tests="python3 -m pytest --cov-report term-missing --cov=src"
alias aws-local=aws --profile=dynamo-db-local --endpoint-url=http://localhost:8000
alias test-testmon="ptw -- --testmon --disable-pytest-warnings --durations=0"
alias test-all="python3 -m pytest --durations=0 --disable-pytest-warnings --cov-report term-missing:skip-covered --cov=src"
alias test-watch="ptw -- --disable-pytest-warnings"
alias zsh-config="nano ~/.zshrc"
alias cov-html="python3 -m coverage run --branch --source=src -m unittest discover && python3 -m coverage html"

# This is needed for the android app
export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools

# Created by `pipx` on 2024-04-02 15:10:52
export PATH="$PATH:$HOME/.local/bin"

