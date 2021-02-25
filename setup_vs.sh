mkdir ~/code-server && cd ~/code-server
wget https://github.com/cdr/code-server/releases/download/v3.9.0/code-server_3.9.0_amd64.deb
sudo chmod u+x code-server_3.9.0_amd64.deb
sudo dpkg -i code-server_3.9.0_amd64.deb
sudo cp -r ~/*/code-server.service /lib/systemd/system/
sudo systemctl start code-server
sudo systemctl status code-server
sudo systemctl enable code-server
sudo apt-get install nginx -y
sudo cp -r ~/*/code-server.conf /etc/nginx/sites-available/
sudo unlink /etc/nginx/sites-enabled/default
sudo ln -s /etc/nginx/sites-available/code-server.conf /etc/nginx/sites-enabled/
sudo nginx -t && sudo systemctl restart nginx
echo "Ready to rock..."
