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
    zgen oh-my-zsh plugins/dirhistory
    zgen oh-my-zsh plugins/per-directory-history
    zgen oh-my-zsh plugins/vi-mode
    zgen load zsh-users/zsh-syntax-highlighting

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


NPM_PACKAGES="${HOME}/.npm-packages"
NODE_PATH="$NPM_PACKAGES/lib/node_modules:$NODE_PATH"
PATH="$NPM_PACKAGES/bin:$PATH"

#bindkey '^F' vi-forward-word

#Local zshrc that is not in repo
if [[ -s "${ZDOTDIR:-$HOME}/.zshrc.local" ]]; then
  source "${ZDOTDIR:-$HOME}/.zshrc.local"
fi
