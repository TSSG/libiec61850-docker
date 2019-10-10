#!/bin/bash

# Copyright Waterford Institute of Technology 2017
# Telecommunications Software and Systems Group (TSSG)
# Author Miguel Ponce de Leon <miguelpdl@tssg.org>

# Run the command with a parameter
# > ./dockerrun.sh -e prod reservemsgbroker.tssg.org

function iHelp () {
# Using a help doc with standard out.
cat <<-END
Usage:
------
  -e environment servername
    e.g. -e dev
END
}

function run_container () {

# Run the main container.

docker run \
    --privileged \
    --name ${CONTAINER_NAME} \
    -d -t tssg/libiec61850

}


if [ -z "$1" ] ; then
 iHelp
 exit
else
 while [ -n "$1" ]; do
   case "$1" in
       -h | --help)
           iHelp
           exit
           ;;
       -e )
           if [ "$2" == "prod" ] ; then
             if [ -z "$3" ] ; then
              iHelp
              exit
            else
              exit
            fi
           elif [ "$2" == "dev" ] ; then
              # Give the container a meaningful name
              CONTAINER_NAME=tssg-libiec61850-local

              # Set the port
              #PORT="-p 1883:1883"

              # Set up the volumes to be attached
              #VOLUMES="-v $(pwd)/../src/local/conf/mosquitto.conf:/mosquitto/config/mosquitto.conf -v $(pwd)/../src/local/log/:/mosquitto/log/ "

              #Run this Container
              run_container
              exit
           else
             iHelp
             exit
           fi
           ;;
   esac

   iHelp
   exit
 done
fi
