#!/bin/bash
export CONTENT_DIRECTORY=/src/personal-web-content-service
echo CONTENT_DIRECTORY
if [ -d "$CONTENT_DIRECTORY" ]; then
  cd /src/personal-web-content-service
  git pull
else
  cd /src
  git clone https://github.com/twynz/personal-web-content-service.git
fi
