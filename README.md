# swaks

Simple shell script using swaks https://github.com/Flowman/docker-swaks to periodically check availability of a smtp server
The shell script will send an email when a failure is detected, and will send another one when the server is avail again

images are available for both amd64 and arm architectures at ofthesun9/swaks:latest

Dockerfile from https://github.com/Flowman/docker-swaks

The script need 7 env variable :

INTERVAL_CHECK (in seconds) for example : INTERVAL_CHECK=60

SWAKS_ALERT_UP_CMD for example : -f xxxxx@gmail.com -t xxxxxx@gmail.com -s smtp.gmail.com -p 25 -au xxxxx@gmail.com -ap password -tls

SWAKS_ALERT_UP_SUBJECT for example : Alert mbl.leu.ofthesun.net is not responding %DATE%

SWAKS_ALERT_UP_BODY : Alert mbl.leu.ofthesun.net is not responding %DATE%

SWAKS_ALERT_DOWN_CMD for example : -f xxxxx@gmail.com -t xxxxxx@gmail.com -s smtp.gmail.com -p 25 -au xxxxx@gmail.com -ap password -tls

SWAKS_ALERT_DOWN_SUBJECT for example : Alert mbl.leu.ofthesun.net is responding again %DATE%

SWAKS_ALERT_DOWN_BODY : Alert mbl.leu.ofthesun.net is responding again %DATE%
