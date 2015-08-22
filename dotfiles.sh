#!/bin/bash

clear;

DOTFILES_ROOT=$(pwd)

#All git repos to clone

GIT=( \
# url                                         dest
  https://github.com/VundleVim/Vundle.vim.git ${HOME}/.vim/bundle/Vundle.vim    \
  https://github.com/tarjoilija/zgen          ${HOME}/.zgen                     \
)

# Files to link

LINK=( \
# filename              source folder               desitnation folder
  .tmux.conf            ${DOTFILES_ROOT}            ${HOME}                     \
  .gitconfig            ${DOTFILES_ROOT}            ${HOME}                     \
  .npmrc                ${DOTFILES_ROOT}            ${HOME}                     \
  config                ${DOTFILES_ROOT}/i3         ${HOME}/.i3/                \
#Vim Files
  .vimrc                ${DOTFILES_ROOT}/vim        ${HOME}                     \
  .vimrc.bundles        ${DOTFILES_ROOT}/vim        ${HOME}                     \
#Zshrc Files
  .zshrc                ${DOTFILES_ROOT}/zsh        ${HOME}                     \
)

#Files to link

COPY=( \
# filename              source folder                 desitnation folder
  .vimrc.local          ${DOTFILES_ROOT}/vim          ${HOME}                   \
  .vimrc.bundles.local  ${DOTFILES_ROOT}/vim          ${HOME}                   \
  molokai.vim           ${DOTFILES_ROOT}/vim/colors   ${HOME}/.vim/colors       \
  #Zshrc Files
  .zshrc.local          ${DOTFILES_ROOT}/zsh          ${HOME}                   \
  simon.zsh-theme       ${DOTFILES_ROOT}/zsh          ${HOME}/.zsh              \
)

GIT_LENGTH=${#GIT[@]}
LINK_LENGTH=${#LINK[@]}
COPY_LENGTH=${#COPY[@]}

function  install {
#Action Git links
  for (( i=0; i<${GIT_LENGTH}; i = i+2 ));
  do
      echo "Actioning" ${GIT[$i]}
      #If git folder exists, presummed installed and update otherwise grab
      if [ -d ${GIT[$i+1]} ] ; then
        cd ${GIT[$i+1]} && git pull 2>&1 | sed 's/^/   /'
        #Use sed to indent
      else
        git clone ${GIT[$i]} ${GIT[$i+1]} 2>&1 | sed 's/^/   /'
      fi
  done

#Action file links
  for (( i=0; i<${LINK_LENGTH}; i = i+3 ));
  do
      echo "Actioning" ${LINK[$i]}
      #make all parent directories
      mkdir -p ${LINK[$i+2]}
      #(S)ymbolically link files, (f)orced and (v)erbosed
      ln -s -f ${LINK[$i+1]}/${LINK[$i]} ${LINK[$i+2]}
  done

#Action copy links
  for (( i=0; i<${COPY_LENGTH}; i = i+3 ));
  do
    echo "Actioning" ${COPY[$i]}
    #make all parent directories
    mkdir -p ${COPY[$i+2]}
    #Copy files, (n)o-overwrite and (v)erbosed
    cp -n -v ${COPY[$i+1]}/${COPY[$i]} ${COPY[$i+2]}
  done
}

function remove {
  for (( i=0; i<${GIT_LENGTH}; i = i+2 ));
  do
        rm -rf ${GIT[$i+1]}
  done

  for (( i=0; i<${LINK_LENGTH}; i = i+3 ));
  do
      rm -f ${LINK[$i+2]}/${LINK[$i]}
  done

  for (( i=0; i<${COPY_LENGTH}; i = i+3 ));
  do
    #Create backup file
    cp ${COPY[$i+2]}/${COPY[$i]} ${DOTFILES_ROOT}/backups/"$(date +%Y%m%d-%H%M%S)"-${COPY[$i]}.bak
    #Remove file
    rm -f ${COPY[$i+2]}/${COPY[$i]}
  done
}

if [ "$#" -eq 0 ] ;  then
  echo "Install/Updating Dotfiles. To remove use flag -r"
  install
elif [ "$1" = "remove" ] || [ "$1" = "-r" ]  || [ "$1" = "-remove" ]; then
  remove
fi
