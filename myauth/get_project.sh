#!/bin/bash
export AUTH_DIRECTORY=/src/personal-web-auth
echo $AUTH_DIRECTORY
if [ -d "$AUTH_DIRECTORY" ]; then
  cd /src/personal-web-auth
  git pull
else
  cd /src
  git clone https://github.com/twynz/personal-web-auth.git
fi
