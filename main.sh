#!/bin/bash
input="domains.txt"

while true; do
    read -p "Create directories of configured domains? [y/n]" yn
    case $yn in
        [Yy]* ) make_dir=true; break;;
        [Nn]* ) make_dir=false; break;;
        * ) echo "Please answer yes or no.";;
    esac
done

while read -r domain
do
        echo "Enter domain template name (e.g. example.com)"
        read template_domain
        cp /etc/nginx/sites-available/$template_domain.conf /etc/nginx/sites-available/$domain.conf
        sed -i "s/$template_domain/$domain/g" /etc/nginx/sites-available/$domain.conf
        ln -s /etc/nginx/sites-available/$domain.conf /etc/nginx/sites-enabled/
        if [ "$make_dir" = true ] ; then
                mkdir /var/www/$domain
        fi
done
