# as root, install nginx
yum -y install nginx

#  create a location for your web root from which you willll serve data 
mkdir /var/www

# put a file in the web root directory so we can later verify nginx is serving content
echo 'nginx test' > /var/www/index.html

chown -R nginx:nginx /var/www
chmod 775 /var/www

#  start nginx
nginx

# start nginx with a specific config file 
nginx -c /etc/nginx/nginx.conf.testing

#  to reload nginx
nginx -s reload

#  to terminate nginx fatally
nginx -s stop

#  to terminate nginx while letting current requests finish
nginx -s quit

#  to test the configuration files
nginx -t 

#  see the process and what it is using for a configuration file
ps aux | grep -i nginx 

#  be aware that at the end of the default conf, the /etc/nginx/conf.d/*.conf files are usually included
#  means that they are loaded at the end of the main conf file
ls /etc/nginx/nginx.conf

# SAMPLE NGINX CONF FILE


user              nginx;
worker_processes  1;

error_log  /var/log/nginx/error.log;
#error_log  /var/log/nginx/error.log  notice;
#error_log  /var/log/nginx/error.log  info;

pid        /var/run/nginx.pid;


events {
    worker_connections  1024;
}


http {
    include       /etc/nginx/mime.types;
    default_type  application/octet-stream;

    log_format  main  '$remote_addr - $remote_user [$time_local] "$request" '
                      '$status $body_bytes_sent "$http_referer" '
                      '"$http_user_agent" "$http_x_forwarded_for"';

    access_log  /var/log/nginx/access.log  main;

    sendfile        on;
    #tcp_nopush     on;

    #keepalive_timeout  0;
    keepalive_timeout  65;

    #gzip  on;
    
    # Load config files from the /etc/nginx/conf.d directory
    # The default server is in conf.d/default.conf
    # include /etc/nginx/conf.d/*.conf;

    server {
      location / {
        root /var/www; 
      } 
    }

}

