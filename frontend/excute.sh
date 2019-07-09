#!/bin/bash
function export_front_end_IP() {
   export REACT_APP_AUTH_SERVICE=$PUBLIC_IP
   export REACT_APP_CONTENT_SERVICE=$PUBLIC_IP
}


#get public ip
PUBLIC_IP="$(wget -qO- https://ipecho.net/plain ; echo)"
#export frontend var
export_front_end_IP
. /src/nvm_script.sh && nvm install node
npm install
npm start
