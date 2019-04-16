# Personal vim configuration #
This is my *personal* vim configuration, not recommended for use by
anyone.

But, if you insist...

## Installation ##
First backup your current `~/.vim` folder, and `~/.vimrc`/`~/.gvimrc`
(or if you're on Windows, `~\vimfiles` and `~\_vimrc`/`~\_gvimrc`).
This way if anything doesn't work, no harm is done.

In the following, Windows people should convert `~/.vim` to
`~\vimfiles`, and `~/.vimrc` to `~\_vimrc`, and `~/.gvimrc` to
`~\_gvimrc`.

Now, clone this repository:

    git clone --recursive https://github.com/jpeoples/dotvim.git ~/.vim

and set up your `~/.vimrc` and `~/.gvimrc` as symlinks to the
corresponding files in the repository (on Linux):

    ln -s ~/.vim/vimrc ~/.vimrc
    ls -s ~/.vim/gvimrc ~/.gvimrc

or on Windows, with a terminal open as administrator (why you need to be
an admin to make a freaking symlink is beyond me :( ), navigate to your
home folder and do:

    mklink _vimrc vimfiles\vimrc
    mklink _gvimrc vimfiles\gvimrc
