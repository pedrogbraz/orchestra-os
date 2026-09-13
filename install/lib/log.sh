#!/usr/bin/env bash

_c_info='\033[1;34m'
_c_ok='\033[1;32m'
_c_warn='\033[1;33m'
_c_err='\033[1;31m'
_c_reset='\033[0m'

info() { printf "${_c_info}==>${_c_reset} %s\n" "$*"; }
ok()   { printf "${_c_ok}==>${_c_reset} %s\n" "$*"; }
warn() { printf "${_c_warn}==> WARNING:${_c_reset} %s\n" "$*" >&2; }
err()  { printf "${_c_err}==> ERROR:${_c_reset} %s\n" "$*" >&2; }
