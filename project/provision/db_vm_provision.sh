sudo apt install -y apt-transport-https ca-certificates curl software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu bionic stable"
apt-cache policy docker-ce
sudo apt install -y docker-ce

systemctl start docker
systemctl enable docker

docker pull mysql:8
docker run -d --name mysql -p 3306:3306 -e MYSQL_ROOT_PASSWORD=secret -e MYSQL_DATABASE=mySchema mysql:8

# fi

# docker run -d --name mysql -p 3306:3306 -e MYSQL_ROOT_PASSWORD=secret -e MYSQL_DATABASE=mySchema mysql:8


# <Resource name="jdbc/confluence" auth="Container" type="javax.sql.DataSource"
#     username="mysql"
#     password="secret"
#     driverClassName="com.mysql.cj.jdbc.Driver"
#     url="jdbc:mysql://vm.db:3306/mySchema?useUnicode=true&amp;characterEncoding=utf8"
#     maxTotal="60"
#     maxIdle="20"
#     defaultTransactionIsolation="READ_COMMITTED"
#     validationQuery="Select 1"/>