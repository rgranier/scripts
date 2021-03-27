#!/bin/bash
USAGE='usage:  $(basename $0) -w <website_name> [-h]'
# Default
#WEB='bluesandtechnology.com'

while getopts w:h flag
do
    case "${flag}" in
        w) WEB=${OPTARG};;
        h) echo $USAGE;;
        \?) echo $USAGE
    esac
done

echo "Website: $WEB";

USER='www-data'
DIR="/var/www/$WEB/html"

if [ -d "$DIR" ]; then
    echo "ERROR: This has already been run and needs cleanup."
    exit 1
fi

sudo mkdir -p $DIR
sudo chown -R $USER:$USER /var/www/$WEB/html

sudo chmod -R 755 /var/www/$WEB

sudo echo "<html>
    <head>
        <title>Welcome to $WEB!</title>
    </head>
    <body>
        <h1>Success!</h1>
        <h3>$WEB server block is working!</h3>
    </body>
</html>" > /var/www/$WEB/html/index.html


sudo echo "server {
        listen 80;
        listen [::]:80;

        root /var/www/$WEB/html;
        index index.html index.htm index.nginx-debian.html;

        server_name $WEB www.$WEB;

        location / {
                try_files \$uri \$uri/ =40;
        }
}" > /etc/nginx/sites-available/$WEB


sudo ln -s /etc/nginx/sites-available/$WEB /etc/nginx/sites-enabled/
