#!/bin/bash
function export_front_end_IP() {
    #first clean previous values
    sed -i -E 's/REACT_APP_AUTH_SERVICE=(.*)/REACT_APP_AUTH_SERVICE=/g' ./Dockerfile
    sed -i -E 's/REACT_APP_CONTENT_SERVICE=(.*)/REACT_APP_CONTENT_SERVICE=/g' ./Dockerfile
    #set ip
    sed -i -E 's/REACT_APP_AUTH_SERVICE=/REACT_APP_AUTH_SERVICE='$PUBLIC_IP'/g' ./Dockerfile
    sed -i -E 's/REACT_APP_CONTENT_SERVICE=/REACT_APP_CONTENT_SERVICE='$PUBLIC_IP'/g' ./Dockerfile
}

function replace_IP() {
    #first clean previous value
    sed -i -E 's/=(.*)/=/g' ./env.sh
    #set new value
    sed -i -E 's/=/='$PUBLIC_IP'/g' ./env.sh
}

function replace_DB() {
    #clear previous set value
    sed -i -E 's/USER_DB_PWD=(.*)/USER_DB_PWD=/g' ./env.sh
    sed -i -E 's/USER_DB_USER=(.*)/USER_DB_USER=/g' ./env.sh
    sed -i -E 's/USER_DB_ADDRESS=(.*)/USER_DB_ADDRESS=/g' ./env.sh
    #set db value
    sed -i -E 's/USER_DB_USER=/USER_DB_USER='$DB_USERNAME'/g' ./env.sh
    sed -i -E 's/USER_DB_PWD=/USER_DB_PWD='$DB_PASSWORD'/g' ./env.sh
    sed -i -E 's/USER_DB_ADDRESS=/USER_DB_ADDRESS=personalwebdb.cj6qmmczghu6.ap-southeast-2.rds.amazonaws.com/g' ./env.sh
}

echo "please input username of db:\n"
read DB_USERNAME
echo "please input password of db:\n"
read DB_PASSWORD
#get public ip
PUBLIC_IP="$(wget -qO- https://ipecho.net/plain ; echo)"
#export frontend var
cd frontend
export_front_end_IP
#replace auth
cd ../myauth
replace_IP
replace_DB
#replace frontend
cd ../content_service
replace_IP
replace_DB
#redirect port 80 to 3000
cd ..
sudo iptables -t nat -A PREROUTING -i eth0 -p tcp --dport 80 -j REDIRECT --to-port 3000






