#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Customize to your needs...
export HISTSIZE=1000
export HISTFILE=~/.zsh_history
export SAVEHIST=1000
export XDG_CONFIG_HOME="$HOME/.config"
setopt INC_APPEND_HISTORY
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_REDUCE_BLANKS
setopt HIST_VERIFY
KEYTIMEOUT=1

export TERMINAL="termite"
export TERM=screen-256color-bce
#export TERM=screen-256color       # for a tmux -2 session (also for screen)

#zstyle ':completion:*:descriptions' format '%U%B%d%b%u' 
#zstyle ':completion:*:warnings' format '%BSorry, no matches for: %d%b'
#setopt correctall
setopt extendedglob
setopt clobber

eval `dircolors ~/.dircolors`
# zmodload -a colors
# zmodload -a autocomplete
alias fidis='ssh duc@fidis.epfl.ch -t zsh'
rsync_fidis() {
  rsync --bwlimit=10M -aP duc@fidis.epfl.ch:$1 $2
}
rsync_tofidis() {
  rsync --bwlimit=10M -aP $1 duc@fidis.epfl.ch:$2
}
alias from_fidis="noglob rsync_fidis"
alias to_fidis="noglob rsync_tofidis"
alias vitalit='ssh jduc@frt.el.vital-it.ch -t zsh'
alias lvgsrv1='ssh duc@lvgtools.epfl.ch -t zsh'
alias vitalitX='ssh jduc@frt.el.vital-it.ch -t zsh -Y'
alias marioX='ssh -X duc@ptbbpc1.epfl.ch -t zsh'
alias binarybox='ssh wes@binarybox.ch'
alias binaryboxX='ssh -Y wes@binarybox.ch'
alias mario='ssh duc@ptbbpc1.epfl.ch -t zsh'
alias len='wc -l'
alias refresh='source ~/.zshrc'
alias cpwd='pwd | xclip -sel clipboard'
alias untar="tar -xzf"
alias vpn_epfl="sudo openconnect -u duc vpn.epfl.ch"
alias to_samba="rsync --bwlimit=10MiB -aP --no-perms --no-group --no-owner"
alias vim="vim --servername VIM"
alias vim="nvim"
alias k="k -h"
alias glances="glances"
alias lynx="lynx -lss ~/.lynx.lss"
alias gitlog="git log --graph --abbrev-commit --decorate --date=relative"
alias gquick="gcalcli quick --calendar LVG"
alias xclip="xclip -sel clipboard"
alias lic="libreoffice --calc"
alias r="ranger"
alias t='task'
unalias cp

stty -ixon
bindkey -v #vim
bindkey "^?" backward-delete-char
bindkey '^R' history-incremental-search-backward
# history search bind k and j for VI mode
bindkey '^k' history-substring-search-up
bindkey '^j' history-substring-search-down
bindkey -M vicmd 'k' history-substring-search-up
bindkey -M vicmd 'j' history-substring-search-down
bindkey -s '^l' 'clear'  # garret shell correct clear
# bindkey '^[[A' history-substring-search-up
# bindkey '^[[B' history-substring-search-down

export PATH="/home/jduc/.local/bin/:/home/jduc/bin/:/home/jduc/scripts/python/:/home/jduc/scripts/bash/common:/home/jduc/.bash_scripts:/usr/local/bin:/usr/local/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/usr/bin/core_perl"

# CUDA
export PATH="$PATH:/opt/cuda/bin"
export LD_LIBRARY_PATH="/opt/cuda/extras/CUPTI/lib64:/opt/cuda/lib64/${LD_LIBRARY_PATH:+:${LD_LIBRARY_PATH}}"

# openssl
export LD_LIBRARY_PATH="/usr/lib/openssl-1.0:$LD_LIBRARY_PATH"

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='nvim'
else
  export EDITOR='nvim'
fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"
#

# virtualenv
# export WORKON_HOME=$HOME/.virtualenvs
#export PROJECT_HOME=$HOME/Devel
# source /usr/bin/virtualenvwrapper.sh

# Perl things for scripts
PERL_MB_OPT="--install_base \"/home/jduc/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/home/jduc/perl5"; export PERL_MM_OPT;


# FZF fuzzy file finder
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_COMMAND='ag -g ""'

fe() {
  local file
  file=$(fzf-tmux --query="$1" --select-1 --exit-0)
  [ -n "$file" ] && ${EDITOR:-vim} "$file"
}

#Dasht
fpath=("/home/jduc/.config/dasht_completion/dasht/etc/zsh/completions" $fpath)

# Hommer path
PATH=$PATH:/home/jduc/builds/homer/.//bin/
# Ruby path
PATH="$(ruby -e 'print Gem.user_dir')/bin:$PATH"

# Keychain
eval $(keychain --eval --quiet id_rsa)

# Hook to ls after cd
chpwd() {
  ls
}
