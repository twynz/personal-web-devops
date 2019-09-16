!!!Remember param sequence, docker run <container:name> -p <port>:<port> will not expose port to 0.0.0.0!!!
    
Used for spring cloud backend of my personal web.

Can start all services and dependencies using docker compose:
    
     docker-compose up -d
    
If want to force rebuild all images:
   
     docker-compose up --force-recreate  
     
Note for build service images:

> Start dependencies:
1.To start dependencies, comment out serice config in yaml file:

     docker-compose up -d

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

!WANT TO RECLAIM DOCKER SPACE IF TOO MANY IMAGES
    
     sudo docker system prune -af

!For future, integrate docker file start image into docker compose, sample:

# docker-compose.yml
version: '2'

    services:
      web:
        build: .
        # build from Dockerfile
        context: ./Path
        dockerfile: Dockerfile
        ports:
         - "5000:5000"
        volumes:
         - .:/code
      redis:
        image: redis
  
  
