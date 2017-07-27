#!/bin/sh
# The MIT License (MIT)
#
# Copyright (c) 2014 Gustavo Franco
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in
# all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
# THE SOFTWARE.

echo "Installing packages"
if [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
  sudo apt-get -y update
  sudo apt-get -y upgrade
  sudo apt-get -y dist-upgrade
  sudo apt-get -y autoremove

  sudo apt-get -y install git
  sudo apt-get -y install vim
  sudo apt-get -y install zsh

  # Netstat
  sudo apt-get -y install net-tools

  # Sublime Text 3
  sudo add-apt-repository ppa:webupd8team/sublime-text-3
  sudo apt-get -y update
  sudo apt-get -y install sublime-text-installer

  # Docker Engine
  sudo apt-get -y update
  sudo apt-get -y remove docker docker-engine
  sudo apt-get -y install linux-image-extra-$(uname -r) linux-image-extra-virtual
  sudo apt-get -y install apt-transport-https ca-certificates curl software-properties-common
  sudo apt-get -y install curl
  curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
  sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
  sudo apt-get -y update
  sudo apt-get -y install docker-ce
elif [ "$(uname)" == "Darwin" ]; then
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  brew update

  brew tap caskroom/cask
  brew tap buo/cask-upgrade

  brew install ansible
  brew install bash
  brew install curl
  brew install git
  brew install htop
  brew install maven
  brew install node
  brew install ruby
  brew install vim
  brew install wget
  brew install yarn
  brew install zsh

  brew cask install arduino
  brew cask install atom
  brew cask install bartender
  brew cask install brave
  brew cask install burn
  brew cask install caffeine
  brew cask install cakebrew
  brew cask install cleanmymac
  brew cask install cloudapp
  brew cask install coconutbattery
  brew cask install cyberduck
  brew cask install daisydisk
  brew cask install dash
  brew cask install dropbox
  brew cask install eclipse-java
  brew cask install electrum
  brew cask install filezilla
  brew cask install firefox
  brew cask install flixtools
  brew cask install folx
  brew cask install gemini
  brew cask install google-chrome
  brew cask install handbrake
  brew cask install imageoptim
  brew cask install istat-menus
  brew cask install itau
  brew cask install iterm2
  brew cask install java
  brew cask install keka
  brew cask install keybase
  brew cask install licecap
  brew cask install mgba
  brew cask install mipony
  brew cask install opera
  brew cask install plex-media-server
  brew cask install printrun
  brew cask install reflector
  brew cask install retroarch
  brew cask install screenflick
  brew cask install screenflow
  brew cask install sequel-pro
  brew cask install sizeup
  brew cask install sketch
  brew cask install skype
  brew cask install slack
  brew cask install spotify
  brew cask install sublime-text
  brew cask install transmission
  brew cask install utorrent
  brew cask install vagrant
  brew cask install virtualbox
  brew cask install visual-studio-code
  brew cask install vlc
  brew cask install x-lite
else
  echo "Your OS isn't supported"
  exit 1
fi

echo "Cloning dotfiles"
if [ -f ~/.dotfiles ] || [ -h ~/.dotfiles ]; then
  mv ~/.dotfiles /tmp/dotfiles-old
fi
git clone --recursive https://github.com/gufranco/dotfiles.git ~/.dotfiles
cd ~/.dotfiles
git remote set-url origin git@github.com:gufranco/dotfiles.git

echo "Configuring vim"
if [ -f ~/.vim ] || [ -h ~/.vim ]; then
  mv ~/.vim /tmp/vim-old
fi
ln -s ~/.dotfiles/vim ~/.vim
if [ -f ~/.vimrc ] || [ -h ~/.vimrc ]; then
  mv ~/.vimrc /tmp/vimrc-old
fi
ln -s ~/.dotfiles/vimrc ~/.vimrc

echo "Configuring Sublime Text 3"
if [ -f ~/.config/sublime-text-3/Packages/User/Preferences.sublime-settings ] || [ -h ~/.config/sublime-text-3/Packages/User/Preferences.sublime-settings ]; then
  mv ~/.config/sublime-text-3/Packages/User/Preferences.sublime-settings /tmp/Preferences.sublime-settings-old
fi
ln -s ~/.dotfiles/Preferences.sublime-settings ~/.config/sublime-text-3/Packages/User/Preferences.sublime-settings

echo "Configuring Git"
if [ -f ~/.gitconfig ] || [ -h ~/.gitconfig ]; then
  mv ~/.gitconfig /tmp/gitconfig-old
fi
ln -s ~/.dotfiles/gitconfig ~/.gitconfig
if [ -f ~/.gitglobalignore ] || [ -h ~/.gitglobalignore ]; then
  mv ~/.gitglobalignore /tmp/gitglobalignore-old
fi
ln -s ~/.dotfiles/gitglobalignore ~/.gitglobalignore

echo "Configuring Zsh"
if [ -f ~/.zshrc ] || [ -h ~/.zshrc ]; then
  mv ~/.zshrc /tmp/zshrc-old
fi
ln -s ~/.dotfiles/zshrc ~/.zshrc
if [ -f ~/.oh-my-zsh ] || [ -h ~/.oh-my-zsh ]; then
  mv ~/.oh-my-zsh /tmp/oh-my-zsh-old
fi
ln -s ~/.dotfiles/oh-my-zsh ~/.oh-my-zsh
chsh -s `which zsh`

echo "Configuring SSH"
if [ -f ~/.ssh ] || [ -h ~/.ssh ]; then
  mv ~/.ssh /tmp/ssh-old
fi
ln -s ~/.dotfiles/ssh ~/.ssh
