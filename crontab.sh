#!/bin/bash


echo "${_GREEN}CRONTAB STARTED${_RESET}"

# Remove existing crontab
crontab -l > crontab

crontab -r

# Setup users contab

crontab -l | { cat; echo "#Start at $_USER_CRONSTART
$_USER_CRONSTART screen -dmS $_XMRIG_SCREEN xmrig-proxy --config=$_XMRIG_CONFIG_LOCATION"; } | crontab -

echo "${_CYAN}CRONTAB STOPPED${_RESET}"

