#!/bin/bash

git pull
sudo rm -r /var/www/html/dev-docs.apolloeic.com/public_html/dataservices/
sudo mkdir /var/www/html/dev-docs.apolloeic.com/public_html/dataservices
bundle exec middleman build --clean
sudo cp -r ~/Documents/slate/build/* /var/www/html/dev-docs.apolloeic.com/public_html/dataservices/
sudo systemctl restart httpd.service

