#!/bin/bash
input="domains.txt"

echo "Create directories for configured domains?"
select yn in "Yes" "No"; do
    case $yn in
        Yes ) make_dir = true; break;;
        No ) make_dir = false; exit;;
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
