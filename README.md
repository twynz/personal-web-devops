Used for spring cloud backend of my personal web.

1.To start dependencies:

   docker-compose -f personal-web.yaml up -d

2.To check all docker containers:
   
   docker ps -a -q

3.Clear them all:
   
   docker rm $(docker ps -aq)
