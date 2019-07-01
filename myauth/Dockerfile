FROM mcr.microsoft.com/java/maven:8u192-zulu-debian9
#install git
RUN apt-get update &&  apt install -y git
#specify workdir
RUN mkdir /src && cd /src
#download source code
RUN git clone https://github.com/twynz/personal-web-auth.git
RUN cd personal-web-auth && mvn clean install
EXPOSE 10001:10001
WORKDIR /src/personal-web-auth
ENTRYPOINT mvn spring-boot:run
