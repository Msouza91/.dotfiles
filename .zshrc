# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

### EXPORTS ###

export HISTCONTROL=ignoredups:erasedups		# no duplicate entries
export ZSH="$HOME/.oh-my-zsh"			# Path to your oh-my-zsh installation.
export PATH="$HOME/.local/bin:$PATH"		# Include home local bin
export PATH="$HOME/.cargo/bin:$PATH"		# Cargo in path
export EDITOR='nvim'				# Set default editor
export QT_STYLE_OVERRIDE="kvantum"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="spaceship"

### PATH
if [ -d "$HOME/.bin" ] ;
  then PATH="$HOME/.bin:$PATH"
fi

if [ -d "$HOME/.local/bin" ] ;
  then PATH="$HOME/.local/bin:$PATH"
fi

if [ -d "/var/lib/flatpak/exports/bin/" ] ;
  then PATH="/var/lib/flatpak/exports/bin/:$PATH"
fi

### SETTING OTHER ENVIRONMENT VARIABLES
if [ -z "$XDG_CONFIG_HOME" ] ; then
    export XDG_CONFIG_HOME="$HOME/.config"
fi
if [ -z "$XDG_DATA_HOME" ] ; then
    export XDG_DATA_HOME="$HOME/.local/share"
fi
if [ -z "$XDG_CACHE_HOME" ] ; then
    export XDG_CACHE_HOME="$HOME/.cache"
fi


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
 zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
 ENABLE_CORRECTION="false"

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
plugins=(
    git 
    asdf 
    kubectl 
    zsh-autosuggestions
    zsh-syntax-highlighting
    )

source $ZSH/oh-my-zsh.sh

# Install asdf
. $HOME/.asdf/asdf.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#

 alias zshconfig="vim ~/.zshrc"
 alias ohmyzsh="vim ~/.oh-my-zsh"
 alias tf="terraform"
 alias vim="nvim"

 # Copilot CLI
alias copilot='gh copilot'
alias gcs='gh copilot suggest'
alias gce='gh copilot explain'

 
# Changing "ls" to "eza"
 alias ls='eza -al --color=always --group-directories-first' # my preferred listing
 alias la='eza -a --color=always --group-directories-first'  # all files and dirs
 alias ll='eza -l --color=always --group-directories-first'  # long format
 alias lt='eza -aT --color=always --group-directories-first' # tree listing
 alias l.='eza -a | egrep "^\."'

# Colorize grep output (good for log files)
 alias grep='grep --color=auto'
 alias egrep='egrep --color=auto'
 alias fgrep='fgrep --color=auto'

# git
 alias addup='git add -u'
 alias addall='git add .'
 alias branch='git branch'
 alias checkout='git checkout'
 alias clone='git clone'
 alias commit='git commit -m'
 alias fetch='git fetch'
 alias pull='git pull origin'
 alias push='git push origin'
 alias stat='git status'  # 'status' is protected name so using 'stat' instead
 alias tag='git tag'
 alias newtag='git tag -a'
 alias uncommit='git reset --soft HEAD~1'

# tmux session
alias tms='tmux-sessionizer'


export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Activate zoxide
eval "$(zoxide init zsh)"
# Activate SSH-Agent
{eval "$(ssh-agent) && ssh-add ~/.ssh/id_ed25519"} &> /dev/null

# Start tmux
if command -v tmux &> /dev/null && [ -n "$PS1" ] && [[ ! "$TERM" =~ screen ]] && [[ ! "$TERM" =~ tmux ]] && [ -z "$TMUX" ]; then
  tmux a -t default || exec tmux new -s default && exit;
fi

#colorscript
colorscript random
