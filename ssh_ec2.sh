#!/bin/bash
EC2_IP=$1
if [ -z ${EC2_IP} ];then
  EC2_IP=`aws ec2 describe-instances|grep PublicIp|tail -n 1|cut -d'"' -f4`
fi
echo "ssh ec2-user@${EC2_IP}"
echo "Runing ..."
ssh  ec2-user@${EC2_IP}
