#!/bin/bash
export FRONTEND_DIRECTORY=/src/my-react-web
echo CONTENT_DIRECTORY
if [ -d "$FRONTEND_DIRECTORY" ]; then
  cd /src/my-react-web
  git pull
else
  cd /src
  git clone https://github.com/twynz/my-react-web.git
fi
