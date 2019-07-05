Used for spring cloud backend of my personal web.

> Start dependencies:
1.To start dependencies:

     docker-compose -f personal-web.yaml up -d

2.To check all docker containers:
   
     docker ps -a -q

3.Clear them all:
   
     docker rm $(docker ps -aq)

> Build docker images
  Sometimes don't need cache to help build layers, need to force rebuild, use command like this:
   
     docker build --no-cache -t myauth:test .
    
> Start service:
In order to run docker container with env file, should use command like this(also mapping conatiner port to host port):
#map service port to host port, in dockerfile, also expose container port

     docker run -it -p 10001:10001 --env-file=./env.sh  myauth:test /bin/bash
   
When using cloud architecture integrate with consul, starting consul using command(-client option allows external address to visit, so in docker container, when accessing docker using host ip, this will work).
  
     consul agent -server -bootstrap-expect 1 -ui -data-dir /tmp -client=0.0.0.0
  
  
