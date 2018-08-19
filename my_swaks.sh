#!/bin/sh

ALERT_MAIL_HAS_BEEN_SENT=1

while true
do
 swaks $SWAKS_TEST_CMD
 RETVAL=$?
 DATE=`date '+%Y-%m-%d %H:%M:%S'`
 if [ $RETVAL -eq 0 ]; then
#   echo Success at $DATE
   if [ $ALERT_MAIL_HAS_BEEN_SENT -eq 0 ]; then
#     echo $SWAKS_ALERT_DOWN_CMD
     echo Success at $DATE
     swaks $SWAKS_ALERT_DOWN_CMD --header "Subject: $SWAKS_ALERT_DOWN_SUBJECT" --body "$SWAKS_ALERT_DOWN_BODY"
     ALERT_MAIL_HAS_BEEN_SENT=1
   fi
   ALERT_MAIL_HAS_BEEN_SENT=1
 else
#   echo Failure at $DATE
   if [ $ALERT_MAIL_HAS_BEEN_SENT -eq 1 ]; then
#     echo $SWAKS_ALERT_UP_CMD
     echo Failure at $DATE
     swaks $SWAKS_ALERT_UP_CMD --header "Subject: $SWAKS_ALERT_UP_SUBJECT" --body "$SWAKS_ALERT_UP_BODY"
     ALERT_MAIL_HAS_BEEN_SENT=0
   fi
 fi
sleep $INTERVAL_CHECK
done 
