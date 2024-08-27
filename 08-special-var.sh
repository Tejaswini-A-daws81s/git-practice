#!/bin/bash

echo "All variables: $@"
echo "The number of variables passed to the script: $#"
echo "The name of the script is: $0"
echo "Current working directory is: $PWD"
echo "Home directory of the current user: $home"
echo "Process ID of the current shell script: $$"
sleep 100 &
echo "Process id of last background command: $!"