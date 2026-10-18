#!/bin/bash
sudo dnf update -y
sudo dnf install -y httpd
sudo systemctl start httpd
sudo systemctl enable httpd
echo "<h1>Hello from Web Server Host: \$(hostname -f)</h1>" > /var/www/html/index.html
while true; do true; done &
