#!/bin/bash

sudo apt-get update
sudo apt-get install nginx -y
echo '<html><body><h1>hello Pavle pavle Pavle</h1></body></html>' | sudo tee /var/www/html/index.html