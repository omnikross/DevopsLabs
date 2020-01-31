sudo apt-get update
sudo apt-get -y remove docker docker-engine docker.io
sudo apt -y install docker.io
sudo systemctl start docker
sudo systemctl enable docker
docker --version
usermod -a -G docker vagrant

docker build -t  wordpress .
docker rm $(docker ps -a -q)

docker run --name mylabwordpress-container -p 80:80 -d wordpress
