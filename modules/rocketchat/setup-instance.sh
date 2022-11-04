#!/usr/bin/env bash

# Note : These step assumes you are using the Amazon Linux 2 AMI for your instance.
# https://docs.aws.amazon.com/AmazonECS/latest/developerguide/create-container-image.html#create-container-image-install-docker

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

# Download Docker Compose.
sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose

# Apply the right permissions.
sudo chmod +x /usr/local/bin/docker-compose
