#!/bin/bash
yum update -y
yum install httpd -y
systemctl start httpd
systemctl enable httpd
touch /var/www/html/index.html
echo "<h1> I am at $(hostname -f) </h1>" > /var/www/html/index.html