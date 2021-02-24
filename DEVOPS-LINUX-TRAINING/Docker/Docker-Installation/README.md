### How to install docker on ubuntu
sudo apt-get update
apt-get remove docker docker-engine docker.io
apt install docker.io
systemctl start docker
systemctl enable docker
docker --version

install docker
sudo apt-get update && \
    sudo apt-get install docker.io -y