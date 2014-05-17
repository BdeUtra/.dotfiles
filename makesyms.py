import os

home = os.path.expanduser("~")
path = os.path.join(home, '.dotfiles')

stuff = [
    '.vimrc',
    '.tmux.conf',
    '.tigrc',
]


def do_files():
    back_up_folder = os.path.join(path, '.backup')
    for fn in stuff:
        target_path = os.path.join(home, fn)
        original_path = os.path.join(path, fn)
        if os.path.exists(target_path):
            if not os.path.exists(back_up_folder):
                print "Creating backup folder..."
                os.mkdir(back_up_folder)
            if (os.path.islink(target_path) and
                    os.path.realpath(target_path) == original_path):
                return
            print "Backing up '%s' ..." % target_path
            os.rename(target_path, os.path.join(back_up_folder, fn))
        if not os.path.exists(target_path):
            print "Creating symlink for '%s'..." % fn
            os.symlink(original_path, target_path)

if __name__ == "__main__":
    do_files()
