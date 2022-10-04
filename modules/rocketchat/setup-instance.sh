#!/bin/sh

# Note : These step assumes you are using the Amazon Linux 2 AMI for your instance.

# Update the installed packages and package cache on your instance.
sudo yum update -y

# Install the most recent Docker Engine package.
sudo amazon-linux-extras install docker

# Start the Docker service.
sudo service docker start

# (Optional) To ensure that the Docker daemon starts after each system reboot, run the following command:
sudo systemctl enable docker

# Adds the ec2-user to the docker group so you can execute Docker commands without using sudo.
sudo usermod -a -G docker ec2-user

# Log out and log back in again to pick up the new docker group permissions. You can accomplish this by closing your current SSH terminal window and reconnecting to your instance in a new one. Your new SSH session will have the appropriate docker group permissions.

# Verify that you can run Docker commands without sudo.
# docker info

# Note : In some cases, you may need to reboot your instance to provide permissions for the ec2-user to access the Docker daemon. Try rebooting your instance if you see the following error:
# Cannot connect to the Docker daemon. Is the docker daemon running on this host?

# Download Docker Compose.
wget https://github.com/docker/compose/releases/1.29.2/download/docker-compose-$(uname -s)-$(uname -m)

# Move the Docker Compose file into the system binaries.
sudo mv docker-compose-$(uname -s)-$(uname -m) /usr/local/bin/docker-compose

# Apply the right permissions.
sudo chmod -v +x /usr/local/bin/docker-compose

# Verify installation.
# docker-compose version

# Make directory for rocketchat
mkdir rocketchat && cd rocketchat

