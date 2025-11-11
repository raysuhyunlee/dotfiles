#!/bin/bash

function get_os() {
	kernelName="$(uname -s)"

	if [ "$kernelName" == "Darwin" ]; then
		os="macos"
	elif [ "$kernelName" == "Linux" ] && \
			 [ -e "/etc/os-release" ];	then
		os="$(. /etc/os-release; printf "%s" "$ID")"
	fi
	
	printf "%s" "$os"
}

source "${INSTALL_DIR}/$(get_os)/install.sh"

unset get_os;
