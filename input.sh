#!/bin/bash

# Ask user questions
# Capture input
# if setting already exist use existing

echo -e "${_GREEN}USER SETTINGS STARTED${_RESET}"

if [ -f $_WORK_DIR/$_MYSETTINGS_FILE ]; then

	# Call function

	load_mysettings

        my_config_json

else
	echo -e "  ${_YELLOW}Opt for default settings or enter your own.\n"

	echo -e "  No - 'config.json' created with values from 'settings.sh'."
	echo -e "  Yes - 'config.json' created with values from 'mysettings.sh' (recomended).\n"

	echo -e "  When 'mysettings.sh' exists this prompt will be skipped at future installation."
	echo -e "  Own settings is recomended to avoid your settings being overidden in upgrades.${_RESET}\n"


	prompt_confirm "Enter your own settings?" 

	if [ "$?" -eq 0 ]; then

		# Create a file

		touch $_MYSETTINGS_FILE_LOCATION 
		chmod +x $_MYSETTINGS_FILE_LOCATION
		echo "#!/bin/bash" > $_MYSETTINGS_FILE_LOCATION

		# Prompt user input

		echo "Current Algo: $_POOLS_ALGO"
                read -p "Enter new Algo: " _POOLS_ALGO
		echo "_POOLS_ALGO=\"$_POOLS_ALGO\"" >> $_MYSETTINGS_FILE_LOCATION

		echo "Current pool URL: $_POOLS_URL"
		read -p "Enter new pool URL: " _POOLS_URL
		echo "_POOLS_URL=\"$_POOLS_URL\"" >> $_MYSETTINGS_FILE_LOCATION

		echo "Current Receive Wallet address (user): $_POOLS_USER"
		read -p "Enter new Receive Wallet address: " _POOLS_USER
		echo "_POOLS_USER=\"$_POOLS_USER\"" >> $_MYSETTINGS_FILE_LOCATION
		
		echo "Current pool password: $_POOLS_PASS"
		read -p "Enter new pool password: " _POOLS_PASS
		echo "_POOLS_PASS=\"$_POOLS_PASS\"" >> $_MYSETTINGS_FILE_LOCATION

		echo "Current HTTP Access Token: $_HTTP_ACCESS_TOKEN"
                read -p "Enter new HTTP Access Token: " __HTTP_ACCESS_TOKEN
                echo "_HTTP_ACCESS_TOKEN=\"$_HTTP_ACCESS_TOKEN\"" >> $_MYSETTINGS_FILE_LOCATION

	fi
	
	# Call function

	load_mysettings

	my_config_json

fi

echo "${_CYAN}USER SETTINGS STOPPED${_RESET}"
