rm -f ~/.bashrc ~/.profile ~/.Xdefaults ~/.tmux.conf ~/.vimrc
ln -s `pwd`/.bashrc ~/.bashrc
ln -s `pwd`/.profile ~/.profile
ln -s `pwd`/.tmux.conf ~/.tmux.conf
ln -s `pwd`/.vimrc ~/.vimrc
ln -s `pwd`/.Xdefaults ~/.Xdefaults

cp -r `pwd`/.vim ~/
git clone https://github.com/ekalinin/Dockerfile.vim.git ~/.vim/bundle/Dockerfile
git clone https://github.com/bling/vim-airline ~/.vim/bundle/vim-airline
git clone https://github.com/junegunn/vim-easy-align.git ~/.vim/bundle/vim-easy-align
git clone git://github.com/tpope/vim-fugitive.git ~/.vim/bundle/vim-fugitive.git

git config --global user.name "Nick Tardif"
git config --global user.email "nicktardif@gmail.com"
