#!/bin/sh


# Print Help
if [ "$1" == "help" ] || [ "$1" == "-h" ]
then
  echo "Usage:"
  echo "  $1 File Command Arguments"

#Main Function
else
  echo "Running inotifywait on:" "$1"
  sleep 1
  clear
  while true
  do
    inotifywait -e close_write -qq "$1" ; $2 $3 
  done
fi
