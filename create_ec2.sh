#!/bin/bash

# Variables
# Filename for logging
_currentDate=`date -u "+%Y%m%d-%H%M%S-%Z" | tr [A-Z] [a-z]`
_logsDir="${HOME}/Documents/awscli-logs"   # ex: /Users/anshul.rathour/Documents/awscli-logs/
_logFile="awscli-ec2-create-$_currentDate.log"

# awscli parameters. These need to be updated
_imageid="ami-46c1b650"
_ec2type="t2.micro"
_key="aws-sshkey2"
_sec_group_id="sg-7643xxxx"
_block_dev_map="file:///Users/anshul/codes/aws-scripts/mapping.json"
_subnet="subnet-e8b79xxx"
_user_data="file://<complete-path where file is located on your system>install_dependencies.sh"

# Run awscli command to spin up new ec2-instance

aws ec2 run-instances \
--image-id $_imageid \
--count 1 \
--instance-type $_ec2type \
--key-name $_key \
--security-group-ids $_sec_group_id \
--block-device-mappings $_block_dev_map \
--subnet-id $_subnet \
--user-data $_user_data \
--output json >> ${_logsDir}/${_logFile}
