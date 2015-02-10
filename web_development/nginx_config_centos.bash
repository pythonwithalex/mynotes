// as root, install nginx
yum -y install nginx

// create a location for your web root from which you'll serve data 
mkdir /var/www
chown -R nginx:nginx /var/www
chmod 775 /var/www

// start nginx
nginx

// to reload nginx
nginx -s reload

// to terminate nginx fatally
nginx -s stop

// to terminate nginx while letting current requests finish
nginx -s quit

// to test the configuration files
nginx -t 

// see the process and what it's using for a configuration file
ps aux | grep -i nginx 

// be aware that at the end of the default conf, the /etc/nginx/conf.d/*.conf files are usually included
// means that they're loaded at the end of the main conf file
ls /etc/nginx/nginx.conf

