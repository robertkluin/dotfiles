
# Make awesomeness happen.
.PHONY: ALL
ALL = keys-config bash-config vim-config screen-config tmux-config git-config hg-config

# Linux doesn't need a few things that OSX does.
.PHONY: LINUX
LINUX = keys-sys bash-config vim-config screen-config tmux-config git-config hg-config

# Don't put crap in /etc.
.PHONY: NOGLOBAL
NOGLOBAL = keys-home bash-home vim-config tmux-config git-config hg-config


# Where to link files from, should generally be `pwd`.
DOTREPO = $(CURDIR)

# Make sure bash is used so that expansions are performed as expected.
SHELL=/bin/bash


all: $(ALL)
osx: $(ALL)
linux: $(LINUX)
noglobal: $(NOGLOBAL)

# Key setup.
.PHONY: keys-sys
keys-sys:
	sudo ln -sf {$(DOTREPO),}/etc/inputrc

.PHONY: keys-home
keys-home:
	mkdir -p $(HOME)/Library/KeyBindings/
	ln -sf {$(DOTREPO),$(HOME)/Library/KeyBindings}/DefaultKeyBinding.dict

.PHONY: keys-config
keys-config: keys-sys keys-home


# Bash config.
.PHONY: bash-sys
bash-sys:
	sudo ln -sf {$(DOTREPO),}/etc/profile
	-test ! -L /etc/profile.d && sudo ln -sf {$(DOTREPO),}/etc/profile.d

.PHONY: bash-home
bash-home:
	ln -sf {$(DOTREPO)/,$(HOME)/.}bashrc
	ln -sf {$(DOTREPO)/,$(HOME)/.}profile
	ln -sf {$(DOTREPO)/,$(HOME)/.}bash_aliases
	ln -sf {$(DOTREPO)/,$(HOME)/.}bash_profile

.PHONY: bash-config
bash-config: bash-sys bash-home

# zsh.
.PHONY: zsh-config
zsh-config:
	ln -sf {$(DOTREPO)/,$(HOME)/.}zshrc
	-test ! -d $(HOME)/.zsh/zsh-autosuggestions && git clone https://github.com/zsh-users/zsh-autosuggestions $(HOME)/.zsh/zsh-autosuggestions

# Vim.
.PHONY: vim-config
vim-config:
	mkdir -p $(HOME)/.vim/bundle
	mkdir -p $(HOME)/tmp/vim/{backup,swap,undo}
	ln -sf {$(DOTREPO)/,$(HOME)/.}vimrc
	ln -sf {$(DOTREPO)/,$(HOME)/.}gvimrc
	ln -sf $(DOTREPO)/vim/* $(HOME)/.vim/
	-test ! -d $(HOME)/.vim/autoload/plug.vim && curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# screen.
.PHONY: screen-sys
screen-sys:
	sudo ln -sf {$(DOTREPO),}/etc/screenrc

.PHONY: screen-config
screen-config: screen-sys

# tmux.
.PHONY: tmux-config
tmux-config:
	ln -sf {$(DOTREPO)/,$(HOME)/.}tmux.conf

# git.
.PHONY: git-config
git-config:
	ln -sf {$(DOTREPO)/,$(HOME)/.}gitconfig
	ln -sf {$(DOTREPO)/,$(HOME)/.}gitignore_global

# Mercurial.
.PHONY: hg-config
hg-config:
	ln -sf {$(DOTREPO)/,$(HOME)/.}hgrc
	ln -sf {$(DOTREPO)/,$(HOME)/.}hgignore_global

