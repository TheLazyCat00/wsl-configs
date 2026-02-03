push:
	# Wipe the source directory files (leaving .git)
	rm -rf "$(chezmoi source-path)"/*
	
	brew bundle dump --force
	chezmoi state data | jq -r '.entryState | keys[]' | xargs -r chezmoi add
	
	-chezmoi git add .
	-chezmoi git -- commit -m "update"
	-chezmoi git push

pull:
	chezmoi update
	brew bundle
