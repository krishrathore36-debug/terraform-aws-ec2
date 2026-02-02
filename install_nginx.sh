#!/bin/bash
set -ex

apt-get update -y
apt-get install -y nginx

systemctl enable nginx
systemctl start nginx

echo "<h1>Terraform In One Shot</h1>" > /var/www/html/index.html
