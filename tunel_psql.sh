#!/bin/bash
DB_ENDPOINT=$1
EC2_IP=$2
if [ -z ${DB_ENDPOINT} ];then
  DB_ENDPOINT=`aws rds describe-db-instances|grep Address| tail -n 1|cut -d'"' -f4`
fi
if [ -z ${EC2_IP} ];then
  EC2_IP=`aws ec2 describe-instances|grep PublicIp|tail -n 1|cut -d'"' -f4`
fi
echo "ssh -N -L 5432:$DB_ENDPOINT:5432 ec2-user@${EC2_IP}"
echo "Runing ..."
echo "psql -h localhost -U postgres -W messagepay"
ssh -N -L 5432:$DB_ENDPOINT:5432 ec2-user@${EC2_IP}
