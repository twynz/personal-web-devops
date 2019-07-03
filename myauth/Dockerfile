FROM mcr.microsoft.com/java/maven:8u192-zulu-debian9
#install git
RUN apt-get update &&  apt install -y git && mkdir /src
#specify workdir and download source code
ADD . /src
RUN sh /src/get_project.sh
WORKDIR /src/personal-web-auth
#RUN mvn clean install
EXPOSE 10001:10001
CMD /bin/bash
