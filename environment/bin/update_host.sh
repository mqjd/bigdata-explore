#!/bin/bash

hadoop(){
    sed -i "s/{{hostname}}/`hostname`/g" /opt/hd/conf/hadoop/core-site.xml
    sed -i "s/{{hostname}}/`hostname`/g" /opt/hd/conf/hadoop/hdfs-site.xml
}

hive(){
    sed -i "s/{{hostname}}/`hostname`/g" /opt/hd/conf/hive/hive-site.xml
}

spark(){
    sed -i "s/{{hostname}}/`hostname`/g" /opt/hd/conf/spark/hive-site.xml
}

for cmd in ${*}; do
    $cmd
done