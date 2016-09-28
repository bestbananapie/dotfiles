# load zgen

source "${HOME}/.zgen/zgen.zsh"

source "${HOME}/.zsh/simon.zsh-theme"

# check if there's no init script
if ! zgen saved; then
    echo "Creating a zgen save"

    zgen oh-my-zsh

    #Plugings
        #Improve vi mode
        zgen oh-my-zsh plugins/vi-mode

        #Colored Man Pages
        zgen oh-my-zsh plugins/colored-man-pages

        # Syntax highlighting
        zgen load zsh-users/zsh-syntax-highlighting

        # Enhance terminal with 256 colors
        zgen load chrissicool/zsh-256color
        
        # Per directory history with ctrl G
        # Toggle between local and global history with <C-g>
        zgen load jimhester/per-directory-history

    # Auto completions plugins
        zgen oh-my-zsh plugins/gitfast #git
        zgen oh-my-zsh plugins/meteor #meteor
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
