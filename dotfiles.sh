#!/bin/sh
echo "$1"
if [ "$#" -eq 0 ] ;  then
	echo "Help"
elif [ "$1" = "install" ] || ["$1" = "-i"] ; then
  if [ -d ~/.vim/bundle/Vundle.vim ] ; then
    echo "Running Updater on Vundle"
    cd ~/.vim/bundle/Vundle.vim
    git pull
  else
    git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
  fi

  if [ -d ~/.zprezto ] ; then
    echo "Running Updater on zPrezto"
    cd ~/.zprezto
    git pull
  else
    git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"
  fi

	ln -s -v ~/dotfiles/tmux.conf ~/.tmux.conf
	ln -s -v ~/dotfiles/vimrc  ~/.vimrc
	ln -s -v ~/dotfiles/gitconfig  ~/.gitconfig

  	mkdir ~/.vim/colors
	ln -s -v ~/dotfiles/molokai.vim  ~/.vim/colors/molokai.vim

  	ln -s -v ~/dotfiles/zprezto/prompt_adam3_setup ~/.zprezto/modules/prompt/functions/
	ln -s -v ~/dotfiles/zprezto/zshenv ~/.zshenv
	ln -s -v ~/dotfiles/zprezto/zshrc ~/.zshrc
	ln -s -v ~/dotfiles/zprezto/zprofile ~/.zprofile
	ln -s -v ~/dotfiles/zprezto/zpreztorc ~/.zpreztorc
	ln -s -v ~/dotfiles/zprezto/zlogin ~/.zlogin
	ln -s -v ~/dotfiles/zprezto/zlogout ~/.zlogout

elif [ "$1" = "remove" ] || [ "$1" = "-r"] ; then
  	rm -i ~/.zprezto/modules/prompt/functions/prompt_adam3_setup
	rm -i ~/.tmux.conf
	rm -i ~/.vimrc
	rm -i ~/.gitconfig
  	rm -i ~/.vim/colors/molokai.vim
	rm -i ~/.zshenv
	rm -i ~/.zshrc
	rm -i ~/.zprofile
	rm -i ~/.zpreztorc
	rm -i ~/.zlogin
	rm -i ~/.zlogout

else

	echo "Help!"

fi
