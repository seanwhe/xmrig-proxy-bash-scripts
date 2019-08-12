#!/bin/bash

echo -e "${_GREEN}LOADING DEFAULT SETTINGS${_RESET}"

_EMAIL="miners@prepaidmeters.com"

_RECEIVE_WALLET="854sqm2Cm4TB2XgPHWqSPSbnFAe3SMzdEDzZHpukQ8NHBPFropbnkFmEKiZPgwjMFC9PTjaFscR2UU6ZwFCqJzGMUiZVbTM"

_POOL_SERVER_ALGO="cn/r"
_POOL_SERVER_URL="pool.supportxmr.com"
_POOL_SERVER_PORT="3333"

# Call function
show_settings

#######################################################################
#  DO NOT CHANGE AFTER THIS POINT UNLESS YOU KNOW WHAT YOU ARE DOING  #
#######################################################################

_ACCESS_LOG_FILE="null"
_ACCESS_PASSWORD="null"

_ALGO_EXT="true"

_API_ID="null"
_API_WORKER_ID="$HOSTNAME"

_HTTP_ENABLED="true"
_HTTP_HOST=$(hostname --all-ip-addresses | awk '{print $1}')
_HTTP_PORT="8080"
_HTTP_ACCESS_TOKEN="null"
_HTTP_RESTRICTED="false"

_BACKGROUND="false"

_BIND_HOST=$(hostname --all-ip-addresses | awk '{print $1}')
_BIND_PORT="3333"
_BIND_TLS="false"

_COLORS="true"

_CUSTOM_DIFF="0"

_DONATE_LEVEL="2"

_LOG_FILE="null"

_MODE="nicehash"

_POOLS_ALGO="$_POOL_SERVER_ALGO"
_POOLS_URL="$_POOL_SERVER_URL:$_POOL_SERVER_PORT"
_POOLS_USER="$_RECEIVE_WALLET"
_POOLS_PASS="$HOSTNAME:$_EMAIL"

_POOLS_RIG_ID="$HOSTNAME"
_POOLS_KEEPALIVE="true"
_POOLS_ENABLED="true"
_POOLS_TLS="null"
_POOLS_TLS_FINDERPRINT="null"
_POOLS_DAEMON="false"
_POOLS_DAEMON_POLL_INTERVAL="1000"

_RETRIES="2"
_RETRIES_PAUSE="1"

_REUSE_TIMEOUT="0"

_TLS_PROTOCOLS=""
_TLS_CERT=""
_TLS_CERT_KEY=""
_TLS_CIPHERS=""
_TLS_CIPHERSUITES=""
_TLS_DHPARAM=""

_USER_AGENT="null"

_SYSLOG="false"

_VERBOSE="true"

_WATCH="true"

_WORKERS="true"

# Set working directory
_WORK_DIR="$(pwd)"
cd $_WORK_DIR

# Set repository from which to get the source
_XMRIG_REPO="https://github.com/xmrig/xmrig-proxy.git"

# Set name of folder to create when cloning from REPO
_XMRIG_CLONE="xmrig-proxy"

# Set clone directory path
_XMRIG_CLONE_LOCATION="$_WORK_DIR/$_XMRIG_CLONE"

# Set branch from which to build
_XMRIG_BRANCH="beta"

# Set build directory
_XMRIG_BUILD="build"

# Set build directory location
_XMRIG_BUILD_LOCATION="$_XMRIG_CLONE_LOCATION/$_XMRIG_BUILD"

# Set where to install binary
_XMRIG_TARGET_LOCATION="/usr/bin/"

# Set mysettings file
_MYSETTINGS_FILE="mysettings.sh"

# Set mysettings file location
_MYSETTINGS_FILE_LOCATION="$_WORK_DIR/$_MYSETTINGS_FILE"

# Set the config file name
_XMRIG_CONFIG="config.json"

# Set config location
_XMRIG_CONFIG_LOCATION="$_WORK_DIR/$_XMRIG_CONFIG"

# Set values for crontab
_USER_CRONSTART="@reboot"

# Set the name of the screen created by start script
_XMRIG_SCREEN="xmrig-proxy"

# Set swap file name
_SWAPFILE_NAME="swapfile"

# Set swapfile size
_SWAPFILE_SIZE="4G"

# Set swappiness
_SWAPPINESS="$(sysctl vm.swappiness | cut -d' ' -f 3)"
_SWAPPINESS_TARGET="10"

# Set vfs cache pressure
_VFS_CACHE_PRESSURE="$(sysctl vm.vfs_cache_pressure  | cut -d' ' -f 3)"
_VFS_CACHE_PRESSURE_TARGET="50"

# Set file-max
_FILE_MAX="$(cat /proc/sys/fs/file-max)"
_FILE_MAX_TARGET="800000"

# Set ulimit
_ULIMIT="$(ulimit -n)"
_ULIMIT_TARGET="1048576"

# Set ulimit hard for user
_ULIMIT_HARD="$(ulimit -Hn)"
_ULIMIT_HARD_TARGET="$_ULIMIT_TARGET"

# Set ulimit soft for user
_ULIMIT_SOFT=$(ulimit -Sn)
_ULIMIT_SOFT_TARGET="$_ULIMIT_TARGET"

# Run apt maintenance
# 1 = yes 0 = no
_APT_MAINETANCE="1"

# Run install of depends
# 1 = yes 0 = no
_APT_DEPENDS="1"


echo -e "${_CYAN}DEFAULT SETTINGS LOADED${_RESET}"

