# load zgen

source "${HOME}/.zgen/zgen.zsh"

source "${HOME}/dotfiles/simon.zsh-theme"

# check if there's no init script
if ! zgen saved; then
    echo "Creating a zgen save"

    zgen oh-my-zsh

    # plugins
    zgen oh-my-zsh plugins/git
    zgen oh-my-zsh plugins/sudo
    zgen oh-my-zsh plugins/command-not-found
    zgen oh-my-zsh plugins/gitfast
    zgen oh-my-zsh plugins/meteor
    zgen load zsh-users/zsh-syntax-highlighting
    #zgen load zsh-users/zsh-history-substring-search
    #zgen load tarruda/zsh-autosuggestions

    # completions
    zgen load zsh-users/zsh-completions src

    # save all to init script
    zgen save
fi

bindkey -v

export EDITOR='vim'
export PAGER='less'

path=(
  /usr/local/{bin,sbin}
  $path
)


alias tmux="tmux -2"
#export TERM=xterm-256color
#
NPM_PACKAGES="${HOME}/.npm-packages"
NODE_PATH="$NPM_PACKAGES/lib/node_modules:$NODE_PATH"
PATH="$NPM_PACKAGES/bin:$PATH"

#zmodload zsh/terminfo
#bindkey "$terminfo[kcuu1]" history-substring-search-up
#bindkey "$terminfo[kcud1]" history-substring-search-down

#zle-line-init() {
#  zle autosuggest-start
#}
#zle -N zle-line-init

#bindkey '^F' vi-forward-word

#Local zshrc that is not in repo
if [[ -s "${ZDOTDIR:-$HOME}/.zshrc.local" ]]; then
  source "${ZDOTDIR:-$HOME}/.zshrc.local"
fi
