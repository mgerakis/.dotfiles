# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.
if [ -f ~/.aliases ]; then
    . ~/.aliases
fi

# Extra
# Anything that shouldn't be uploaded to git or is unnecessary for normal setups
if [ -f ~/.bash_extras ]; then
  . ~/.bash_extras
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm

force_color_prompt=yes

bind 'TAB:menu-complete'

. ~/.dotfiles/git-prompt.sh
. ~/.dotfiles/z/z.sh

export GIT_PS1_SHOWDIRTYSTATE=1
export PROMPT_DIRTRIM=1 # only show last 1 directories

PS1='\[\033[01;34m\]\w\[\033[00m\]$(__git_ps1 " git:\[\033[01;32m\]%s") \[\033[00m\]\$ '

tmux attach -t base || tmux new -s base
