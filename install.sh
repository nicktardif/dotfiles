ln -s `pwd`/.bashrc ~/.bashrc
ln -s `pwd`/.profile ~/.profile
ln -s `pwd`/.tmux.conf ~/.tmux.conf
ln -s `pwd`/.vimrc ~/.vimrc
ln -s `pwd`/.Xdefaults ~/.Xdefaults

cp -r `pwd`/.vim ~/

git config --global user.name "Nick Tardif"
git config --global user.email "nicktardif@gmail.com"
