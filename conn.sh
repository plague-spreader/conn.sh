#!/usr/bin/env sh

die() {
    >&2 echo "$@"
    exit 1
}

command -v fzf >&/dev/null || die Please install fzf \
                                  \(https://github.com/junegunn/fzf\)

XDG_CONFIG_HOME=${XDG_CONFIG_HOME:-$HOME/.config}
CONNECTIONS_FILE=${XDG_CONFIG_HOME}/connections_file

[ -f ${CONNECTIONS_FILE} ] || die ${CONNECTIONS_FILE} does not exist.

conn=$(sed -e 's/ / - /' ${CONNECTIONS_FILE} | fzf | cut -d\  -f1)

[ $? -eq 0 -a "${conn}" ] || exit 0

echo Connecting to ${conn} ...
echo

xdg-open ${conn}
