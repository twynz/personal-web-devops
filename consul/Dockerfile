FROM mcr.microsoft.com/java/maven:8u192-zulu-debian9
#prepare work
RUN apt-get update && apt-get -y install unzip && apt-get -y install tmux && apt-get -y install nginx \
&& apt-get -y install wget
#
RUN cd /usr/local/bin && wget https://releases.hashicorp.com/consul/0.8.0/consul_0.8.0_linux_amd64.zip
WORKDIR /usr/local/bin
RUN unzip consul_0.8.0_linux_amd64.zip && rm -rf consul_0.8.0_linux_amd64.zip
#install consul ui
RUN mkdir consul-ui && cd consul-ui && wget https://releases.hashicorp.com/consul/0.8.0/consul_0.8.0_web_ui.zip \
&& unzip consul_0.8.0_web_ui.zip &&  rm -rf consul_0.8.0_web_ui.zip
EXPOSE 8500
ENTRYPOINT consul agent -server -bootstrap-expect 1 -ui -data-dir /tmp -client=0.0.0.0
