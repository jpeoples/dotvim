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

    git clone https://github.com/jpeoples/dotvim.git ~/.vim

and set up your `~/.vimrc` and `~/.gvimrc` as symlinks to the
corresponding files in the repository.

    ln -s ~/.vim/vimrc ~/.vimrc
    ls -s ~/.vim/gvimrc ~/.gvimrc

or on Windows, with a terminal open as administrator (why you need to be
an admin to make a freaking symlink is beyond me :( ), navigate to your
home folder and do:

    mklink _vimrc vimfiles\vimrc
    mklink _gvimrc vimfiles\gvimrc

Because I use Vundle, which manages the plugins in `.vim/bundle` as git
repositories, the plugin folders will be empty.  Therefore, you now must
install Vundle yourself, and use it to install the other plugins as
follows.

Install [Vundle](https://github.com/gmarik/Vundle.vim) to the newly
created `.vim` folder (Windows users _please_ see [special requirements
for Windows setup](https://github.com/gmarik/Vundle.vim/wiki/Vundle-for-Windows)).

Now to get all the plugins working simply run vim (or gvim) and do:

    :PluginInstall

and watch the magic.


## Note on vim-markdown-wiki ##

Recent updates to vim-markdown-wiki make it an ftplugin for file type
`mkd_wiki`.  Therefore, your filetype must be `mkd_wiki` for it to work.
However, other markdown stuff will expect filetype `markdown`.

To fix this I copied the vim-markdown plugin's `ftdetect/markdown.vim`
file to `.vim/after/ftdetect` and changed it to set file type to
`markdown.mkd_wiki`.  This overrides `vim-markdown`'s markdown type
detection, and sets the file type to both `markdown` and `mkd_wiki`

