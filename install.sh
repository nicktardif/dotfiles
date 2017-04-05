cat `pwd`/.bashrc    >> ~/.bashrc
cat `pwd`/.profile   >> ~/.profile
cat `pwd`/.tmux.conf >> ~/.tmux.conf
cat `pwd`/.vimrc     >> ~/.vimrc
cat `pwd`/.Xdefaults >> ~/.Xdefaults

cp -r `pwd`/.vim ~/
git clone https://github.com/ekalinin/Dockerfile.vim.git ~/.vim/bundle/Dockerfile
git clone https://github.com/bling/vim-airline ~/.vim/bundle/vim-airline
git clone https://github.com/junegunn/vim-easy-align.git ~/.vim/bundle/vim-easy-align
git clone git://github.com/tpope/vim-fugitive.git ~/.vim/bundle/vim-fugitive.git
git clone https://github.com/tpope/vim-sleuth ~/.vim/bundle/vim-sleuth
git clone https://github.com/vim-scripts/VisIncr.git ~/.vim/bundle/visincr
git clone https://github.com/stephpy/vim-yaml ~/.vim/bundle/vim-yaml

git config --global user.name "Nick Tardif"
git config --global user.email "nicktardif@gmail.com"

# Markdown File Viewer
sudo pip install mdv
