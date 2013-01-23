
# Make awesomeness happen.
ALL = keys bash vim screen tmux git hg

# Linux doesn't need a few things that OSX does.
LINUX = keys-global bash vim screen tmux git hg

# Don't put crap in /etc.
NOGLOBAL = keys-home bash-home vim tmux git hg


# Where to link stuff from, should be `pwd`, but who knows.
DOTREPO = `pwd`


# Key setup.
keys-global:
	sudo ln -sf $(DOTREPO)/sys_inputrc /etc/inputrc

keys-home:
	mkdir -p ~/Library/KeyBindings/
	ln -sf {$(DOTREPO),~/Library/KeyBindings}/DefaultKeyBinding.dict

keys: keys-global keys-home


# Bash config.
bash-global:
	sudo ln -sf $(DOTREPO)/sys_bashrc /etc/bashrc

bash-home:
	ln -sf {$(DOTREPO)/,~/.}bashrc
	ln -sf {$(DOTREPO)/,~/.}bash_profile

bash: bash-global bash-home


# Vim.
vim:
	mkdir -p ~/.vim/bundle
	mkdir -p ~/tmp/vim/{backup,swap,undo}
	ln -sf {$(DOTREPO)/,~/.}vimrc
	ln -sf {$(DOTREPO)/,~/.}gvimrc
	ln -sf $(DOTREPO)/vim/* ~/.vim/
	git clone git://github.com/gmarik/vundle.git ~/.vim/bundle/vundle

# screen.
screen-global:
	sudo ln -sf $(DOTREPO)/sys_screenrc /etc/screenrc

screen: screen-global


# tmu.
tmux:
	ln -sf {$(DOTREPO)/,~/.}tmux.conf

# git.
git:
	ln -sf {$(DOTREPO)/,~/.}gitconfig
	ln -sf {$(DOTREPO)/,~/.}gitignore_global

# Mercurial.
hg:
	ln -sf {$(DOTREPO)/,~/.}hgignore_global
	ln -sf {$(DOTREPO)/,~/.}hgrc

