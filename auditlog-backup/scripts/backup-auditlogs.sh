#!/bin/bash
clear
DATE=$(date +%Y%m%d-T%H%M%S)
echo "Retrieving Master nodes"
oc get nodes |grep master |cut -b 1-20 >servers.txt
for server in $(cat servers.txt) ; do
 oc adm node-logs --path=/openshift-apiserver/ $server > auditlog.txt
  for auditlog in $(cat auditlog.txt) ; do
    oc adm node-logs --path=/openshift-apiserver/$auditlog $server > $server-$auditlog
    echo "Collecting audit log $auditlog from $server"
 done
done
rm servers.txt
rm auditlog.txti
rm audit.log
