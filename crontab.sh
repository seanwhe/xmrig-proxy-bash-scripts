#!/bin/bash


echo "${_GREEN}CRONTAB STARTED${_RESET}"

# Remove existing crontab
crontab -l > crontab

crontab -r

# Setup users contab

crontab -l | { cat; echo "#Start at $_USER_TIMESTART
$_USER_TIMESTART screen -dmS $_XMRIG_SCREEN xmrig-proxy --config=$_XMRIG_CONFIG_LOCATION"; } | crontab -

echo "${_CYAN}CRONTAB STOPPED${_RESET}"

