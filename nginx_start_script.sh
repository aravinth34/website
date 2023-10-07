#!/bin/bash

date=$(date +"%Y-%m-%d %H:%M:%S")
getpid=$(pgrep nginx | wc -l)

if [ "$getpid" = 0 ]
then
  echo "Error on Nginx and stoped at" $date >>/home/maravinth/logs_nginx
  systemctl start nginx | 
  fuser -k 80/tcp >>/home/maravinth/logs_nginx

else
  echo "Nginx is Fine, It is Running at" $date >>/home/maravinth/logs_nginx
fi

exit 0;
