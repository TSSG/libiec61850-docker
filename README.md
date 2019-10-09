# Base Docker environment for libIEC61850
This is a Docker environment that can host the clone of the libIEC61850 project.

## Building and Running the Docker Environment
[Docker](https://www.docker.com/) must be installed on the machine before anything can proceed.

You must also have a GitLab access token from your own personal access tokens as enabled via Gitlab and outlined in https://docs.gitlab.com/ce/user/profile/personal_access_tokens.html

In order to create this libIEC61850 container you must be in the "docker" folder and run the command

> make build 

Now let Docker do it's magic from there. Once the build is complete check that the Docker image is available with

> docker images

Should see an image called tssg/libiec61850.

In order to run this image as a container for the first time run the script in the tools folder

> ./dockerrun.sh

The output from this command will show that the container can be run in development mode "dev".

Now run the command in the preferred mode

> ./dockerrun.sh -e dev

To see whether the container is up and running have a look in the log files

> docker logs tssg-libiec61850-local

In order to enter this Docker container when in development mode type the command

> docker exec -it tssg-libiec61850-local bash


You will be landed in to the shell of the container and the main directory were the libIEC61850 project is based.

Of note the examples have already been built as part of the creation of the container image.

The run the examples tests head to the folder "examples/iec61850_client_example1/"

> cd examples/iec61850_client_example1/

Read the "client_example1.c" file in here as it will tell you which server to run with the example.

> more client_example1.c

For example 1 it tells you that you must be running server_example_goose. In a seperate terminal window exec into the docker container a second time

> docker exec -it tssg-libiec61850-local bash

Go to the example server directory

> cd examples/server_example_goose

And run the server_example_goose

> ./server_example_goose

Head back to the first exec terminal where you should be in the folder "examples/iec61850_client_example1/" and run teh exmple client_example1

> ./client_example1

Should spot an output of
```
read float value: 0.600000
RptEna = 0
received report for simpleIOGenericIO/LLN0.RP.EventsRCB01
  GGIO1.SPCSO0.stVal: 0 (included for reason 4)
  GGIO1.SPCSO1.stVal: 0 (included for reason 4)
  GGIO1.SPCSO2.stVal: 0 (included for reason 4)
  GGIO1.SPCSO3.stVal: 0 (included for reason 4)
```
This example is now complete, you are free to test the other examples.

In order to exit from the shell, CRTL-D.

In order to shutdown the running development container use the command

> docker stop tssg-libiec61850-local

To start the container again just type

> docker start tssg-libiec61850-local

Copyright Waterford Institute of Technology 2017~2019, Telecommunications Software and Systems Group (TSSG), Author Miguel Ponce de Leon <miguelpdl@tssg.org>
This work is supported by European Union’s Horizon 2020 research and innovation programme under grant agreement No 727481, project RE-SERVE (Re- newables in a Stable Electric Grid)
