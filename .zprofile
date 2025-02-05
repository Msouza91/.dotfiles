# Setting up basic paths
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


# Basic exports
export HISTCONTROL=ignoredups:erasedups		# no duplicate entries on history
export ZSH="$HOME/.oh-my-zsh"			# Path to your oh-my-zsh installation, have to install it first.
export PATH="$HOME/.cargo/bin:$PATH"		# Cargo in path
export PATH="$HOME/go/bin:$PATH"		# Cargo in path
export EDITOR='nvim'				# Set default editor
export QT_STYLE_OVERRIDE="kvantum"
## TMUX SESSION MANAGER

# ~/.tmux/plugins
export PATH=$HOME/.tmux/plugins/t-smart-tmux-session-manager/bin:$PATH
# ~/.config/tmux/plugins
export PATH=$HOME/.config/tmux/plugins/t-smart-tmux-session-manager/bin:$PATH

# brew path
eval "$(/opt/homebrew/bin/brew shellenv)"

# 1password get opentofu password
export tf_Password=$(op item get --fields label=password y3kmjzhxqi7nrz6onpgbi75eoq --reveal)
export TF_ENCRYPTION=$(echo "key_provider \"pbkdf2\" \"password\" { passphrase = \""$tf_Password"\" }")

# NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Added by OrbStack: command-line tools and integration
# This won't be added again if you remove it.
source ~/.orbstack/shell/init.zsh 2>/dev/null || :
