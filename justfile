push:
	# Wipe the source directory files
	rm -rf "$(chezmoi source-path)"/*
	
	brew bundle dump --force --file="$(chezmoi source-path)/Brewfile"
	
	@for file in $(chezmoi state data | jq -r '.entryState | keys[]'); do \
		if [ -e $file ]; then \
			chezmoi add $file; \
		else \
			echo Removing orphaned state for: $file; \
			chezmoi state delete --bucket=entryState --key=$file || true; \
		fi; \
	done

	-chezmoi git add .
	-chezmoi git -- commit -m"update"
	-chezmoi git push

pull:
	chezmoi update
	brew bundle
