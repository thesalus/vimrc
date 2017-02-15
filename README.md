### Installing and Using

1. Grab git submodules

        git submodule init
        git submodule update

2. To use this as your vim settings, set the following in ~/.vimrc

        set runtimepath+=~/vimrc/.vim
        source ~/vimrc/.vimrc

3. Add the following to ~/.gitconfig

        [include]
        	path = ~/vimrc/.gitconfig

4. Add the following to ~/.zshrc

        source ~/vimrc/.zshrc
