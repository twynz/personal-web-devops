FROM mcr.microsoft.com/java/maven:8u192-zulu-debian9
#install git
RUN apt-get update &&  apt install -y git && mkdir /src
#install npm
RUN apt install -y curl \
   && curl -sL https://deb.nodesource.com/setup_6.x | bash - \
   && apt-get install -y nodejs && apt-get install -y npm
RUN curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.2/install.sh | bash
ADD . /src
RUN sh /src/get_project.sh
WORKDIR /src/my-react-web
ENV REACT_APP_AUTH_SERVICE=hostIP
ENV REACT_APP_CONTENT_SERVICE=hostIP
EXPOSE 3000
RUN ["chmod", "+x", "/src/execute.sh"]
ENTRYPOINT ["/src/execute.sh"]

