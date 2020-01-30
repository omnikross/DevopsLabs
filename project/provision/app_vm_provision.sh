[ ! -d /opt/atlassian/confluence7_1_0/ ] && /vagrant/distro/atlassian-confluence-7.1.0-x64.bin -q -varfile /vagrant/provision/response.varfile
cp /vagrant/distro/server.xml /opt/atlassian/confluence7_1_0/conf/server.xml 
cp /vagrant/distro/mysql-connector.deb /opt/atlassian/confluence7_1_0/lib
 
touch /lib/systemd/system/confluence.service
echo "[Unit]
Description=Confluence
After=network.target

[Service]
Type=forking
User=confluence
PIDFile=/opt/atlassian/confluence7_1_0/work/catalina.pid
ExecStart=/opt/atlassian/confluence7_1_0/bin/start-confluence.sh
ExecStop=/opt/atlassian/confluence7_1_0/bin/stop-confluence.sh
TimeoutSec=200
LimitNOFILE=4096
LimitNPROC=4096

[Install]
WantedBy=multi-user.target" >> /lib/systemd/system/confluence.service
chmod 664 /lib/systemd/system/confluence.service

#  sudo /etc/init.d/confluence start
systemctl daemon-reload
systemctl enable confluence
systemctl start confluence
systemctl status confluence
