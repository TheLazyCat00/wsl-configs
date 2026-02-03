push:
	chezmoi state delete-bucket --bucket=entryState || true
	chezmoi git -- rm --cache . -r
	chezmoi re-add
	chezmoi git add .
	chezmoi git -- commit -m"update"
	chezmoi git push

pull:
	chezmoi update
	brew bundle
