
# Make awesomeness happen.
ALL = keys-config bash-config vim-config screen-config tmux-config git-config hg-config

# Linux doesn't need a few things that OSX does.
LINUX = keys-sys bash-config vim-config screen-config tmux-config git-config hg-config

# Don't put crap in /etc.
NOGLOBAL = keys-home bash-home vim-config tmux-config git-config hg-config


# Where to link files from, should generally be `pwd`.
DOTREPO = $(CURDIR)

# Make sure bash is used so that expansions are performed as expected.
SHELL=/bin/bash


all: (ALL)
osx: (ALL)
linux: (LINUX)
noglobal: (NOGLOBAL)

# Key setup.
keys-sys:
	sudo ln -sf {$(DOTREPO),}/etc/inputrc

keys-home:
	mkdir -p $(HOME)/Library/KeyBindings/
	ln -sf {$(DOTREPO),$(HOME)/Library/KeyBindings}/DefaultKeyBinding.dict

keys-config: keys-sys keys-home


# Bash config.
bash-sys:
	sudo ln -sf {$(DOTREPO),}/etc/profile
	sudo ln -sf {$(DOTREPO),}/etc/profile.d

bash-home:
	ln -sf {$(DOTREPO)/,$(HOME)/.}bashrc
	ln -sf {$(DOTREPO)/,$(HOME)/.}profile
	ln -sf {$(DOTREPO)/,$(HOME)/.}bash_aliases

bash-config: bash-sys bash-home

# Vim.
vim-config:
	mkdir -p $(HOME)/.vim/bundle
	mkdir -p $(HOME)/tmp/vim/{backup,swap,undo}
	ln -sf {$(DOTREPO)/,$(HOME)/.}vimrc
	ln -sf {$(DOTREPO)/,$(HOME)/.}gvimrc
	ln -sf $(DOTREPO)/vim/* $(HOME)/.vim/
	git clone git://github.com/gmarik/vundle.git $(HOME)/.vim/bundle/vundle

# screen.
screen-sys:
	sudo ln -sf {$(DOTREPO),}/etc/screenrc

screen-config: screen-sys

# tmux.
tmux-config:
	ln -sf {$(DOTREPO)/,$(HOME)/.}tmux.conf

# git.
git-config:
	ln -sf {$(DOTREPO)/,$(HOME)/.}gitconfig
	ln -sf {$(DOTREPO)/,$(HOME)/.}gitignore_global

# Mercurial.
hg-config:
	ln -sf {$(DOTREPO)/,$(HOME)/.}hgrc
	ln -sf {$(DOTREPO)/,$(HOME)/.}hgignore_global

