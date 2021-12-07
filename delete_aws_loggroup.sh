LOGGROUP_NAME=$1
for logName in `aws logs describe-log-groups |grep $LOGGROUP_NAME|grep logGroupName|cut -d'"' -f4`; do echo delete $logName;aws logs delete-log-group --log-group-name $logName;done
