#!/bin/bash
# update DefaultConfigFiles to this system's current files
echo "-- Update Config Files --"
echo " "
backup_folder="/mnt/f/DefaultConfigFiles"

confirm_backup ()
{
	echo "Backing up config files to ${backup_folder}"
	echo "Press [Y|n] to continue >"
	read continue_update

	if [[ $continue_update == "y" || $continue_update == "Y" ]]; then
		echo "..."
	else
		echo "Enter the directory you wouldlike to backup to >"
		read backup_folder
		confirm_backup
	fi
}
confirm_backup

echo "vim files..."
cp ~/.vimrc "${backup_folder}/vim/.vimrc"
cp -r ~/.vim/colors/ "${backup_folder}/vim/.vim/colors"
echo "bash aliases..."
cp ~/.bash_aliases "${backup_folder}/bash/.bash_aliases"

echo "All done, thank you"

