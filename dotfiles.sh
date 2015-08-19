#!/bin/sh

echo "$1"

if [ "$#" -eq 0 ] ;  then
	echo "Help"

elif [ "$1" = "update" ] || ["$1" = "-u"] ; then

  if [ -d ~/.vim/bundle/Vundle.vim ] ; then
    echo "Running Updater on Vundle"
    cd ~/.vim/bundle/Vundle.vim
    git pull
  else
    echo "Please Install First"
  fi

  if [ -d ~/.zgen ] ; then
    echo "Running Updater on zgen"
    cd ${HOME}/.zgen
    git pull
    zgen update
  else
    echo "Please Install First"
  fi

elif [ "$1" = "install" ] || ["$1" = "-i"] ; then
## Git Repos
  git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
  git clone https://github.com/tarjoilija/zgen ${HOME}/.zgen

	ln -s -v ${HOME}/dotfiles/tmux.conf ~/.tmux.conf
	ln -s -v ${HOME}/dotfiles/vimrc     ~/.vimrc
	ln -s -v ${HOME}/dotfiles/gitconfig ~/.gitconfig
	ln -s -v ${HOME}/dotfiles/npmrc     ~/.npmrc

  mkdir -p ~/.i3
	ln -s -v ${HOME}/dotfiles/i3.config ~/.i3/config

	ln -s -v ~/dotfiles/zshrc     ~/.zshrc


	mkdir ~/.vim/colors
	ln -s -v ~/dotfiles/molokai.vim  ~/.vim/colors/molokai.vim


elif [ "$1" = "remove" ] || [ "$1" = "-r"] ; then
	rm -i ~/.tmux.conf
	rm -i ~/.vimrc
	rm -i ~/.gitconfig
  rm -i ~/.vim/colors/molokai.vim
	rm -i ~/.zshrc

	rm -ri ~/.zgen
	rm -ri ~/.vim/bundle/Vundle.vim

else

	echo "Help!"

fi
