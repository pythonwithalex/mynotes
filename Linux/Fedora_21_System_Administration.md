## List of Topics

+ command index
+ Network Configuration
+ creating partitions and filesystems
+ diagnosing
+ users and groups
+ apache
+ lamp
+ openldap
+ mail server (dovecot)
+ nfs
+ printing

## Commands
**lsof -i**: open ports

**df -T**: show mounted filesystems with FileSystem Type information

**telnet**
+ telnet www.google.com 80
+ GET / HTTP/1.1
+ host: www.google.com


**set SELinux to disabled**

vim /etc/selinux/config

** Systemctl **:
+ systemctl stop
+ systemctl start [httpd]
+ systemctl restart
+ systemctl reload
+ systemctl try-restart
+ systemctl kill
+ systemctl is-active
+ systemctl status


**Change Run Level**
+ change /etc/inittab runlevel value to 3(multi-user, text) or 5(gui)
+ systemctl set-default multi-user.target or graphical.target

**tar**: 

**zcat**: view a compressed log

**printing**:

## Network Config
+ ifconfig still supported
+ NetworkManager is the new utility
+ nmtui is a tui for basic config

## Installation 

**kickstart**: Use the /root/anaconda-cfg.ks file to automate your installs by putting in a ks='   ' value at the command line in the boot loader menu

## Users and Groups

/etc/passwd
each user gets an identically named group account


## OpenLDAP
+ LDAP: Light Weight Access Protocol
+ Directory of typed and ordered data 
+ Information used by a lot of applications, Information accessible from many locations (centralized on a server)
+ that describes a system of commonly accessed information used for authentication
+ specialized database that is optimized for reads, not writes (i.e., not like a print queue, which is frequently updated)
+ Usually don't support transactions
+ Access Methods aren't as complex as SQL, usually very simple.
+ Runs over TCP/IP

[ref1: https://sites.google.com/site/openldaptutorial/Home/openldap---beginners/benefits, ref2: https://www.youtube.com/watch?v=5VxdqkjFwBs]

OpenLdap is implemented as a database called a **Directory**
mostly reads, not so many modifications/writes.
add info once, use for authentication many places.
convenient restrictions for anonymous and regular users.

Purpose: "used to authenticate from a single and common base of information regardless of location or application"
Share information among many applications

**Terminology**
+ Entry/Object: a node in the Directory Information Tree
+ Directory Information Tree: The Entire Database
+ Root DSE: head node
+ entry
+ distinguised name, DN
+ attribute
+ objectclasses
+ schema

Schema Files provide the structure/ container for the database
The schema files store the attributes and object classes
schema file examples: misc.schema, inetorgperson.schema, nis.schema

objectclasses determine which node, attributes determine what its properties (key-value pairs) are

## LAMP

+ disable selinux
+ yum install httpd php php-gd mysql-server php-mysql phpMyAdmin // this will install mariadb 
+ systemctl start apache
+ systemctl start mysqld
+ mysql -u root
+ mysql> set password = password('your password');
+ mysql> exit
+ mysql -p -u root (then enter previous password);
+ vim /etc/phpMyAdmin/config.inc.php and replace MySQL user and password lines with 'root' and the password you just created.
+ systemctl restart httpd
+ create a file called 'phptest.php' in /var/www/html with the following info
```php
<?php phpinfo(); ?>
```
+ curl 127.0.0.1/phptest.php
+ checkconfig --levels 235 httpd on
+ checkconfig --levels 235 mysqld on
