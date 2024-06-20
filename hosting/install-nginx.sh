
sudo apt update

sudo apt install git -y

sudo apt install nginx -y

sudo systemctl status nginx

sudo rm /var/www/html/index.nginx-debian.html

sudo ./update-nginx-source.sh
