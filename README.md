# checkMounts
Bash script that checks for mounts on linux and remounts if droped

- checkMounts.sh as executable -> chmod +x

Dependencies:
- ssmtp
- mailutils

Activated on crontab for every 5m
- */5 * * * * sudo /fullPathTo/checkMounts.sh > /dev/null
