#!/bin/bash

echo -e "${_GREEN}LOADING FUNCTIONS${_RESET}"

function prompt_confirm() {
  while true; do
    read -r -n 1 -p "${1:-Continue?} [y/n]: " REPLY
    case $REPLY in
      [yY]) echo ; return 0 ;;
      [nN]) echo ; return 1 ;;
      *) printf " \033[31m %s \n\033[0m" "invalid input [y/n]"
    esac 
  done  
}

function show_settings () {
	echo "${_CYAN}Settings from loaded environment:${_RESET}"

	echo "${_GREEN}Pool Algo:${_RESET}: $_POOLS_ALGO"
        echo "${_GREEN}Pool URL:${_RESET}: $_POOLS_URL"
        echo "${_GREEN}Recieve Wallet:${_RESET}: $_POOLS_USER"
        echo "${_GREEN}Pool Password:${_RESET}: $_POOLS_PASS"
}

function show_mysettings () {
        if [ -f $_WORK_DIR/$_MYSETTINGS_FILE ]; then
		load_mysettings
		echo "${_CYAN}Settings from mysettings.sh:${_RESET}"
                
		echo "${_GREEN}Pool URL:${_RESET}: $_POOLS_URL"
                echo "${_GREEN}Recieve Wallet:${_RESET}: $_POOLS_USER"
		echo "${_GREEN}Pool Password:${_RESET}: $_POOLS_PASS"

        fi
}

function load_mysettings () {
	if [ -f $_WORK_DIR/$_MYSETTINGS_FILE ]; then
                . $_MYSETTINGS_FILE
        fi
}

function my_config_json () {
	_CONFIG_JSON=$(jo -p -B access-log-file=$_ACCESS_LOG_FILE access-password=$_ACCESS_PASSWORD algo-ext=$_ALGO_EXT api=$(jo id=$_API_ID worker-id=$_API_WORKER_ID) http=$(jo enabled=$_HTTP_ENABLED host=$_HTTP_HOST port=$_HTTP_PORT access-token=$_HTTP_ACCESS_TOKEN restricted=$_HTTP_RESTRICTED) background=$_BACKGROUND bind=$(jo host=$_BIND_HOST port=$_BIND_PORT tls=$_BIND_TLS) colors=$_COLORS custom-diff=$_CUSTOM_DIFF donate-level=$_DONATE_LEVEL log-file=$_LOG_FILE mode=$_MODE pools=$(jo -a $(jo algo=$_POOLS_ALGO url=$_POOLS_URL user=$_POOLS_USER pass=$_POOLS_PASS rig-id=$_POOLS_RIG_ID keepalive=$_POOLS_KEEPALIVE enabled=$_POOLS_ENABLED tls=$_POOLS_TLS tls-fingerprint=$_POOLS_TLS_FINGERPRINT daemon=$_POOLS_DAEMON)) daemon-poll-interval=$_POOLS_DAEMON_POLL_INTERVAL retries=$_RETRIES retry-pause=$_RETRIES_PAUSE reuse-timeout=$_REUSE_TIMEOUT tls=$(jo protocols=$_TLS_PROTOCOLS cert=$_TLS_CERT cert_key=$_TLS_CERT_KEY ciphers=$_TLS_CIPHERS ciphersuites=$_TLS_CIPHERSUITES dhparam=$_TLS_DHPARAM ) user-agent=$_USER_AGENT syslog=$_SYSLOG verbose=$_VERBOSE watch=$_WATCH workers=$_WORKERS)
}

function build_xmrig () {
        if [ -d $_XMRIG_BUILD_LOCATION ]; then
                # Remove existing build directory
                rm -rf $_XMRIG_BUILD_LOCATION

                # Make new build directory
                mkdir $_XMRIG_BUILD_LOCATION
        else
                # Make new build directory
                mkdir $_XMRIG_BUILD_LOCATION
        fi

        # Change to build directory
        cd $_XMRIG_BUILD_LOCATION

        # Configure cmake scafolding
        cmake .. 

        # Compile the software
        make
}


function start_xmrig () {
        screen -dmS $_XMRIG_SCREEN xmrig-proxy --config=$_XMRIG_CONFIG_LOCATION
}


function stop_xmrig () {
        screen -S $_XMRIG_SCREEN -X kill
}


echo -e "${_CYAN}FUNCTIONS LOADED${_RESET}"
