mkdir ~/code-server && cd ~/code-server
wget https://github.com/cdr/code-server/releases/download/v3.5.0/code-server-3.5.0-linux-x86_64.tar.gz
tar -xzvf code-server-3.5.0-linux-x86_64.tar.gz 
sudo cp -r code-server-3.5.0-linux-x86_64 /usr/lib/code-server
sudo ln -s /usr/lib/code-server/code-server /usr/bin/code-server
sudo mkdir /var/lib/code-server
sudo cp -r ~/*/code-server.service /lib/systemd/system/
sudo systemctl start code-server
sudo systemctl status code-server
sudo systemctl enable code-server
sudo apt-get install nginx -y
sudo cp -r ~/*/code-server.conf /etc/nginx/sites-available/
rm -rf /etc/nginx/sites-enabled/default 
sudo ln -s /etc/nginx/sites-available/code-server.conf /etc/nginx/sites-enabled/code-server.conf
sudo nginx -t && sudo systemctl restart nginx
echo "Ready to rock..."