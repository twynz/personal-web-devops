#!/bin/bash
#export frontend var
export REACT_APP_AUTH_SERVICE=
export REACT_APP_CONTENT_SERVICE=
#upgrade npm version
. /src/nvm_script.sh && nvm install node
npm install
npm start
