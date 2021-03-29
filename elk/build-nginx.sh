#!/bin/bash
USAGE='usage:  build-nginx.sh -w <website_name> [-h]'
# Default
#WEB='bluesandtechnology.com'

#TODO:  if you enter program <any argument> then it satisfies the test
#for one argument but does not set $WEB.

while getopts w:h flag
do
    case "${flag}" in
        w) WEB=${OPTARG}
           echo "Website: $WEB";;
        h) echo $USAGE
           exit 1;;
        \?) echo $USAGE; exit 1;;

    esac
done

USER='www-data'
DIR="/var/www/$WEB/html"

if (( $# < 1 )); then
    echo "$USAGE"
    exit 1
fi

if [ -z $WEB ]; then
    echo "$USAGE"
    exit 1
fi

if [ -d "$DIR" ]; then
    echo "ERROR: Found $DIR.  This has already been run and needs cleanup."
    exit 2
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
