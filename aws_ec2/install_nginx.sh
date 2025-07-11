#!/bin/bash
# Install Nginx on the EC2 instance
sudo apt-get update -y
sudo apt-get install nginx -y

# Start Nginx service
sudo systemctl start nginx

# Enable Nginx to start on boot
sudo systemctl enable nginx

echo "<h1> Vah, Nginx has been installed and started successfully! using terraform </h1>" > /var/www/html/index.html