#! /bin/bash
# install my necessary progs

sudo apt update
sudo apt install tmux vim terminator redshift python3 python3-setuptools dmenu -y
ln -s $PWD/.tmux.conf ~/.tmux.conf
ln -s $PWD/.vimrc ~/.vimrc
mkdir -p ~/.config/autostart && cp nocaps.desktop ~/.config/autostart/
cd ~/.config && git clone https://github.com/s1m0x/.config && cd .config
ln -s $PWD/terminator ~/.config/terminator


#  dmenu_run -b keybinding


