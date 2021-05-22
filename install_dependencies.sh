#!/bin/bash

#Install, start the service and  docker
yum update -y
yum install docker -y
systemctl start docker
systemctl enable docker

#Install git
yum install -y git

#Installing AWS CLI
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install

# Make a directory and make changes
mkdir citymall
cd citymall/
git clone git@github.com:Anshul-Rathour/react-express-app.git
cd react-express-app/
docker build . -t citymall_app
docker run -p 3000:3000 citymall-app
