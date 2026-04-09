# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# If not running interactively, don't do anything
case $- in
    *i*)
		. ~/interactive.sh
	;;
      *);;
esac

eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
export QT_XCB_FORCE_SOFTWARE_OPENGL=1
export QT_QPA_PLATFORM=wayland
export VCPKG_ROOT=~/vcpkg
export PATH=$VCPKG_ROOT:$PATH
export PATH="$PATH:/home/manuel/.local/bin"

# >>> juliaup initialize >>>

# !! Contents within this block are managed by juliaup !!

case ":$PATH:" in
    *:/home/manuel/.juliaup/bin:*)
        ;;

    *)
        export PATH=/home/manuel/.juliaup/bin${PATH:+:${PATH}}
        ;;
esac

# <<< juliaup initialize <<<

export PATH="$HOME/.checkpoint:$PATH"
# checkpoint: better shell history for restore
export HISTSIZE=100000
export HISTFILESIZE=200000
shopt -s histappend
checkpoint() {
	history -a
	history -n
	command checkpoint "$@"
}

# BEGIN opam configuration
# This is useful if you're using opam as it adds:
#   - the correct directories to the PATH
#   - auto-completion for the opam binary
# This section can be safely removed at any time if needed.
test -r '/home/manuel/.opam/opam-init/init.sh' && . '/home/manuel/.opam/opam-init/init.sh' > /dev/null 2> /dev/null || true
# END opam configuration
