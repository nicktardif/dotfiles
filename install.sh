ln -s `pwd`/.bashrc ~/.bashrc
ln -s `pwd`/.zshrc ~/.zshrc
ln -s `pwd`/.profile ~/.profile
ln -s `pwd`/.tmux.conf ~/.tmux.conf
ln -s `pwd`/.vimrc ~/.vimrc

cp -r `pwd`/.vim ~/

# Vim Plugins
git clone https://github.com/ekalinin/Dockerfile.vim.git ~/.vim/bundle/Dockerfile
git clone https://github.com/bling/vim-airline ~/.vim/bundle/vim-airline
git clone https://github.com/junegunn/vim-easy-align.git ~/.vim/bundle/vim-easy-align
git clone git://github.com/tpope/vim-fugitive.git ~/.vim/bundle/vim-fugitive.git
git clone https://github.com/tpope/vim-sleuth ~/.vim/bundle/vim-sleuth
git clone https://github.com/vim-scripts/VisIncr.git ~/.vim/bundle/visincr
git clone https://github.com/stephpy/vim-yaml ~/.vim/bundle/vim-yaml
git clone https://github.com/chriskempson/base16-vim ~/.vim/bundle/base16-vim
git clone git://github.com/tpope/vim-abolish.git ~/.vim/bundle/abolish
git clone git://github.com/vim-syntastic/syntastic.git ~/.vim/bundle/syntastic
git clone https://github.com/posva/vim-vue.git ~/.vim/bundle/vim-vue

# Shell color scheme
git clone https://github.com/chriskempson/base16-shell.git ~/.config/base16-shell
# Current color scheme can be loaded with `base16_materia`

(
mkdir -p ~/Git
git clone https://github.com/powerline/fonts.git --depth=1 ~/Git/powerline-fonts
cd ~/Git/powerline-fonts
./install.sh
)

git config --global user.name "Nick Tardif"
git config --global user.email "nicktardif@gmail.com"
