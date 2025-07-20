#!/bin/bash

BACKUP_DIR="${HOME}/.backups"
SCRIPTS_DIR="${HOME}/.local/scripts"
LOG_DIR="${HOME}/.local/log"
LOG_FILE="${HOME}/.local/log/arch-dotfiles.log"
REPO_DIR=$(dirname "$(realpath "$0")")
TIME_1=0.1
TIME_2=0.5
TIME_3=1

# Create config dir
if [[ ! -d ${XDG_CONFIG_HOME:="$HOME/.config"} ]]; then
	mkdir "${HOME}/.config"
fi

# Create dotfiles backup dir
if [[ ! -d "${BACKUP_DIR}/config" ]]; then
	mkdir -p "${BACKUP_DIR}/config"
fi	

# Create state backup dir
if [[ ! -d "${BACKUP_DIR}/state" ]]; then
	mkdir -p "${BACKUP_DIR}/state"
fi	

# Create state dir
if [[ ! -d "${XDG_STATE_HOME:="$HOME/.local/state"}" ]]; then
	mkdir -p "$HOME/.local/state"
fi

# Create scripts dir
if [[ ! -d "${SCRIPTS_DIR}" ]]; then
	mkdir -p "${SCRIPTS_DIR}"
fi

# Create log dir
if [[ ! -d "${LOG_DIR}" ]]; then
	mkdir -p "${LOG_DIR}"
fi

echo "ARCH-DOTFILES INSTALL SCRIPT LOG" | tee "$LOG_FILE"
echo "--------------------------------" | tee -a "$LOG_FILE"
echo ":: Beginning arch dotfiles installation." | tee -a "$LOG_FILE"
echo "" | tee -a "$LOG_FILE"

echo ":: LINKING DOTFILES." | tee -a "$LOG_FILE"

# Search for dotfiles
for d in ${REPO_DIR}/.config/*; do
	app=$(basename $d)

	echo "$app" | tee -a "$LOG_FILE"

	sleep $TIME_2

	# Remove previous link or backup
	if [[ -L "${XDG_CONFIG_HOME}/${app}" ]]; then
		echo "  Removing ${app} symbolic link" | tee -a "$LOG_FILE"
		rm "${XDG_CONFIG_HOME}/${app}"
	elif [[ -d "${XDG_CONFIG_HOME}/${app}" && ! -L "${XDG_CONFIG_HOME}/${app}" ]]; then
		echo "  Backing up ${app}" | tee -a "$LOG_FILE"
		rm -rf "${BACKUP_DIR}/config/${app}"
		mv -f "${XDG_CONFIG_HOME}/${app}" "${BACKUP_DIR}/config/"
	fi

	sleep $TIME_1

	# Symbolic link
	echo "  Linking ${app}" | tee -a "$LOG_FILE"
	echo "" | tee -a "$LOG_FILE"
	ln -s $d ${XDG_CONFIG_HOME}/${app}

done

sleep $TIME_3

echo ":: LINKING STATE FILES DIR." | tee -a "$LOG_FILE"

sleep $TIME_2

# Remove previous link or backup
if [[ -L "${XDG_STATE_HOME}/amm92" ]]; then
	echo "  Removing amm92 symbolic link" | tee -a "$LOG_FILE"
	rm "${XDG_STATE_HOME}/amm92"
elif [[ -d "${XDG_STATE_HOME}/amm92" && ! -L "${XDG_STATE_HOME}/amm92" ]]; then
	echo "  Backing up amm92 dir" | tee -a "$LOG_FILE"
	rm -rf "${BACKUP_DIR}/state/amm92"
	mv -f "${XDG_STATE_HOME}/amm92" "${BACKUP_DIR}/state/"
fi

ln -s "${REPO_DIR}/.state/amm92" "${XDG_STATE_HOME}/"

sleep $TIME_3

echo ""
echo ":: Arch dotfiles installation completed."
echo ":: Check out the log at $HOME/.local/log"
