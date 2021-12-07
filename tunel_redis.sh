#!/bin/bash
DB_ENDPOINT=$1
EC2_IP=$2
if [ -z ${DB_ENDPOINT} ];then
  DB_ENDPOINT=`aws elasticache describe-cache-clusters --show-cache-node-info|grep Address| tail -n 1|cut -d'"' -f4`
fi
if [ -z ${EC2_IP} ];then
  EC2_IP=`aws ec2 describe-instances|grep PublicIp|tail -n 1|cut -d'"' -f4`
fi
echo "ssh -N -L 6379:$DB_ENDPOINT:6379 ec2-user@${EC2_IP}"
echo "Runing ..."
echo "redis-cli -h localhost"
ssh -N -L 6379:$DB_ENDPOINT:6379 ec2-user@${EC2_IP}
