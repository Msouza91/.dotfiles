[[ -e ~/.profile ]] && emulate sh -c 'source ~/.profile'
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

if [ -d "$HOME/.skim/bin/" ] ;
  then PATH="$HOME/.skim/bin/:$PATH"
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

export ASDF_DATA_DIR="$HOME/.asdf"
export PATH="${ASDF_DATA_DIR:-$HOME/.asdf}/shims:$PATH"

# Ubuntu
export SSH_AUTH_SOCK=~/.1password/agent.sock

# Doom
export PATH="$HOME/.config/emacs/bin/:$PATH"

# Omakub
export PATH="$HOME/.local/share/omakub/bin:$PATH"
export OMAKUB_PATH="$HOME/.local/share/omakub"

# 1password get opentofu password
#export tf_Password=$(op item get --fields label=password y3kmjzhxqi7nrz6onpgbi75eoq --reveal)
#export TF_ENCRYPTION=$(echo "key_provider \"pbkdf2\" \"password\" { passphrase = \""$tf_Password"\" }")


# Basic exports
export HISTCONTROL=ignoredups:erasedups		# no duplicate entries on history
export ZSH="$HOME/.oh-my-zsh"			# Path to your oh-my-zsh installation, have to install it first.
export PATH="$HOME/.cargo/bin:$PATH"		# Cargo in path
export PATH="$HOME/go/bin:$PATH"		# Cargo in path
export EDITOR='nvim'				# Set default editor
export QT_STYLE_OVERRIDE="kvantum"
## TMUX SESSION MANAGER

export MANPAGER="sh -c 'sed -u -e \"s/\\x1B\[[0-9;]*m//g; s/.\\x08//g\" | bat -p -lman'"

# ~/.tmux/plugins
export PATH=$HOME/.tmux/plugins/t-smart-tmux-session-manager/bin:$PATH
# ~/.config/tmux/plugins
export PATH=$HOME/.config/tmux/plugins/t-smart-tmux-session-manager/bin:$PATH

# LinuxBrew
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

# NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
