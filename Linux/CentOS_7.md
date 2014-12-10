CentOS 7 Admin Notes
====================

+ create a sysadmin group

    groupadd sysadmin 

+ create yourself a user account with group sysadmin and create a group for your account with the same name,giving yourself the bash shell by default
    adduser -G sysadmin -U -s /usr/bin/bash/ alexr
