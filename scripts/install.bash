#!/usr/bin/env bash

set -euo pipefail

if ! command -v "stow" > /dev/null; then
	>&2 echo "Command stow not found, aborting"
	exit 1
fi

export __DOTS_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )/../" && pwd )"

git submodule update --init --recursive

cat <<-EOF > "$__DOTS_DIR/shell/.bash_profile"
	# this file is auto generated by a script, modifications will be overwritten
	[ -n "\$PS1" ] && source "$__DOTS_DIR/dotprofile/dots.bash"
EOF

cat <<-EOF > "$__DOTS_DIR/shell/.zshrc"
	# this file is auto generated by a script, modifications will be overwritten
	source "$__DOTS_DIR/dotprofile/dots.zsh"
EOF

stow_args="--verbose=1 --target $HOME --dir $__DOTS_DIR/"

__DOTS_STOW_DRY_RUN="${__DOTS_STOW_DRY_RUN:-false}"
if ( ${__DOTS_STOW_DRY_RUN} ); then
	stow_args="$stow_args --simulate"
fi

rm -rf "$__DOTS_DIR/build/"
cp -r "$__DOTS_DIR/config/" "$__DOTS_DIR/build/"
# create directories that will contain symlinks
mkdir -p "$__DOTS_DIR/build/.config/terminator/plugins"
mkdir -p "$__DOTS_DIR/build/.local/share/gnome-shell/extensions/"
mkdir -p "$__DOTS_DIR/build/.local/share/git/"
mkdir -p "$__DOTS_DIR/bin/.bin/"

ln -sfn "$__DOTS_DIR/dependencies/diff-so-fancy/diff-so-fancy" "$__DOTS_DIR/bin/.bin/diff-so-fancy"
ln -sfn "$__DOTS_DIR/dependencies/gnome-shell-audio-output-switcher" "$__DOTS_DIR/build/.local/share/gnome-shell/extensions/gnome-shell-audio-output-switcher@kgaut"
ln -sfn "$__DOTS_DIR/dependencies/multi-monitors-add-on/multi-monitors-add-on@spin83" "$__DOTS_DIR/build/.local/share/gnome-shell/extensions/multi-monitors-add-on@spin83"
ln -sfn "$__DOTS_DIR/dependencies/ide-sync/ide-sync.sh" "$__DOTS_DIR/bin/.bin/ide-sync"

curl -o "$__DOTS_DIR/build/.local/share/git/git-prompt.sh" "https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh"

stow ${stow_args} build
stow ${stow_args} bin
stow ${stow_args} git
stow ${stow_args} shell

# just make sure this file exists
touch "$HOME/.gitconfig_local"

echo "Loading gsettings"
"$__DOTS_DIR/scripts/load-gsettings.py" "$__DOTS_DIR/settings/gsettings.json"

if [[ "$SHELL" != "/bin/zsh" ]]; then
	echo "Updating shell to zsh"
	chsh -s "/bin/zsh"
	echo "You will need to logout and login again for the SHELL change to take effect"
fi

echo "If new gnome extensions were installed, you will need to restart gnome with the \`r\` command."

echo "Install complete"
