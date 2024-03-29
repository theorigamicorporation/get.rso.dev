#!/usr/bin/env bash
#shellcheck disable=SC2317
_SCRIPT_VERSION="0.1"
_SCRIPT_NAME="GET MACHINE INFO"
###########################
# Configuration
###########################
# NOTE: Put your global configuration here.

###########################
# Functions
###########################
function log() {
    local _BRed='\e[1;31m'    # Red
    local _BYellow='\e[1;33m' # Yellow
    local _BBlue='\e[1;34m'   # Blue
    local _BWhite='\e[1;37m'  # White
    local _NC="\e[m"          # Color Reset
    local _message="$1"
    local _level="$2"
    local _nl="\n"
    _timestamp=$(date +%d.%m.%Y-%d:%H:%M:%S-%Z)
    case $(echo "$_level" | tr '[:upper:]' '[:lower:]') in
    "info" | "information")
        echo -ne "${_BWhite}[INFO][${_SCRIPT_NAME} ${_SCRIPT_VERSION}][${_timestamp}]: ${_message}${_NC}${_nl}"
        ;;
    "warn" | "warning")
        echo -ne "${_BYellow}[WARN][${_SCRIPT_NAME} ${_SCRIPT_VERSION}][${_timestamp}]: ${_message}${_NC}${_nl}"
        ;;
    "err" | "error")
        echo -ne "${_BRed}[ERR][${_SCRIPT_NAME} ${_SCRIPT_VERSION}][${_timestamp}]: ${_message}${_NC}${_nl}"
        ;;
    *)
        echo -ne "${_BBlue}[UNKNOWN][${_SCRIPT_NAME} ${_SCRIPT_VERSION}][${_timestamp}]: ${_message}${_NC}${_nl}"
        ;;
    esac
}
function failure() {
    local _lineno="$2"
    local _fn="$3"
    local _exitstatus="$4"
    local _msg="$5"
    local _lineno_fns="${1% 0}"
    if [[ "$_lineno_fns" != "0" ]]; then _lineno="${_lineno} ${_lineno_fns}"; fi
    log "Error in ${BASH_SOURCE[1]}:${_fn}[${_lineno}] Failed with status ${_exitstatus}: ${_msg}" "ERROR"
}

function get_machine_info() {
    log "Getting machine info" "INFO"
    hostname
    whoami
    uname -a
}

###########################
# Error Handling
###########################
set -eE -o functrace
trap 'failure "${BASH_LINENO[*]}" "$LINENO" "${FUNCNAME[*]:-script}" "$?" "$BASH_COMMAND"' ERR

###########################
# Main
###########################
log "Starting script" "INFO"
get_machine_info

###########################
# Clean Exit
###########################
log "Performing clean exit" "INFO"
exit 0
