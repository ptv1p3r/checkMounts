#! /bin/bash

# space separated list with full path of mounts to check
MOUNTSLIST="/home/pi/downloads /home/pi/filmes /home/pi/series /home/pi/docker_backup"
# email to receive notification on mount error
EMAIL="pedro.roldan@gmail.com"


echo "Checking mounting list"

for mount in $MOUNTSLIST;
do
        if ! mountpoint -q $mount;
        then
                echo "$mount is not mounted, attempting to mount..."
                mount $mount
                if ! mountpoint -q $mount;
                then
                        echo "$mount is not mounted..attempt failed"
                        echo "Mounting of $mount failed at $(TZ=":Europe/Lisbon" date)" | mail -s "[Media Server Notification] Mount fail" $EMAIL
                fi
        else
                echo "$mount is mounted."
        fi
done
