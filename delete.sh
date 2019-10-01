#!/bin/bash
while true
do
# Zero padded days using %d instead of %e
  DAYSAGO=`date --date="${DAYS_COUNT_DELETE} days ago" +%Y%m%d`
  ALLLINES=`curl -s -k --cacert ./ca.crt --cert ./elasticlogrotate.pem --key ./elasticlogrotate.key -XGET "${ELASTIC_HOST}:${ELASTIC_PORT}/_cat/indices?v" | egrep ${INDEX_NAME}`
  
  echo
  echo `date`" THIS IS WHAT SHOULD BE DELETED FOR ELK:"
  echo
  
  echo "$ALLLINES" | while read LINE
  do
    FORMATEDLINE=`echo $LINE | awk '{ print $3 }' | awk -F'-' '{ print $2 }' | sed 's/\.//g' ` 
    if [ "$FORMATEDLINE" -lt "$DAYSAGO" ]
    then
      TODELETE=`echo $LINE | awk '{ print $3 }'`
      echo "$ELASTIC_HOST:$ELASTIC_PORT/$TODELETE"
    fi
  done
  
  echo
  #echo -n "if this make sence, Y to continue N to exit [Y/N]:"
  #read INPUT
  INPUT=yes
  if [ "$INPUT" == "Y" ] || [ "$INPUT" == "y" ] || [ "$INPUT" == "yes" ] || [ "$INPUT" == "YES" ]
  then
    echo "$ALLLINES" | while read LINE
    do
      FORMATEDLINE=`echo $LINE | awk '{ print $3 }' | awk -F'-' '{ print $2 }' | sed 's/\.//g' `
      if [ "$FORMATEDLINE" -lt "$DAYSAGO" ]
      then
        TODELETE=`echo $LINE | awk '{ print $3 }'`
        /usr/bin/curl -XDELETE -k --cacert ./ca.crt --cert ./elasticlogrotate.pem --key ./elasticlogrotate.key $ELASTIC_HOST:$ELASTIC_PORT/$TODELETE
        sleep 1
        fi
    done
  else 
    echo SCRIPT CLOSED BY USER, BYE ...
    echo
    exit
  fi
  sleep $DELETESCRIPT_TIME
done