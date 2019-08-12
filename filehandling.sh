#!/bin/bash

echo -e "${_GREEN}FILE HANDLING STARTED${_RESET}"

# Deal with swappiness first

if [ -e /$_SWAPFILE_NAME ]; then

	echo "The file /$_SWAPFILE_NAME exists. All Good!!"

else
	echo "The file /$_SWAPFILE_NAME does not exist. Fixing That!!!"
	sudo fallocate -l $_SWAPFILE_SIZE /$_SWAPFILE_NAME
	sudo chmod 600 /$_SWAPFILE_NAME
	sudo mkswap /$_SWAPFILE_NAME
	sudo swapon /$_SWAPFILE_NAME
	sudo echo "/$_SWAPFILE_NAME none swap sw 0 0" | sudo tee -a /etc/fstab

fi

# ensure swappiness and pressure is reduced
if [ "$_SWAPPINESS" -lt "$_SWAPPINESS_TARGET" ]; then

	echo "vm.swappiness: $_SWAPPINESS incorrect. Fixing That!!!"
	sudo sysctl -w vm.swappiness=$_SWAPPINESS_TARGET
	echo "vm.swappiness=$_SWAPPINESS_TARGET" | sudo tee -a /etc/sysctl.conf
	sudo sysctl -p

else

	echo "vm.swappiness: $_SWAPPINESS All Good!!!"

fi

if [ "$_VFS_CACHE_PRESSURE" -lt "$_VFS_CACHE_PRESSURE_TARGET" ]; then

        echo "vm.vfs_cache_pressure: $_VFS_CACHE_PRESSURE incorrect. Fixing That!!!"
        sudo sysctl -w vm.vfs_cache_pressure=$_VFS_CACHE_PRESSURE_TARGET
        echo "vm.vfs_cache_pressure=$VFS__CACHE_PRESSURE_TARGET" | sudo tee -a /etc/sysctl.conf
	sudo sysctl -p

else

        echo "vm.vfs_cache_pressure: $_VFS_CACHE_PRESSURE All Good!!!"

fi

# Deal with open file max limits

if [ "$_FILE_MAX" -lt "$_FILE_MAX_TARGET" ]; then

	echo "fs.file-max: $_FILE_MAX incorrect. Fixing That!!!"
        sysctl -w fs.file-max=$_FILE_MAX_TARGET
	echo "fs.file-max=$_FILE_MAX_TARGET" | sudo tee -a /etc/sysctl.conf
	sudo sysctl -p

else
	echo "fs.file-max: $_FILE_MAX All Good!!!"

fi

if [ "$_ULIMIT" -lt "$_ULIMIT_TARGET" ]; then

	echo "ulimit: $_ULIMIT incorrect. Temporarily Fixing That!!!"
        ulimit -n $_ULIMIT_TARGET

fi

if [ "$_ULIMIT_HARD" -lt "$_ULIMIT_HARD_TARGET" ]; then

	echo "ulimit -Hn: $_ULIMIT_HARD incorrect. Fixing That!!!"
        ulimit -Hn $_ULIMIT_HARD_TARGET
	echo "$USER hard nofile $_ULIMIT_HARD_TARGET" | sudo tee -a /etc/security/limits.conf

else

	echo "ulimit -Hn: $_ULIMIT_HARD All Good!!!"

fi

if [ "$_ULIMIT_SOFT" -lt "$_ULIMIT_SOFT_TARGET" ]; then

	echo "ulimit -Sn: $_ULIMIT_SOFT incorrect. Fixing That!!!"
        ulimit -Sn $_ULIMIT_SOFT_TARGET
	echo "$USER soft nofile $_ULIMIT_SOFT_TARGET" | sudo tee -a /etc/security/limits.conf

else

        echo "ulimit -Sn: $_ULIMIT_SOFT All Good!!!"

fi

echo -e "${_CYAN}FILE HANDLING DONE${_RESET}"

