#!/bin/sh
echo "Install vim configurations..."

echo "cd to .vim directory"
cd ~/.vim

echo "backup origin vimrc..."
if [ -f "/root/.vimrc" ]; then
    mv ~/.vimrc ~/.vimrc.20150415
fi

echo "create new vimrc..."
ln -s ~/.vim/vimrc ~/.vimrc

git submodule init
git submodule update

echo "Install vundle"
git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle

echo "Install jedi and flake of python"
easy_install jedi
easy_install flake8

vim +BundleInstall  +qall
