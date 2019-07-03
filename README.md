Used for spring cloud backend of my personal web.

1.To start dependencies:

   docker-compose -f personal-web.yaml up -d

2.To check all docker containers:
   
   docker ps -a -q

3.Clear them all:
   
   docker rm $(docker ps -aq)

In order to run docker container with env file, should use command like this(also mapping conatiner port to host port):

   docker run -it -p 10001:10001 --env-file=./env.sh  myauth:test /bin/bash
