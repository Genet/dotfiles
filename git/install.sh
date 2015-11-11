#!/usr/bin/env bash

set -e

DIR=$(dirname "$0")

info () {
  printf "\r  [ \033[00;34m..\033[0m ] $1"
}

user () {
  printf "\r  [ \033[0;33m??\033[0m ] $1"
}

success () {
  printf "\r\033[2K  [ \033[00;32mOK\033[0m ] $1"
}

if ! [ -f $DIR/gitconfig.symlink ]
then
  info 'setup gitconfig\n'

  user 'user.name: '
  read -e git_authorname
  user 'user.email: '
  read -e git_authoremail

  sed -e "s/AUTHORNAME/$git_authorname/g" -e "s/AUTHOREMAIL/$git_authoremail/g" $DIR/gitconfig.symlink.example > $DIR/gitconfig.symlink

  success 'gitconfig\n'
fi

