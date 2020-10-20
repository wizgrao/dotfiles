# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH:$HOME/.zsh/pure:$HOME/.local/bin
export FPATH="$HOME/.zsh/pure":$FPATH
# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
export GOROOT=/opt/brew/opt/go/libexec
export GOPATH=$HOME/go
export PATH=$GOPATH/bin:$GOROOT/bin:$PATH
export PATH=$HOME/flutter/bin:$PATH
export PATH=$HOME/flutter/bin/cache/dart-sdk/bin:$PATH
export PATH=/usr/local/anaconda3/bin/:$PATH
export PATH=/usr/local/anaconda3/bin/:$PATH
export PATH=/opt/brew/bin:$PATH
export PATH=$(npm bin -g):$PATH
export PATH=/Users/gaurav/.nimble/bin:$PATH
export GOOGLE_APPLICATION_CREDENTIALS="$HOME/stakes-backend/cred.json"
fpath+=('/Users/gaurav/.npm-global/lib/node_modules/pure-prompt/functions')

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME=""
bindkey -v


### Fix slowness of pastes with zsh-syntax-highlighting.zsh
pasteinit() {
  OLD_SELF_INSERT=${${(s.:.)widgets[self-insert]}[2,3]}
  zle -N self-insert url-quote-magic # I wonder if you'd need `.url-quote-magic`?
}

pastefinish() {
  zle -N self-insert $OLD_SELF_INSERT
}
zstyle :bracketed-paste-magic paste-init pasteinit
zstyle :bracketed-paste-magic paste-finish pastefinish
### Fix slowness of pastes
bindkey '^P' up-history
bindkey '^N' down-history
bindkey '^?' backward-delete-char
bindkey '^h' backward-delete-char
bindkey '^w' backward-kill-word
bindkey '^r' history-incremental-search-backward

function zle-line-init zle-keymap-select {
    VIM_PROMPT="%{$fg_bold[yellow]%} [% NORMAL]%  %{$reset_color%}"
    RPS1="${${KEYMAP/vicmd/$VIM_PROMPT}/(main|viins)/}$(git_custom_status) $EPS1"
}

zle -N zle-line-init
zle -N zle-keymap-select
export KEYTIMEOUT=1
alias blender=/Applications/Blender.app/Contents/MacOS/Blender
alias untar="tar -xvzf"
# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('$HOME/anaconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "$HOME/anaconda3/etc/profile.d/conda.sh" ]; then
# . "$HOME/anaconda3/etc/profile.d/conda.sh"  # commented out by conda initialize
    else
# export PATH="$HOME/anaconda3/bin:$PATH"  # commented out by conda initialize
    fi
fi
unset __conda_setup
plugins=(git thefuck vi-mode zsh-autosuggestions zsh-syntax-highlighting)
autoload -U promptinit; promptinit
prompt pure
source $ZSH/oh-my-zsh.sh
if [[ -n $SSH_CONNECTION ]]; then
   export EDITOR='vim'
else
  export EDITOR='vim'
fi
alias pp='python -mjson.tool'
alias front='cd ~/stakes-frontend'
alias back='cd ~/stakes-backend'
alias dims='sips -g pixelHeight -g pixelWidth'

# <<< conda init <<<

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/usr/local/anaconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/usr/local/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/usr/local/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/usr/local/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

