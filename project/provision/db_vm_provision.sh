# sudo apt install -y apt-transport-https ca-certificates curl software-properties-common
# curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
# sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu bionic stable"
# apt-cache policy docker-ce
# sudo apt install -y docker-ce

# systemctl start docker
# systemctl enable docker

# docker pull mysql:8
# docker run -d --name mysql -p 3306:3306 -e MYSQL_PASSWORD=secret -e MYSQL_USER=name -e MYSQL_DATABASE=mySchema mysql:8
# $ docker run --name containerMysql -e MYSQL_ROOT_PASSWORD=pass -d mysql:8

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
sudo apt install -y apt-transport-https ca-certificates curl software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu bionic stable"
apt-cache policy docker-ce
sudo apt install -y docker-ce

systemctl start docker
systemctl enable docker
systemctl status docker

echo "Downloading Docker-Compose"
curl -L "https://github.com/docker/compose/releases/download/1.25.0/docker-compose-$(uname -s)-$(uname -m)" 2>/dev/null -o /usr/local/bin/docker-compose && echo "Docker-Compose downloaded succesfuly"
sudo chmod +x /usr/local/bin/docker-compose
sudo ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose
docker-compose --version

# створення файлика докер компоуза і запис в нього налаштувань
touch docker-compose.yml
echo "version: '2'
services:
  db:
    image: mysql/mysql-server:5.7
    restart: always
    environment:
      MYSQL_ROOT_PASSWORD: 'root'
      MYSQL_DATABASE: 'db'
      MYSQL_USER: 'user'
      MYSQL_PASSWORD: 'password'
      LOG_FILE: \"/var/logs/mysql.log\"
    ports:
      - '3306:3306'
    expose:
      - '3306'
    volumes:
      - \"./.mysql-data/db:/var/lib/mysql\"      
    command: [mysqld, --character-set-server=utf8, --collation-server=utf8_bin, --default-storage-engine=INNODB, --max_allowed_packet=256M, --innodb_log_file_size=2GB, --transaction-isolation=READ-COMMITTED, --binlog_format=row, --general-log=1, --general-log-file=/var/log/general-log.log]
  " >> docker-compose.yml

# запуск докер компоуза
docker-compose up -d db