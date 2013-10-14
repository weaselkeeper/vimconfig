#this script will setup vim specifics using the configs in this repo

files="vimrc"
vimdirs="vim"
date=`date +"%Y%m%d"`

# if ~/.vim is a link pointing to vim here, unlink it, preparetory to linking it to our new target
for vimdir in $vimdirs; do
    if [ -h ~/.$vimdir ]; then
        unlink ~/.$vimdir
    else
        if [ -f ~/.$vimdir ]; then
            echo "backing up ~/.$vimdir to ~/.$vimdir.bak$date"
            mv ~/.$vimdir ~/.$vimdir.bak$date
        fi
    fi
    echo "symlinking $PWD/$vimdir to ~/.$vimdir"
    ln -s $PWD/$vimdir ~/.$vimdir
done

# if ~/.vimrc is a link pointing to vim here, unlink it, preparetory to linking it to our new target
for file in $files; do
    if [ -h ~/.$file ]; then
        unlink ~/.$file
    else
        if [ -f ~/.$file ]; then
            echo "backing up ~/.$file to ~/.$file.bak$date"
            mv ~/.$file ~/.$file.bak$date
        fi
    fi
    echo "symlinking $PWD/$file to ~/.$file"
    ln -s $PWD/$file ~/.$file
done

