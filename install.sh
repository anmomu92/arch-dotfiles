#!/bin/bash

BACKUP_DIR="${HOME}/.backups/config"
REPO_DIR=$(dirname "$(realpath "$0")")

# Create config dir
if [[ ! -d ${XDG_CONFIG_HOME:="$HOME/.config"} ]]; then
	mkdir "${HOME}/.config"
fi

# Create backup dir
if [[ ! -d "${BACKUP_DIR}" ]]; then
	mkdir -p "${BACKUP_DIR}"
fi	

# Search for dotfiles
for d in ${REPO_DIR}/.config/*; do
	app=$(basename $d)

	# Remove previous link or backup
	if [[ -L "${XDG_CONFIG_HOME}/${app}" ]]; then
		echo ""
		echo ":: Removing ${app} symbolic link"
		rm "${XDG_CONFIG_HOME}/${app}"
	elif [[ -d "${XDG_CONFIG_HOME}/${app}" && ! -L "${XDG_CONFIG_HOME}/${app}" ]]; then
		echo ""
		echo ":: Backing up ${app}"
		rm -rf "${BACKUP_DIR}/${app}"
		mv -f "${XDG_CONFIG_HOME}/${app}" "${BACKUP_DIR}/"
	fi

	# Symbolic link
	echo "::"
	echo ":: Linking ${app}"
	echo "----------------------"
	echo ""
	ln -s $d ${XDG_CONFIG_HOME}/${app}
done
