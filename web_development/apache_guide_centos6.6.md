+ yum install httpd-manual httpd
+ chkconfig httpd –level 35 on
+ vim /etc/sysconfig/iptables
+ copy the default port 22 line and replace 22 with 80 to allow http requests
+ use apachectl config test to validate syntax in httpd.conf
+ Uncomment ServerName value and replace it with www.something.com:80.
+ note, for selinux, you have to either disable it or set the permissions you didn't even know existed
when you type 
```bash
ls -Zd /var/www/html/
```
