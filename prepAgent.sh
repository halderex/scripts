# Reference and background:
# https://github.com/microsoft/azure-pipelines-agent/issues/3461

# Create AzDevOps user. Copied from enableagent.sh script
sudo useradd -m AzDevOps
sudo usermod -a -G docker AzDevOps
sudo usermod -a -G adm AzDevOps
sudo usermod -a -G sudo AzDevOps

# Set permissions on home directory
sudo chmod -R +r /home
setfacl -Rdm "u:AzDevOps:rwX" /home
setfacl -Rb /home/AzDevOps

# Add AzDevOps to sudoers
sudo su -c "echo 'AzDevOps  ALL=(ALL) NOPASSWD:ALL' | sudo tee /etc/sudoers.d/01_AzDevOps && chmod 0440 /etc/sudoers.d/01_AzDevOps"

# Create agent directory. Set permissions and owner
sudo mkdir /agent && chmod 775 /agent
sudo chown -R AzDevOps:AzDevOps /agent

# Create _work folder on data disk and set ENV
sudo mkdir /datadisks/disk1/_work
sudo chown -R AzDevOps:AzDevOps /datadisks/disk1/_work
sudo echo "export VSTS_AGENT_INPUT_WORK=/datadisks/disk1/_work" >> /etc/profile.d/agent_env_vars.sh