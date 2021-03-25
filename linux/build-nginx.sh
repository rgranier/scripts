#!/bin/bash

WEB='bluesandtechnology.com'
USER='www-data'
DIR="/var/www/$WEB/html"

if [ -d "$DIR" ]; then
    echo "ERROR: This has already been run and needs cleanup."
    exit 1
fi

sudo mkdir -p $DIR
sudo chown -R $USER:$USER /var/www/$WEB/html

sudo chmod -R 755 /var/www/$powderblue

sudo echo "<html>
    <head>
        <title>Welcome to $WEB!</title>
    </head>
    <body>
        <h1>Success!  The example.com server block is working!</h1>
    </body>
</html>" >


sudo echo "server {
        listen 80;
        listen [::]:80;

        root /var/www/$WEB/html;
        index index.html index.htm index.nginx-debian.html;

        server_name $WEB www.$WEB;

        location / {
                try_files $uri $uri/ =404;
        }
}" > /etc/nginx/sites-available/$WEB


sudo ln -s /etc/nginx/sites-available/$WEB /etc/nginx/sites-enabled/
