#!/usr/bin/env sh

[ $# -lt 1 ] && {
	>&2 echo "Usage: $0 <telnet URL>"
	exit 1;
}

url=${1#telnet://}
host=${url%:*}
port=${url#*:}

[ $host = $port ] && port=""

telnet $host $port
