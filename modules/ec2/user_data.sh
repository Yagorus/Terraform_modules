#!/bin/bash
yum update -y
yum install -y httpd
myip=`curl http://169.254.169.254/latest/meta-data/local-ipv4`
echo "<h2>WebServer with IP: $myip</h2> build by Terraform" > /var/www/html/index.html
sudo service httpd start
chkcinfig httpd on