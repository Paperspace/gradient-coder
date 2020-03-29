#!/bin/bash

# Note: this function passes in a mocked jupyter token so that we can run this container as if it is a notebook within Gradient
function print_message
{
    echo 'http://localhost:8888/?token=c8de56fa4deed24899803e93c227592aef6538f93025fe01' 
    echo 'http://localhost:8888/\?token\=c8de56fa4deed24899803e93c227592aef6538f93025fe01' 

}

print_message

/usr/local/bin/code-server --host 0.0.0.0 --port 8888 --auth none
