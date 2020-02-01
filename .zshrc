# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH:$HOME/.zsh/pure
export FPATH="$HOME/.zsh/pure":$FPATH
# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
export GOROOT=/usr/local/go
export GOPATH=$HOME/go
export PATH=$GOPATH/bin:$GOROOT/bin:$PATH
export GOOGLE_APPLICATION_CREDENTIALS="$HOME/stakes-backend/cred.json"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="robbyrussell"
bindkey -v

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
alias vim=/usr/local/bin/vim
# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('$HOME/anaconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "$HOME/anaconda3/etc/profile.d/conda.sh" ]; then
        . "$HOME/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="$HOME/anaconda3/bin:$PATH"
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
alias pbcopy='xclip -selection clipboard' #I feel like a boof for doing this but damn I type  in pbcopy too much
alias pbpaste='xclip -selection clipboard -o'
alias pp='python -mjson.tool'
alias front='cd ~/stakes-frontend'
alias back='cd ~/stakes-backend'

