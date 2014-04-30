#!/bin/sh
echo "$1"
if [ "$#" -eq 0 ] ;  then
	echo "Help"
elif [ "$1" = "install" ] || ["$1" = "-i"] ; then
  git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
  git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"
  
	ln -s -v ~/dotfiles/tmux.conf ~/.tmux.conf
	ln -s -v ~/dotfiles/vimrc  ~/.vimrc

  cp -v ~/dotfiles/zprezto/prompt_adam3_setup ~/.zprezto/modules/prompt/functions/
	ln -s -v ~/dotfiles/zprezto/zshenv ~/.zshenv
	ln -s -v ~/dotfiles/zprezto/zshrc ~/.zshrc
	ln -s -v ~/dotfiles/zprezto/zprofile ~/.zprofile
	ln -s -v ~/dotfiles/zprezto/zpreztorc ~/.zpreztorc
	ln -s -v ~/dotfiles/zprezto/zlogin ~/.zlogin
	ln -s -v ~/dotfiles/zprezto/zlogout ~/.zlogout 
elif [ "$1" = "remove" ] || [ "$1" = "-r"] ; then
	rm -i ~/.tmux.conf
	rm -i ~/.vimrc
	rm -i ~/.zshenv
	rm -i ~/.zshrc
	rm -i ~/.zprofile
	rm -i ~/.zpreztorc
	rm -i ~/.zlogin
	rm -i ~/.zlogout 
else
	echo "Help!"
fi
