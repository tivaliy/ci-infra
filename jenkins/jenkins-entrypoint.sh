#!/bin/bash
set -e

source /usr/local/bin/gen-ssh-key.sh

echo "Start Jenkins"

# if `docker run` first argument start with `--` the user is passing jenkins launcher arguments
if [[ $# -lt 1 ]] || [[ "$1" == "--"* ]]; then
    exec /bin/tini -- /usr/local/bin/jenkins.sh "$@"
fi

# As argument is not jenkins, assume user want to run his own process, for example a `bash` shell to explore this image
exec "$@"
