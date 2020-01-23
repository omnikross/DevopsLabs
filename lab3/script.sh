
sudo apt-get install lvm2 -y

sudo pvcreate /dev/sdb /dev/sdc /dev/sdd /dev/sde 

sudo vgcreate vg00 /dev/sdb /dev/sdc /dev/sdd /dev/sde

sudo lvcreate -n vol1 -L600M vg00
sudo lvcreate -n vol2 -L600M vg00

sudo mkdir /mnt/vol1
sudo mkdir /mnt/vol2
sudo mkfs.ext4 /dev/vg00/vol1 
sudo mkfs.ext4 /dev/vg00/vol2 
sudo mount -t ext4 /dev/vg00/vol1 /mnt/vol1 
sudo mount -t ext4 /dev/vg00/vol2 /mnt/vol2 

mount | tac | head -2 
