CentOS 7 Admin Notes
====================
+ check default run - levels

    systemctl get-default
    systemctl list-units --type=target
    set to runlevel 3: systemctl set-default multi-user.target

+ create a sysadmin group

        groupadd sysadmin 

+ create yourself a user account with group sysadmin and create a group for your account with the same name,giving yourself the bash shell by default

        adduser -G sysadmin -U -s /usr/bin/bash/ alexr

