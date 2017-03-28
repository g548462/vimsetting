git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/vundle
cp -r .vim/colors ~/.vim/colors
cp -r .vim/ftplugin ~/.vim/ftplugin
cp -r .vim/indent ~/.vim/indent
cp -r .vim/syntax ~/.vim/syntax
cp .vimrc ~/.vimrc
vim +PluginInstall +qall
rm ~/.vim/bundle/cscope.vim/plugin/*
cp cscope_maps.vim ~/.vim/bundle/cscope.vim/plugin/cscope_maps.vim
