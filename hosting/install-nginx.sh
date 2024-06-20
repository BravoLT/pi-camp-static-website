
sudo apt update

sudo apt install git -y

sudo apt install nginx -y

systemctl status nginx

sudo rm /var/www/html/index.nginx-debian.html

sudo ./update-nginx-source.sh

ls -lht /var/www/html/