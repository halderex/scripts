sudo useradd -m AzDevOps
sudo usermod -a -G docker AzDevOps
sudo usermod -a -G adm AzDevOps
sudo usermod -a -G sudo AzDevOps

sudo chmod -R +r /home
setfacl -Rdm "u:AzDevOps:rwX" /home
setfacl -Rb /home/AzDevOps

sudo su -c "echo 'AzDevOps  ALL=(ALL) NOPASSWD:ALL' | sudo tee /etc/sudoers.d/01_AzDevOps && chmod 0440 /etc/sudoers.d/01_AzDevOps"

sudo ln -s /datadisks/disk1 /agent
sudo chmod 775 /datadisks/disk1
sudo chown -R AzDevOps:AzDevOps /datadisks/disk1
