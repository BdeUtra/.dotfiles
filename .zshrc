# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="awesomepanda"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Uncomment this to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how often before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want to disable command autocorrection
# DISABLE_CORRECTION="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repositories much,
# much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment following line if you want to  shown in the command execution time stamp 
# in the history command output. The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|
# yyyy-mm-dd
# HIST_STAMPS="mm/dd/yyyy"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git tmux)

source $ZSH/oh-my-zsh.sh

# User configuration

export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/git/bin"
# export MANPATH="/usr/local/man:$MANPATH"

# # Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

[ -s $HOME/.nvm/nvm.sh ] && . $HOME/.nvm/nvm.sh # This loads NVM

alias vi='vim'

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

### Add Postgres.App
export PATH="/Applications/Postgres.app/Contents/Versions/9.3/bin:$PATH"

export PATH="/usr/local/bin:$PATH"
### Add sbin for rabbit
export PATH="/usr/local/sbin:$PATH"

### SELECTA on zsh
# By default, ^S freezes terminal output and ^Q resumes it. Disable that so
# that those keys can be used for other things.
unsetopt flowcontrol
# Run Selecta in the current working directory, appending the selected path, if
# any, to the current command.
function insert-selecta-path-in-command-line() {
    local selected_path
    # Print a newline or we'll clobber the old prompt.
    echo
    # Find the path; abort if the user doesn't select anything.
    selected_path=$(find * -type f | selecta) || return
    # Append the selection to the current command buffer.
    eval 'LBUFFER="$LBUFFER$selected_path"'
    # Redraw the prompt since Selecta has drawn several new lines of text.
    zle reset-prompt
}
# Create the zle widget
zle -N insert-selecta-path-in-command-line
# Bind the key to the newly created widget
bindkey "^S" "insert-selecta-path-in-command-line"


### function to move into proj directory
proj() {
    cd $(find ~/code -maxdepth 1 -type d | selecta)
}

### notify when something ends
alias notify="osascript -e 'display notification \"Done\" with title \"Done\"'"

### Androids
export PATH=${PATH}:/Users/bruno/Library/Android/sdk/platform-tools:/Users/bruno/Library/Android/sdk/tools:/Users/bruno/code/apache-ant-1.9.4/bin


# MacPorts Installer addition on 2015-11-30_at_12:00:27: adding an appropriate PATH variable for use with MacPorts.
export PATH="/opt/local/bin:/opt/local/sbin:$PATH"
# Finished adapting your PATH environment variable for use with MacPorts.

# Postgres
export PATH=/opt/local/lib/postgresql93/bin:$PATH

export PATH=/usr/local/bin:$PATH
export PATH=/opt/local/bin:$PATH
export PATH=/opt/local/Library/Frameworks/Python.framework/Versions/2.7/bin/:$PATH
source /server/apps/ometria.deployment/source/dev
ssh-add ~/.ssh/Ometria_Bastion_Bruno.pem 2>/dev/null

tossh() {
    ssh ec2-user@`ec2-ip $1`
}

# source secrets
source ~/.secrets

# VIRTUALENVWRAPPER

export WORKON_HOME=~/.virtualenvs
mkdir -p $WORKON_HOME
export VIRTUALENVWRAPPER_PYTHON=/opt/local/Library/Frameworks/Python.framework/Versions/2.7/bin/python
source /opt/local/Library/Frameworks/Python.framework/Versions/2.7/bin/virtualenvwrapper.sh
