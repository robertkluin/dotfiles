
# Make awesomeness happen.
ALL = keys-config bash-config vim-config screen-config tmux-config git-config hg-config

# Linux doesn't need a few things that OSX does.
LINUX = keys-sys bash-config vim-config screen-config tmux-config git-config hg-config

# Don't put crap in /etc.
NOGLOBAL = keys-home bash-home vim-config tmux-config git-config hg-config


# Where to link files from, should generally be `pwd`.
DOTREPO = `pwd`

# Make sure bash is used so that expansions are performed as expected.
SHELL=/bin/bash


all: (ALL)
linux: (LINUX)
noglobal: (NOGLOBAL)

# Key setup.
keys-sys:
	sudo ln -sf {$(DOTREPO),}/etc/inputrc

keys-home:
	mkdir -p ~/Library/KeyBindings/
	ln -sf {$(DOTREPO),~/Library/KeyBindings}/DefaultKeyBinding.dict

keys-config: keys-sys keys-home


# Bash config.
bash-sys:
	sudo ln -sf {$(DOTREPO),}/etc/profile

bash-home:
	ln -sf {$(DOTREPO)/,~/.}bashrc
	ln -sf {$(DOTREPO)/,~/.}profile

bash-config: bash-sys bash-home


# Vim.
vim-config:
	mkdir -p ~/.vim/bundle
	mkdir -p ~/tmp/vim/{backup,swap,undo}
	ln -sf {$(DOTREPO)/,~/.}vimrc
	ln -sf {$(DOTREPO)/,~/.}gvimrc
	ln -sf $(DOTREPO)/vim/* ~/.vim/
	git clone git://github.com/gmarik/vundle.git ~/.vim/bundle/vundle

# screen.
screen-sys:
	sudo ln -sf $(DOTREPO)/sys_screenrc /etc/screenrc

screen-config: screen-sys


# tmu.
tmux-config:
	ln -sf {$(DOTREPO)/,~/.}tmux.conf

# git.
git-config:
	ln -sf {$(DOTREPO)/,~/.}gitconfig
	ln -sf {$(DOTREPO)/,~/.}gitignore_global

# Mercurial.
hg-config:
	ln -sf {$(DOTREPO)/,~/.}hgignore_global
	ln -sf {$(DOTREPO)/,~/.}hgrc

