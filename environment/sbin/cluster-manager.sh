#!/bin/bash
SHELL_HOME=$(cd $(dirname ${BASH_SOURCE:-$0});pwd)
source ${SHELL_HOME}/bigdata_env.sh

hdfs_init(){
    hdfs namenode -format
}

hive_init(){
    cd ${HIVE_HOME}
    rm -f ${HIVE_HOME}/lib/guava-*.jar
    cp ${HADOOP_HOME}/share/hadoop/common/lib/guava-*.jar ${HIVE_HOME}/lib/
    schematool -initSchema -dbType derby
}

nodemanager_start(){
    yarn --daemon start nodemanager
}

nodemanager_stop(){
    yarn --daemon stop nodemanager
}

resourcemanager_start(){
    yarn --daemon start resourcemanager
}

resourcemanager_stop(){
    yarn --daemon stop resourcemanager
}

namenode_start(){
    hdfs --daemon start namenode
}

namenode_stop(){
    hdfs --daemon stop namenode
}

datanode_start(){
    hdfs --daemon start datanode
}

datanode_stop(){
    hdfs --daemon stop datanode
}

hadoop_start() {
    nodemanager_start
    resourcemanager_start
    namenode_start
    datanode_start
}

hadoop_stop() {
    datanode_stop
    namenode_stop
    resourcemanager_stop
    nodemanager_stop
}

hive_start(){
    cd $HIVE_HOME
    nohup hive --service metastore &
}

hive_stop(){
    PIDS=$(ps -ef|grep -w "Dproc_metastore" | grep -v grep | awk '{print $2}')
    [[ ! -z "$PIDS" ]] && kill ${PIDS}
}

spark_start(){
    start-master.sh
    start-slave.sh spark://`hostname`:7077
}

spark_stop(){
    stop-slave.sh
    stop-master.sh
}

shell() {
    while read -p "command> " cmd
    do
      $cmd
    done
}


