push:
	chezmoi re-add
	chezmoi git add .
	chezmoi git -- commit -m"update"
	chezmoi git push

pull:
	chezmoi update
	brew bundle
