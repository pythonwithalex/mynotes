yum install httpd

use apachectl config test to validate syntax in httpd.conf
Uncomment ServerName value and replace it with www.something.com:80.
note, for selinux, you have to either disable it or set the permissions you didn't even know existed
when you type ls -Zd /var/www/html/
