#!/bin/bash

# Source: https://gist.github.com/earthgecko/3089509
# Generates a random alphanumeric string of length 48 (like a jupyter notebook token i.e. c8de56fa4deed24899803e93c227592aef6538f93025fe01) if JUPYTER_TOKEN doesn't aready exist
if [ -z "${JUPYTER_TOKEN:-}" ];
then
   NEW_UUID=$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 48 | head -n 1)
else
   NEW_UUID="$JUPYTER_TOKEN"
fi

# Note: this function passes in a mocked jupyter token so that we can run this container as if it is a notebook within Gradient
function print_message
{
    echo "http://localhost:8888/?token=${NEW_UUID}"
    echo "http://localhost:8888/\?token\=${NEW_UUID}" 

}

print_message

PASSWORD=${NEW_UUID} /usr/local/bin/code-server --host 0.0.0.0 --port 8888
